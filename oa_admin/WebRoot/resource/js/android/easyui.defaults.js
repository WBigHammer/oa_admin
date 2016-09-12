/**
 * 配置easyui 组件默认值
 */
 
/**
 *  组件加载完成之后
 */
$.parser.onComplete = function(context) {
	$.messager.progress('close');
};
/**
 * 使panel和datagrid在加载时提示
 *
 */
$.fn.panel.defaults.loadingMessage = '加载中...';
$.fn.datagrid.defaults.loadMsg = '加载中...';
/**
 * tab 加载完成之后初始化插件
 * @param {} panel
 */
$.fn.tabs.defaults.onLoad=function(panel){
	var $panel=$(panel);
	initUI($panel);
	$.messager.progress('close');
}


/**
 * dialog 加载完成之后初始化插件
 * 
 */
$.fn.dialog.defaults.onLoad=function(){
	initUI(this);
}
/**
 * window 加载完成之后初始化插件
 * 
 */
$.fn.window.defaults.onLoad=function(){
	
	initUI(this);
	
}

/**
 * datagrid 默认配置
 * 
 */
//一般不需要单独设置fitColumns属性，如果内容过多，大屏幕下也无法展示开，
//需要滚动条，那么在使用时将fitColumns设为false
if($(window).width()>1200){
	//当屏幕分辨率大于1200时默认宽度为100%，自动适应屏幕大小，
	$.fn.datagrid.defaults.fitColumns=true;
}else{
	//当屏幕分辨率比较小时，如果自动适应屏幕大小，不会出现滚动条，所以要设为false
	$.fn.datagrid.defaults.fitColumns=false;
}
$.fn.datagrid.defaults.pagination=true,//开启分页
$.fn.datagrid.defaults.fit= true,//自动填充父容器，可使分页工具条固定到底部
$.fn.datagrid.defaults.pageSize=20;//分页
$.fn.datagrid.defaults.pageList=[5,10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ];
$.fn.datagrid.defaults.border=false,//是否有边框
$.fn.datagrid.defaults.striped=true,//相邻两行颜色不同
$.fn.datagrid.defaults.idField='id',//指定标识字段
$.fn.datagrid.defaults.rownumbers=true,//显示行号
$.fn.datagrid.defaults.singleSelect=true,//行只单选
$.fn.datagrid.defaults.checkOnSelect=false,//是否选中某行时选中复选框
$.fn.datagrid.defaults.selectOnCheck=false,//是否选中复选框时选中所在行


$.fn.datagrid.defaults.onCheck=function(rowIndex,rowData){
	//当勾选多选框是 选中当前行
	$(this).datagrid("selectRow",rowIndex);	
}

/**
 * datagrid 加载完成之后初始化
 */
$.fn.datagrid.defaults.onLoadSuccess=function(data){
	MUI.ajaxDone(data);
	var $dg=$(this).closest(".datagrid");
	initUI($dg.find(".datagrid-view"));
	//只有当第一次加载的时候执行,为表格的工具添加datagrid属性，为url的占位提供
	//例：修改，需要动态获取用户选择的哪行，然后获取id，然后打开标签，或者弹出框
	if(!this.index){
		this.index=1;
		$($(this).attr("toolbar"),$dg).find("a[datagrid!=],button[datagrid!=]").attr("datagrid",this.id);
	}
	//解决行号数字超过1000，宽度不够，显示不开问题
	var $pager=$(this).datagrid("getPager");
	if($pager&&$pager.length==1){
		var options=$pager.pagination("options");
		var rowNum=(options.pageNumber)*(options.pageSize);
		if(rowNum>1000){
			var width=((rowNum+"").length-3)*10+25;
			$(".datagrid-header-rownumber,.datagrid-cell-rownumber",$dg).css("width",width+"px");
		}else{
			$(".datagrid-header-rownumber",$dg).css("width","25px");
		}
		
	}
	if(!this.allCheck){
		this.allCheck=$(".datagrid-header-check>input",$dg);
	}
	this.allCheck.prop("checked",false);//去除全选
}


