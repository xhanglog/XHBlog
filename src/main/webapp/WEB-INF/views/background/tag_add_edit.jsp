<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>标签添加修改页</title>
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
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <input type="hidden" value="${tag.tagId}" name="tagId"/>
        <input type="hidden" name="condition"
               value="<fmt:formatDate value='${tag.tagCreateTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
        <div class="layui-form-item">
            <label for="tagName" class="layui-form-label">
                <span class="x-red"></span>标签名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="tagName" value="${tag.tagName}" name="tagName" required=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label" for="tagDescription">标签描述：</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" name="tagDescription" id="tagDescription" class="layui-textarea">${tag.tagDescription}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                确定
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        //监听提交
        form.on('submit(add)', function(data){
            var param=data.field;
            $.post({
                url: '${pageContext.request.contextPath}/admin/tag/addOrEdittag',
                dataType:'json',
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify(param),
                success: function(res) {
                    if(res.code == 200) {
                        layer.alert("成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            //刷新父窗口
                            window.parent.location.reload();
                        });
                    }else{
                        layer.alert("失败!",{icon: 5});
                    }
                }
            });
            return false;
        });


    });
</script>
</body>
</html>