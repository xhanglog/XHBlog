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

<body class="layui-anim layui-anim-up">
<div class="x-body">
    <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./admin_add.jsp')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <script type="text/html" id="bartool">
        <a title="删除" lay-event="del" href="javascript:;">
            <i class="layui-icon">&#xe640;</i>
        </a>
    </script>
    <script type="text/html" id="status">
        <input type="checkbox" name="status" value="{{d.sysUserId}}" lay-skin="switch"
               lay-text="YES|NO" lay-filter="status" {{ d.status == true ? 'checked' : '' }} />
    </script>
    <table class="layui-hide" id="I_am_a_table" lay-filter="I_am_a_table"></table>
</div>
<script>
    layui.use(['table','util'], function(){
        var table = layui.table
            ,form = layui.form
            ,util = layui.util;

        table.render({
            elem: '#I_am_a_table'
            ,id: 'I_am_a_table'
            ,url:'${pageContext.request.contextPath}/user/getSysUsers'
            ,method: 'post'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'sysUserId', title:'ID'}
                ,{field:'sysUserName', title:'名称',width:200}
                ,{field:'sysUserQq', title:'QQ号',width:200}
                ,{field:'sysUserEmail', title:'邮箱',width:200}
                ,{field:'status', title:'是否启用', width:180,templet: '#status', unresize: true}
                ,{field:'right', title: '操作', toolbar:"#bartool",align:"center"}
            ]]
            ,page: true
            ,request: {
                limitName: 'size' //每页数据量的参数名，默认：limit
            }
            ,response: {
                countName: 'total' //规定数据总数的字段名称，默认：count
                ,dataName: 'rows' //规定数据列表的字段名称，默认：data
            }
        });

        //监听开关操作
        form.on('switch(status)', function(obj){
            var sysUserId = this.value;
            var val = obj.elem.checked;
            $.ajax({
                type: 'POST'
                ,url:"${pageContext.request.contextPath}/user/editSwitch"
                ,data:{sysUserId:sysUserId,val:val}
                ,success:function (res) {
                    if(res.code == 200){
                        layer.tips('温馨提示：状态修改成功!', obj.othis);
                    }else {
                        layer.tips('温馨提示：状态修改失败!', obj.othis);
                    }
                }
            });
        });

        //监听工具条
        table.on('tool(I_am_a_table)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('要删除吗'+data.sysUserId, function(res){
                    $.ajax({
                        url: "${pageContext.request.contextPath}/user/delSysUserById",
                        type: "POST",
                        data:{"sysUserId":data.sysUserId},
                        dataType: "json",
                        success: function(res){

                            if(res.code ==200){
                                layer.alert('会员删除成功', {
                                    title: "消息提醒",
                                    btn: ['确定']
                                },function (index, item) {
                                    location.href="adminList.jsp";
                                });
                            }else{
                                layer.msg("删除失败", {icon: 5});
                            }
                        }

                    });
                });
            }
        });
    });
</script>
</body>

</html>