/**
 *  dialog 弹出窗口组件 默认配置
 * 
 */
$.fn.dialog.defaults.width=800;
$.fn.dialog.defaults.height=400;
$.fn.dialog.defaults.collapsible=true;
$.fn.dialog.defaults.minimizable=true;
$.fn.dialog.defaults.maximizable=true;
$.fn.dialog.defaults.resizable=true;
//窗口关闭的时候移除底部任务
$.fn.dialog.defaults.onClose=function(){
	$(this).dialog("destroy");//关闭之后直接销毁
};


/**
 * 
 * 通用错误提示
 * 
 * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
 */
var easyuiErrorFunction = function(XMLHttpRequest, textStatus, errorThrown,title) {
		var html="<div>状态: " + XMLHttpRequest.status+"</div>" 
		+ "<div>信息: "+textStatus + "</div>"
		+ "<div>异常: "+errorThrown + "</div>";
		$.messager.progress('close');
		$.messager.alert(title,html,'error');
	}
$.fn.datagrid.defaults.onLoadError = function(XMLHttpRequest, textStatus, errorThrown) {
	easyuiErrorFunction(XMLHttpRequest, textStatus, errorThrown,"datagrid数据加载错误");
}
$.fn.treegrid.defaults.onLoadError = function(XMLHttpRequest, textStatus, errorThrown) {
	easyuiErrorFunction(XMLHttpRequest, textStatus, errorThrown,"treegrid数据加载错误");
}
$.fn.tree.defaults.onLoadError = function(XMLHttpRequest, textStatus, errorThrown) {
	easyuiErrorFunction(XMLHttpRequest, textStatus, errorThrown,"tree数据加载错误");
}
$.fn.combogrid.defaults.onLoadError = function(XMLHttpRequest, textStatus, errorThrown) {
	easyuiErrorFunction(XMLHttpRequest, textStatus, errorThrown,"combogrid数据加载错误");
}
$.fn.combobox.defaults.onLoadError = function(XMLHttpRequest, textStatus, errorThrown) {
	easyuiErrorFunction(XMLHttpRequest, textStatus, errorThrown,"combobox数据加载错误");
}
$.fn.form.defaults.onLoadError = function(XMLHttpRequest, textStatus, errorThrown) {
	easyuiErrorFunction(XMLHttpRequest, textStatus, errorThrown,"form加载错误");
}

/**
 * 
 * 设置jQuery的AJAX全局默认选项
 * 设置全局ajax异常默认处理方法
 */
$.ajaxSetup({
	
	error : function(XMLHttpRequest, textStatus, errorThrown) {
			if ($.messager) {
				var html="<div>状态: " + XMLHttpRequest.status+"</div>" 
				+ "<div>信息: "+textStatus + "</div>"
				+ "<div>异常: "+errorThrown + "</div>";
				$.messager.progress('close');
				$.messager.alert('请求服务器错误',html,'error');
			}else{
				var html="状态: " + XMLHttpRequest.status+"\n" 
				+ "信息: "+textStatus + "\n"
				+ "异常: "+errorThrown + "\n";
				alert(html);
			}
	}
});

/**
 * 
 * 防止panel/window/dialog组件移动的时候超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	var l = left;
	var t = top;
	if (l < 1) {
		l = 1;
	}
	if (t < 1) {
		t = 1;
	}
	var width = parseInt($(this).parent().css('width')) + 14;
	var height = parseInt($(this).parent().css('height')) + 14;
	var right = l + width;
	var buttom = t + height;
	var browserWidth = $(window).width();
	var browserHeight = $(window).height();
	if (right > browserWidth) {
		l = browserWidth - width;
	}
	if (buttom > browserHeight) {
		t = browserHeight - height;
	}
	$(this).parent().css({/* 修正面板位置 */
		left : l,
		top : t
	});
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;
 


