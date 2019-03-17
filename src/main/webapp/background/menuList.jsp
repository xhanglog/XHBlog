<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
    <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./admin-add.html')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <table class="layui-table layui-form">
        <thead>
        <tr>
            <th width="70">ID</th>
            <th>栏目名</th>
            <th width="250">路径</th>
            <th width="50">排序</th>
            <th width="50">状态</th>
            <th width="220">操作</th>
        </thead>
        <tbody class="x-cate">
        <tr cate-id='1' fid='0' >
            <td>1</td>
            <td>
                <i class="layui-icon x-show" status='true'>&#xe623;</i>新闻
            </td>
            <td>1</td>
            <td>1</td>
            <td>
                <input type="checkbox" name="switch"  lay-text="开启|停用"  checked="" lay-skin="switch">
            </td>
            <td class="td-manage">
                <button class="layui-btn layui-btn layui-btn-xs"  onclick="x_admin_show('编辑','admin-edit.html')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="x_admin_show('编辑','admin-edit.html')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,'要删除的id')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
            </td>
        </tr>
        <tr cate-id='2' fid='1' >
            <td>2</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                ├国内新闻
            </td>
            <td>1</td>
            <td>1</td>
            <td>
                <input type="checkbox" name="switch"  lay-text="开启|停用"  checked="" lay-skin="switch">
            </td>
            <td class="td-manage">
                <button class="layui-btn layui-btn layui-btn-xs"  onclick="x_admin_show('编辑','admin-edit.html')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="x_admin_show('编辑','admin-edit.html')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,'要删除的id')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
            </td>
        </tr>
        <tr cate-id='3' fid='1' >
            <td>3</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                ├国外新闻
            </td>
            <td>1</td>
            <td>1</td>
            <td>
                <input type="checkbox" name="switch"  lay-text="开启|停用"  checked="" lay-skin="switch">
            </td>
            <td class="td-manage">
                <button class="layui-btn layui-btn layui-btn-xs"  onclick="x_admin_show('编辑','admin-edit.html')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="x_admin_show('编辑','admin-edit.html')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,'要删除的id')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<style type="text/css">

</style>
<script>
    layui.use(['form'], function(){
        form = layui.form;

    });

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>