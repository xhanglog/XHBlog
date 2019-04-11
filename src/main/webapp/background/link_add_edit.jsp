<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/background/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/background/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/background/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/background/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/background/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/background/ueditor/lang/zh-cn/zh-cn.js"></script>

</head>

<body class="layui-anim layui-anim-up">
<div class="x-body">
    <form class="layui-form" action="" method="">
        <input type="hidden" name="id" value="${link.id}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">友链名称：</label>
            <div class="layui-input-block">
                <input type="text" name="linkName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${link.linkName}"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">友链地址：</label>
            <div class="layui-input-block">
                <input type="text" name="linkUrl" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${link.linkUrl}"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">链接所有者昵称：</label>
            <div class="layui-input-block">
                <input type="text" name="linkOwnerNickname" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${link.linkOwnerContact}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式：</label>
            <div class="layui-input-block">
                <input type="text" name="linkOwnerContact" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${link.linkOwnerContact}">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">链接描述：</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="linkDescription" class="layui-textarea">${link.linkDescription}</textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">友链状态：</label>
            <div class="layui-input-block">
                <input type="radio" name="linkStatus" value="true" title="显示" checked="">
                <input type="radio" name="linkStatus" value="false" title="隐藏" >
                <input type="hidden" id="linkStatus" value="${link.linkStatus}"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">首页显示：</label>
            <div class="layui-input-block">
                <input type="radio" name="showIndex" value="true" title="是" checked="">
                <input type="radio" name="showIndex" value="false" title="否" >
                <input type="hidden" id="showIndex" value="${link.showIndex}"/>
            </div>
        </div>

        <div class="layui-form-item" style="padding-top: 16px">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formsub">立即提交</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" charset="utf-8">
    layui.use(['layer','form'], function() {
        var $ = layui.jquery
            ,form = layui.form
            ,layer = layui.layer;
        form.on('submit(formsub)', function(data) {
            var param=data.field;
            $.post({
                url: '${pageContext.request.contextPath}/link/addOrEdit',
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                data:JSON.stringify(param),
                success: function(res) {
                    if(res.code == 0) {
                        layer.alert(res.msg,{icon:1});
                    }else{
                        layer.alert(res.msg,{icon: 5});
                    }
                }
            });
            return false;
        });
    });
    $(function() {
        var linkStatus = $("#linkStatus").val();
        var showIndex = $("#showIndex").val();
        if(linkStatus != '' && showIndex != ''){
            $("input:radio[name='linkStatus'][value="+linkStatus+"]").attr('checked','true');
            $("input:radio[name='showIndex'][value="+showIndex+"]").attr('checked','true');
        }
    });

</script>
</body>

</html>