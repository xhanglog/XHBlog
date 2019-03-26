layui.config({
	base : "js/"
}).use(['form','layer'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		$ = layui.jquery;
	//登录按钮事件
	form.on("submit(login)",function(data){
		window.location.href = "/background/index.jsp";
		return false;
	})
})
