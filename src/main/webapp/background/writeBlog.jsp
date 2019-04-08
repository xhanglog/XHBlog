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
<!-- <div class="x-nav">
  <span class="layui-breadcrumb">
    <a href="">首页</a>
    <a href="">演示</a>
    <a>
      <cite>导航元素</cite></a>
  </span>
  <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
    <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div> -->
<div class="x-body">
    <form class="layui-form" action="" method="">
        <div class="layui-form-item">
            <label class="layui-form-label">博客标题：</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="${artical.title}">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文章摘要：</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="summary" class="layui-textarea">${artical.summary}</textarea>
            </div>
        </div>
        <input type="hidden" name="articalId" value="${artical.articalId}"/>
        <input type="hidden" name="condition"
               value="<fmt:formatDate value='${artical.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
        <input type="hidden" name="recommended" value="${artical.lookCount}"/>
        <input type="hidden" name="recommended" value="${artical.commentCount}"/>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">博客内容：</label>
            <div class="layui-input-block">
                <script id="editor" type="text/plain" style="height: 400px;width: 96%"></script>
            </div>
        </div>
                <div class="layui-inline">
                    <label class="layui-form-label">所属类别：</label>
                    <div class="layui-input-inline">
                        <select name="menuId" lay-verify="required" lay-search="" id="menuId">

                        </select>
                    </div>
                <input type="hidden" id="menuId2" value="${artical.menuId}"/>
                </div>
                    <div class="layui-form-item">
                    <label class="layui-form-label">是否推荐：</label>
                    <div class="layui-input-block">
                    <input type="radio" name="recommended" value="true" title="YES" >
                    <input type="radio" name="recommended" value="false" title="NO" checked="">
                    <input type="hidden" id="recommended" value="${artical.recommended}"/>
                    </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">允许评论：</label>
                <div class="layui-input-block">
                    <input type="radio" name="comment" value="true" title="YES" checked="">
                    <input type="radio" name="comment" value="false" title="NO" >
                <input type="hidden" id="comment" value="${artical.comment}"/>
                    </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">是否显示：</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="true" title="YES" checked="">
                    <input type="radio" name="status" value="false" title="NO" >
                <input type="hidden" id="status" value="${artical.status}"/>
                    </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">封面图片：</label>
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="test1">上传图片</button>
                        <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1" style="heght:90px;width:90px;margin-left:110px"/>
                        <div style="margin-left:110px">
                        <p id="demoText"></p></div>
                        </div>
                        <div class="layui-input-block">
                        <input type="text" id="coverPic" name="coverImage" placeholder="请输入图片地址" value="${artical.coverImage}" autocomplete="off" class="layui-input" style="width: 60%">
                        </div>
                    </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">关键字：</label>
                <div class="layui-input-block">
                    <input type="text" name="keywords" id="tags" autocomplete="off" value="${artical.keywords}" placeholder="请输入标签，多个标签用逗号隔开" class="layui-input" style="width: 60%">
                    <a onclick=" leftVal = (screen.width) / 2;
                    topVal = (screen.height - 530) / 2;
                    window.open('${pageContext.request.contextPath}/getAlltag','_blank','width=300,height=480,toolbars=yes,resizable=yes,scrollbars=yes,left='+leftVal+',top='+topVal);return false;" href="javascript:void(0);">插入已有标签</a>
                    </div>
                    </div>

                    <div class="layui-form-item" style="padding-top: 16px">
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formsub">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
                        </div>
                        </div>
                        </form>
                    </div>
                <script type="text/javascript">
                $(function() {
                    $.post({
                        url: "${pageContext.request.contextPath}/menu/getAllMenu",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "",
                        success: function (data) {
                            $("#menuId").empty();
                            $("#menuId").append("<option value=''>直接选择或搜索选择</option>");
                            for (var i = 0; i < data.length; i++) {
                                $("#menuId").append('<option value=' + data[i].menuId + '>' + data[i].menuName + '</option>');
                            }
                        }
                    });
                    var comment = $("#comment").val();
                    var recommended = $("#recommended").val();
                    var status = $("#status").val();

                    if(recommended != '' && comment != '' && status != ''){
                        $("input:radio[name='recommended'][value="+recommended+"]").attr('checked','true');
                        $("input:radio[name='comment'][value="+comment+"]").attr('checked','true');
                        $("input:radio[name='status'][value="+status+"]").attr('checked','true');
                    }
                });
                </script>
                    <script type="text/javascript" charset="utf-8">
                        var ue = UE.getEditor('editor');
                        ue.ready(function() {
                            //默认显示内容
                            ue.setContent('${artical.editorValue}');
                        });
                        layui.use(['upload','layer','form'], function() {
                            var $ = layui.jquery
                                , upload = layui.upload
                                ,form = layui.form
                                ,layer = layui.layer;

                            $("#menuId").val($('#menuId2').val());
                            form.render('select');

                            //普通图片上传
                            var uploadInst = upload.render({
                                elem: '#test1'
                                , url: '/uploadPic'
                                , done: function (res) {
                                    //如果上传失败
                                    if (res.code > 0) {
                                        return layer.msg('上传失败');
                                    }else{
                                        $('#demo1').attr('src', res.picurl);
                                        $('#coverPic').val(res.picurl);
                                    }
                                    //上传成功
                                }
                                , error: function () {
                                    //演示失败状态，并实现重传
                                    var demoText = $('#demoText');
                                    demoText.html('<span style="color: #FF5722;">上传失败</span>');
                                }
                            });

                            /**
                             * 通用表单提交(AJAX方式)
                             */
                            form.on('submit(formsub)', function(data) {
                                var param=data.field;
                                $.post({
                                    url: '${pageContext.request.contextPath}/artical/add',
                                    dataType:'json',
                                    contentType: "application/json; charset=utf-8",
                                    data:JSON.stringify(param),
                                    success: function(res) {
                                        if(res.code == 0) {
                                            layer.alert(res.msg,{icon:1});
                                            $("#reset").click();
                                            ue.execCommand('cleardoc');
                                        }else{
                                            layer.alert(res.msg,{icon: 5});
                                        }
                                    }
                                });
                                return false;
                            });

                        });

                    </script>
</body>

</html>