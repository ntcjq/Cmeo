
//******************************************************
/**
* 删除/修改 数据前的检查与提示
*/
//******************************************************
function delConfirm( message ){
    if(message == null){
        message = "确定要删除数据吗？";
    }
    return window.confirm(message);
}



//******************************************************
/**
* 页面加载完成后要执行的操作
*/
//******************************************************
$(function(){
	
	// 让主窗口的title与当前操作的（右侧的）窗口的title一致
	parent.document.title = "移动电子运维- " + document.title;
	
//	// 在文本框中显示提示语，提示语由 showText 属性指定
//	$("input[type=text][showText]").each(function(){
//		this.value = $(this).attr("showText");
//	});

	// 设置所有的文本框在选中时，选中文本框中的文本
	$("input[type=text]").each(function(){;
		// this.onFocus = function() { this.select(); }; // 用这行代码不起作用!?
		$(this).focus(function(){ // 改用jQuery实现
			this.select();
		});
	});

	// 
});


