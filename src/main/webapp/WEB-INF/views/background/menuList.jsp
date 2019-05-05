<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>菜单列表</title>
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
    <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加菜单分类','${pageContext.request.contextPath}/admin/menu_add_edit.html')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：<span id="count"></span> 条</span>
    </xblock>
    <script type="text/html" id="bartool">
        <button class="layui-btn layui-btn layui-btn-xs"  lay-event="edit" ><i class="layui-icon">&#xe642;</i>编辑</button>
        <button class="layui-btn-danger layui-btn layui-btn-xs" lay-event="del" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
    </script>
    <script type="text/html" id="available">
        <input type="checkbox" name="available" value="{{d.menuId}}"
               lay-skin="switch" lay-text="显示|隐藏" lay-filter="available" {{ d.available == true ? 'checked' : '' }} />
    </script>

    <table class="layui-hide" id="I_am_a_table" lay-filter="I_am_a_table"></table>
</div>
<style type="text/css">

</style>
<script>
    layui.use(['table','util'], function(){
        var table = layui.table
            ,form = layui.form
            ,util = layui.util;

        table.render({
            elem: '#I_am_a_table'
            ,id: 'I_am_a_table'
            ,url:'${pageContext.request.contextPath}/admin/menu/getMenus'
            ,method: 'post'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'menuId', title:'编号',sort: true}
                ,{field:'pid', title:'父编号'}
                ,{field:'menuName', title:'名称',width:100}
                ,{field:'menuSort', title:'排序序号',edit: 'text'}
                ,{field:'menuDescription', title:'描述',width:180}
                ,{field:'lookView', title:'视图',width:60,edit: 'text'}
                ,{field:'pid', title:'菜单级别',width:100,templet:function(d){
                        return  d.pid == 0 ? "一级菜单":"<span class='layui-red'>二级菜单</span>";
                    }}
                ,{field:'menuCreateTime', title:'创建时间',width:180,templet:function(d){return util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");}}
                ,{field:'available', title:'状态',templet: '#available', unresize: true}
                ,{field:'right', title: '操作', toolbar:"#bartool",align:"center",width:200}
            ]]
            ,page:false
            ,done: function(res, curr, count) {
                $("#count").html(count);
            }
        });

        //监听开关操作
        form.on('switch(available)', function(obj){
            var menuId = this.value;
            var val = obj.elem.checked;
            $.ajax({
                type: 'POST'
                ,url:"${pageContext.request.contextPath}/admin/menu/editSwitch"
                ,data:{menuId:menuId,val:val}
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
                layer.confirm('要删除吗'+data.menuId, function(res){
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/menu/delMenuById",
                        type: "POST",
                        data:{"menuId":data.menuId},
                        dataType: "json",
                        success: function(res){

                            if(res.code == 200){
                                layer.alert('会员删除成功', {
                                    title: "消息提醒",
                                    btn: ['确定']
                                },function (index, item) {
                                    window.location.reload();
                                });
                            }else{
                                layer.msg("删除失败", {icon: 5});
                            }
                        }

                    });
                });
            }else if(obj.event === 'edit'){
                x_admin_show('编辑','${pageContext.request.contextPath}/admin/menu/getMenuInfo?menuId='+data.menuId,600,400);
            }
        });

        //监听单元格编辑
        table.on('edit(I_am_a_table)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/menu/editInText",
                type: "POST",
                data:{"menuId":data.menuId,"field":field,"value":value},
                dataType: "json",
                success: function(res){

                    if(res.code == 200){
                        layer.msg('[ID: '+ data.menuId +'] ' + field + ' 字段更改为：'+ value);
                    }else{
                        layer.msg("修改失败", {icon: 5});
                    }
                }
            });

        });
    });
</script>
</body>

</html>