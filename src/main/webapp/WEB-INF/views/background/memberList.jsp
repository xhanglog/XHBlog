<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>会员列表页面</title>
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>会员列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    <span class="x-right" style="line-height:40px">共有数据：<span id="count"></span> 条</span>
</div>
<div class="x-body">
    <div class="layui-row">
        <div class="layui-col-md12 x-so">
            <input class="layui-input" placeholder="日期范围" name="dateTodate" id="dateTodate">
            <input type="text" name="title" id="title" placeholder="请输入会员昵称" autocomplete="off" class="layui-input">
            <button class="layui-btn" lay-filter="reload" id="reload"><i class="layui-icon">&#xe615;</i></button>
        </div>
    </div>
    <script type="text/html" id="bartool">
        <a title="删除" lay-event="del" href="javascript:;">
            <i class="layui-icon">&#xe640;</i>
        </a>
    </script>
    <script type="text/html" id="isComment">
        <input type="checkbox" name="comment" value="{{d.memberId}}" lay-skin="switch"
               lay-text="YES|NO" lay-filter="comment" {{ d.comment == true ? 'checked' : '' }} />
    </script>
    <table class="layui-hide" id="I_am_a_table" lay-filter="I_am_a_table"></table>
</div>
<script>

    /*日期搜索*/
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        laydate.render({
            elem: '#dateTodate'
            ,type: 'datetime'
            ,range: 'to'
        });
    });

</script>
<script>
    layui.use(['table','util'], function(){
        var table = layui.table
            ,form = layui.form
            ,util = layui.util;

        table.render({
            elem: '#I_am_a_table'
            ,id: 'I_am_a_table'
            ,url:'${pageContext.request.contextPath}/admin/member/getMembers'
            ,method: 'post'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'memberId', title:'ID'}
                ,{field:'memberNickname', title:'昵称',width:200}
                ,{field:'createTime', title:'加入时间',width:180,templet:function(d){return util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");}}
                ,{field:'comment', title:'是否允许评论', width:180,templet: '#isComment', unresize: true}
                ,{field:'sex', title:'性别',width:110,templet:function(d){
                        return  d.sex == true ? "男":"<span class='layui-red'>女</span>";
                    } }
                ,{field:'right', title: '操作', toolbar:"#bartool",align:"center"}
            ]]
            ,where: {
                'dateTodate': '',
                'title': null
            }
            ,page: true
            ,request: {
                limitName: 'size' //每页数据量的参数名，默认：limit
            }
            ,response: {
                countName: 'total' //规定数据总数的字段名称，默认：count
                ,dataName: 'rows' //规定数据列表的字段名称，默认：data
            }
            ,done: function(res, curr, total) {
                $("#count").html(total);
            }
        });

        // 执行搜索，表格重载
        $('#reload').on('click', function () {
            // 搜索条件
            var dateTodate = $('#dateTodate').val();
            var title = $('#title').val();
            table.reload('I_am_a_table', {
                method: 'post'
                , where: {
                    'dateTodate': dateTodate,
                    'title': title
                }
                , page: {
                    curr: 1
                }
            });
        });

        //监听开关操作
        form.on('switch(comment)', function(obj){
            var memberId = this.value;
            var val = obj.elem.checked;
            $.ajax({
                type: 'POST'
                ,url:"${pageContext.request.contextPath}/admin/member/editSwitch"
                ,data:{memberId:memberId,val:val}
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
                layer.confirm('要删除吗'+data.memberId, function(res){
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/member/delMemberById",
                        type: "POST",
                        data:{"memberId":data.memberId},
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
            }
        });
    });
</script>
</body>

</html>