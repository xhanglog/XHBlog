<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/lib/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/login.css" media="all" />
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<style type="text/css">
    body{
        background:url("${pageContext.request.contextPath}/static/background/images/login_bg.jpg") no-repeat 60% 1px;
    }
</style>
<body>
<div class="login">
    <h1>贰月小巷后台登录</h1>
    <form class="layui-form">
        <div class="layui-form-item">
            <input class="layui-input" name="sysUserName" placeholder="用户名" lay-verify="required" type="text" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="sysUserPassword" placeholder="密码" lay-verify="required" type="password" autocomplete="off">
        </div>
        <div class="layui-form-item form_code">
            <input class="layui-input" name="code" placeholder="验证码"  type="text" autocomplete="off">
            <div class="code"><a href=""><img src="${pageContext.request.contextPath}/validcode" width="116" height="36"></a></div>
        </div>
        <button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/background/lib/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['upload','layer','form'], function() {
        var $ = layui.jquery
            , upload = layui.upload
            ,form = layui.form
            ,layer = layui.layer;
        /**
         * 通用表单提交(AJAX方式)
         */
        form.on('submit(login)', function(data) {
            var param=data.field;
            $.post({
                url: '${pageContext.request.contextPath}/user/login',
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                data:JSON.stringify(param),
                success: function(res) {
                    if(res.code == 0) {
                        window.location.href = "${pageContext.request.contextPath}/admin/index.html";
                    }else{
                        layer.alert(res.msg,{icon: 5});
                    }
                }
            });
            return false;
        });
    });

    $(function(){
        function flushCode(){
            alert("1");
            $("a").click(function(){
                //浏览器带有缓存功能,不会多次请求相同数据
                $("img").attr("src","validcode?date="+new Date());
                return false;
            });
        }
    })
</script>
</body>
</html>