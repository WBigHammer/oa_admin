
/**
 * 查询 刷新 datagrid数据
 * @param {} form
 * @param {} datagrid
 */
function datagridSearch(form,datagrid){
	var $dg=$('#'+datagrid);
	var $form=$(form);
	var options=$dg.datagrid('options');
	var queryParams = options.queryParams;//获取原查询参数
	var mustParamNames=options["mustParamNames"];//获取每次查询必须添加的参数名称,拓展属性，非easyui属性
	var param={};//刷新数据需要的参数
	if(mustParamNames){
		var names=mustParamNames.split(",");
		for(var i=0,k=names.length;i<k;i++){
			var name=names[i];
			param[name]=queryParams[name];//添加必须参数
		}
	}
	var filterId=$form.attr("queryFilterId");
	var formatFilterData=$form.attr("formatFilterData");//添加此属性说明将表单查询内容按照过滤器的规则封装数据
	
	if(filterId&&$.fn.queryFilter){
		 //高级查询 有查询规则过滤器的
		if(formatFilterData){
			//需要将表单内的数据也添加到过滤规则里面，将条件添加在第一分组条件
			var d=$("#"+filterId).queryFilter("getData");
			if(d["rules"]&&d["rules"].length>0){
				d["rules"].push(formatData());
			}else{
				d["rules"]=formatData();
			}
			param['searchRules']=JSON.stringify(d);
		}else{
			param['searchRules']=JSON.stringify($("#"+filterId).queryFilter("getData"));
		}
	}else{
		//delete queryParams['searchRules'];
		//普通条件查询, 序列化form表单的搜索条件
		if(formatFilterData){
			//需将表单数据封装成json格式规则条件
			param['searchRules']=JSON.stringify({"rules":formatData()});
			
		}else{
			$.each($form.serializeArray(), function(index) {
				if (param[this['name']]) {
					param[this['name']] = param[this['name']] + "," + this['value'];
				} else {
					param[this['name']] = this['value'];
				}
			});
		}
		
	}
	function formatData(){
		var rules=[];
		$("[name]",$form).each(function(){
			 var $this=$(this);
			 var v=$this.val().trim();
     		 if(v!=""){
     			 var name=$this.attr("name");
     			 var old=getData(rules,name);//获取name 相同的原数据
     			 if(old){
     				old['value'] = old['value'] + "," + v;
     			 }else{
     				 var type=$this.attr("fieldType")||"string";//默认字符串
         			 var op=$this.attr("op")||"equal";//默认运算符
         			 var rule={};
         			 rule["field"]=name;
         			 rule["op"]=op;
         			 rule["value"]=v;
         			 rule["type"]=type;
         			 rules.push(rule);
     			 }
     		 }
		});
		return rules;
	}
	function getData(data,name){
		for(var i=0,k=data.length;i<k;i++){
			var o=data[i];
			if(o["name"]==name){
				return o;
			}
		}
	}
	$dg.datagrid('load', param);//刷新表格数据
	return false;
}

/**
 * ajax表单提交  
 * form 拓展属性：   
 * warn: 表单提交前提示
 * beforeCallback  表单提交前调用js方法名称，传入当前form对象作为参数，此方法返回true，表单继续提交，false，阻止表单提交
 * afterCallback   表单提交完成，返回操作成功之后的回调方法， 传入from ，json格式返回的信息两个参数
 * @param {} form
 * @param {String} confirmMsg 确认信息
 * @param {} callback  表单提交之后的回调方法
 * @return {Boolean}
 */
