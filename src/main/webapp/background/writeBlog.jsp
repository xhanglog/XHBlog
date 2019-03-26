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
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">博客标题：</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文章摘要：</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">博客内容：</label>
            <div class="layui-input-block">
                <script id="editor" name="content" type="text/plain" style="height: 400px;width: 96%"></script>
            </div>
        </div>
                <div class="layui-inline">
                    <label class="layui-form-label">所属类别：</label>
                    <div class="layui-input-inline">
                        <select name="modules" lay-verify="required" lay-search="">
                            <option value="">直接选择或搜索选择</option>
                            <option value="1">layer</option>
                            <option value="2">form</option>
                            <option value="3">layim</option>
                            <option value="4">element</option>
                            <option value="5">laytpl</option>
                            <option value="6">upload</option>
                            <option value="7">laydate</option>
                            <option value="8">laypage</option>
                            <option value="9">flow</option>
                            <option value="10">util</option>
                            <option value="11">code</option>
                            <option value="12">tree</option>
                            <option value="13">layedit</option>
                            <option value="14">nav</option>
                            <option value="15">tab</option>
                            <option value="16">table</option>
                            <option value="17">select</option>
                            <option value="18">checkbox</option>
                            <option value="19">switch</option>
                            <option value="20">radio</option>
                        </select>
                    </div>
                </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">是否推荐：</label>
                <div class="layui-input-block">
                    <input type="radio" name="recommended" value="YES" title="YES" >
                    <input type="radio" name="recommended" value="NO" title="NO" checked="">
                    </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">允许评论：</label>
                <div class="layui-input-block">
                    <input type="radio" name="isComment" value="YES" title="YES" checked="">
                    <input type="radio" name="isComment" value="NO" title="NO" >
                    </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">是否显示：</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="YES" title="YES" checked="">
                    <input type="radio" name="status" value="NO" title="NO" >
                    </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">封面图片：</label>

            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test1">上传图片</button>
                <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1" style="heght:90px;width:90px;margin-left:110px"/>
                <div style="margin-left:110px""><p id="demoText"></p></div>
                </div>
                </div>
                    </div>

                    <div class="layui-form-item">
                    <label class="layui-form-label">关键字：</label>
                <div class="layui-input-block">
                    <input type="text" name="tags" id="tags" autocomplete="off" placeholder="请输入标签，多个标签用逗号隔开" class="layui-input" style="width: 60%">
                    <a onclick=" leftVal = (screen.width) / 2;
                    topVal = (screen.height - 530) / 2;
                    window.open('tags.jsp','_blank','width=300,height=480,toolbars=yes,resizable=yes,scrollbars=yes,left='+leftVal+',top='+topVal);return false;" href="javascript:void(0);">插入已有标签</a>
                    </div>
                    </div>

                    <div class="layui-form-item" style="padding-top: 16px">
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                        </div>
                        </form>
                    </div>
                    <script type="text/javascript" charset="utf-8">
                        layui.use('upload', function() {
                            var $ = layui.jquery
                                , upload = layui.upload;

                            //普通图片上传
                            var uploadInst = upload.render({
                                elem: '#test1'
                                , url: '/uploadPic'
                                , before: function (obj) {
                                    //预读本地文件示例，不支持ie8
                                    obj.preview(function (index, file, result) {
                                        $('#demo1').attr('src', result); //图片链接（base64）
                                    });
                                }
                                , done: function (res) {
                                    //如果上传失败
                                    if (res.code > 0) {
                                        return layer.msg('上传失败');
                                    }
                                    //上传成功
                                }
                                , error: function () {
                                    //演示失败状态，并实现重传
                                    var demoText = $('#demoText');
                                    demoText.html('<span style="color: #FF5722;">上传失败</span>');
                                }
                            });
                        });
                    </script>
                <!-- 实例化编辑器 -->
                <script type="text/javascript" charset="utf-8">
                    var ue = UE.getEditor('editor');
                </script>

</body>

</html>