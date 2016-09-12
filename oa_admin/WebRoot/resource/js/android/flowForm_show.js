/**
 * 流程表单控件插件
 * 
 * android 精简 展示版  只用于 show
 * 
 * 去除表单控件 
 */

$(function(){
	var $div=$("#flowForm");
	//展示模式 打印界面 去掉输入控件 
	
	$("input[type='text'],textarea",$div).each(function(){
		
		$(this).after($(this).val()).remove();
		
	});
	$("select",$div).each(function(){
		var $this=$(this);
		var v=$this.val();
		if(v!=""){
			$this.after($("option[value='"+v+"']",$this).text());
		}
		$this.remove();
	});
	
	//单选，多选，待完善
	$("input[type='radio'],input[type='checkbox']",$div).each(function(){
		
		if($(this).prop("checked")){
				
			};
		
	});
	
	//去除一些按钮
	$(".btnDel",$div).remove();
	$(".addItem",$div).remove();
})