function validateSubmitForm(form){
	var $form=$(form);
	if($form.attr("target")=="callbackframe"){
		//上传文件使用隐藏iframe提交表单,已准备好iframe，可以提交表单
		$.messager.progress({
			text : '表单提交中...'
		});
		//禁用表单提交按钮,将按钮文字改为提交中,并记录原文字
		$("button:submit",$form).each(function(){
			$(this).prop("disabled",true).addClass("disabled").attr("oldText",$(this).text()).text("提交中");
		});
		return true;
	}
	if(!$form.form("validate")){
		Msg.alert("提示","表单填写不完整!",'warning');
		return false;
	}
	
	if($form.attr("beforeCallback")){
		var $beforeCallback=eval('(' + $form.attr("beforeCallback") + ')');
		if(!$beforeCallback($form))return false;
	}
	
	var _submitFn = function(){
		if("multipart/form-data"==$(form).attr("enctype")){
			iframeCallback($form,submitSuccessCallback);
		}else{
			
			$.ajax({
				type: $form.attr("method") || 'POST',
				url:$form.attr("action"),
				data:$form.serializeArray(),
				dataType:"json",
				cache: false,
				success:function(json){
					if(json!=null){
						submitSuccessCallback(json);
					}else{
						Msg.alert("提示","表单提交无返回信息",'error');
					}
				},
				beforeSend:function(XMLHttpRequest){
					$.messager.progress({
						text : '表单提交中...'
					});
					//禁用表单提交按钮,将按钮文字改为提交中,并记录原文字
					$("button:submit",$form).each(function(){
						$(this).prop("disabled",true).addClass("disabled").attr("oldText",$(this).text()).text("提交中");
					});
				},
				complete:function(XMLHttpRequest, textStatus){
					//禁用表单提交按钮,将按钮文字改为提交中,并记录原文字
					$("button:submit",$form).each(function(){
						$(this).prop("disabled",false).removeClass("disabled").text($(this).attr("oldText"));
					});
					$.messager.progress('close');
				}
			});
		}
	}
	
	if ($form.attr("warn")){
		 Msg.confirm('提示',$form.attr("warn"), function(r){
               if (r){_submitFn();}
         });
	} else {
		_submitFn();
	}
	return false;
}

/**
 * 带文件上传的ajax表单提交
 * @param {Object} form
 * @param {Object} callback
 */
function iframeCallback($form, callback){
	$iframe = $("#callbackframe");
	
	if ($iframe.size() == 0) {
		$iframe = $("<iframe id='callbackframe' name='callbackframe' src='about:blank' style='display:none'></iframe>").appendTo("body");
	}
	//用ajax标示 说明需要返回json格式消息
	var url=$form.attr("action");
	if(url.indexOf("ajax=1")==-1){
		url=url+(url.indexOf('?') == -1 ? "?" : "&")+"ajax=1";
		$form.attr("action",url);
	}
	$form.attr("target","callbackframe");
	
	_iframeResponse($form,$iframe[0], callback);
	
}
function _iframeResponse($form,iframe, callback){
	var $iframe = $(iframe), $document = $(document);
	
	$iframe.on("load", function(event){
		$iframe.off("load");
		
		if (iframe.src == "javascript:'%3Chtml%3E%3C/html%3E';" || // For Safari
			iframe.src == "javascript:'<html></html>';") { // For FF, IE
			
			return;
		}
		var doc = iframe.contentDocument || iframe.document;

		// fixing Opera 9.26,10.00
		if (doc.readyState && doc.readyState != 'complete'){ 
			
			return;
		} 
		// fixing Opera 9.64
		if (doc.body && doc.body.innerHTML == "false") {
			
			return;
		}
	   
		var response;
		
		if (doc.XMLDocument) {
			// response is a xml document Internet Explorer property
			response = doc.XMLDocument;
		} else if (doc.body){
			try{
				response = $iframe.contents().find("body").text();
				response = jQuery.parseJSON(response);
			} catch (e){ // response is html document or plain text
				response = doc.body.innerHTML;
			}
		} else {
			// response is a xml document
			response = doc;
		}
		$form.removeAttr("target");$iframe.remove();
		$("button:submit",$form).each(function(){
			$(this).prop("disabled",false).removeClass("disabled").text($(this).attr("oldText"));
		});
		$.messager.progress('close');
		//判断服务器是否返回错误
		if(response!=null){
			callback(response);
		}else{
			Msg.alert('消息','服务器无返回结果，操作失败','error');
		}
	});
	$form.submit();//提交表单
	
}
/**
 * 表单提交成功回调
 * 
 */
function submitSuccessCallback(json){
	
	if(json.statusCode == MUI.statusCode.error) {
		Msg.alert('提示',json.message,'error');
		return false;
	} else if (json.statusCode == MUI.statusCode.timeout) {
		
		Msg.alert('提示',"抱歉，您已登陆超时!请重新登陆！",'error');
		
		return false;
	} else{
		
		$("#div_main").html('<div class="alert alert-success" style="width:100px;margin: 20px auto;">处理完成!</div>');
		
	}

}
