<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/xadmin.css">
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <blockquote class="layui-elem-quote">欢迎管理员：
        <span class="x-red">${user.sysUserName}</span>！当前时间:
        <span id="datetime"></span>
        <script>
            setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
        </script>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据统计</legend>
        <div class="layui-field-box">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                            <div carousel-item="">
                                <ul class="layui-row layui-col-space10 layui-this" id="info">
                                    <%--<li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>文章数</h3>
                                            <p>
                                                <cite>66</cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>会员数</h3>
                                            <p>
                                                <cite>12</cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>回复数</h3>
                                            <p>
                                                <cite>99</cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>访问数</h3>
                                            <p>
                                                <cite>67</cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>友链数</h3>
                                            <p>
                                                <cite>67</cite></p>
                                        </a>
                                    </li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>系统通知</legend>
        <div class="layui-field-box">
            <table class="layui-table" lay-skin="line">
                <tbody>
                <tr>
                    <td >
                        <a class="x-a" href="#" target="_blank">贰月小巷-管理后台</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>系统信息</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody >
                <tr>
                    <th>博客版本</th>
                    <td>1.0</td></tr>
                <tr>
                    <th>域名</th>
                    <td>www.xhanglog.cn</td></tr>
                <tr>
                    <th>操作系统</th>
                    <td>Linux(CentOS)</td></tr>
                <tr>
                    <th>运行环境</th>
                    <td>Tomcat 8.0 </td></tr>
                <tr>
                    <th>JDK版本</th>
                    <td>1.8</td></tr>
                <tr>
                    <th>MYSQL版本</th>
                    <td>5.6</td></tr>
                </tbody>
            </table>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>开发团队</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>版权所有</th>
                    <td>贰月小巷
                        <a href="http://www.xhanglog.cn" class='x-a' target="_blank">访问主页</a></td>
                </tr>
                <tr>
                    <th>开发者</th>
                    <td>贰月小巷(blogxiaohang@163.com)</td></tr>
                </tbody>
            </table>
        </div>
    </fieldset>
</div>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script>
    /*var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();*/

    $(function() {
        $.post({
            url: "${pageContext.request.contextPath}/admin/initHome",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "",
            success: function (data) {
                $("#info").empty();
                for (var i = 0; i < data.length; i++) {
                    $("#info").append('<li class="layui-col-xs2"><a href="javascript:;" class="x-admin-backlog-body"><h3>'
                    +data[i].name+'</h3><p><cite>'+data[i].count+'</cite></p> </a></li>');
                }
            }
        });
    });
</script>

</body>
</html>