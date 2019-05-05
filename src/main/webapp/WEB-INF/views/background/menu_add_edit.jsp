<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>菜单添加修改页面</title>
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
        <input type="hidden" name="menuId" value="${menu.menuId}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">名称：</label>
            <div class="layui-input-block">
                <input type="text" name="menuName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${menu.menuName}"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序编号：</label>
            <div class="layui-input-block">
                <input type="text" name="menuSort" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${menu.menuSort}"/>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">描述：</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="menuDescription" class="layui-textarea">${menu.menuDescription}</textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-block">
                <input type="radio" name="available" value="true" title="显示" checked="">
                <input type="radio" name="available" value="false" title="隐藏" >
                <input type="hidden" id="available" value="${menu.available}"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">视图：</label>
            <div class="layui-input-block">
                <input type="radio" name="lookView" value="1" title="1" checked="">
                <input type="radio" name="lookView" value="2" title="2" >
                <input type="hidden" id="lookView" value="${menu.lookView}"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">上级菜单</label>
            <div class="layui-input-inline">
                <select name="pid" id="menuId" lay-verify="required" lay-search="">
                    <option value="0">直接选择或搜索选择</option>
                    <option value="1">学无止境</option>
                    <option value="2">一些资源</option>
                    <option value="3">说说别的</option>
                </select>
            </div>
        </div>
        <input type="hidden" id="menuId2" value="${menu.pid}"/>
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

        $("#menuId").val($('#menuId2').val());
        form.render('select');

        form.on('submit(formsub)', function(data) {
            var param=data.field;
            $.post({
                url: '${pageContext.request.contextPath}/admin/menu/addOrEdit',
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                data:JSON.stringify(param),
                success: function(res) {
                    if(res.code == 0) {
                        layer.alert(res.msg, {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            //刷新父窗口
                            window.parent.location.reload();
                        });
                    }else{
                        layer.alert(res.msg,{icon: 5});
                    }
                }
            });
            return false;
        });
    });
    $(function() {
        var available = $("#available").val();
        var lookView = $("#lookView").val();
        if(available != '' && lookView != ''){
            $("input:radio[name='available'][value="+available+"]").attr('checked','true');
            $("input:radio[name='lookView'][value="+lookView+"]").attr('checked','true');
        }
    });

</script>
</body>

</html>