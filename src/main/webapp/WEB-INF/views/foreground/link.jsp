<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN" >
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>贰月小巷博客 | 友情链接</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/foreground/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/animate.css" rel="stylesheet"><!-- 动画效果 -->
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootsnav.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/index.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/foreground/css/share.css">
  </head>
  <style type="text/css">
    .place { 
      line-height: 38px; padding-left:10px; margin-bottom: 10px;
    }
    .place a{
      color: #3e3838;
    }
    .linkC{
    	border-radius: 5px;
    	background-color: #ffffff;
    	border: 1px solid #ffffff;
    	overflow:auto;
    }
    .link{
    	height: 40px;
    	border: 1px solid #efe4e4;
    	border-radius: 3px;
    	background-color: #fffefd;
    	text-align: center;
    	line-height: 35px;
    	margin-top: 8px;
    	margin-bottom: 5px;
    }
    .link:hover,.link:hover{
      -webkit-box-shadow: #ccc 0px 0px 10px;
      -moz-box-shadow: #ccc 0px 0px 10px;
      box-shadow: #ccc 0px 0px 10px;  
    }
    p{
      text-indent:2em;
      font: 15px "Microsoft YaHei", Arial, Helvetica, sans-serif; 
      color: #555; line-height: 1.8;
    }
    @media (max-width: 992px) {
        #weltip{
            display: none;
        }
    }
  </style>
  <body>
    <!-- Start Navigation -->
    <jsp:include page="common/nav.jsp"></jsp:include>
      <!-- End Navigation -->
    <div class="container">
		<div style="margin-top: 10px">
			<div class="place" style="height: 40px;background-color: #ffffff;border-radius: 5px;margin-bottom: 10px">
            	<span class="ico"><i class="fa fa-map-marker"></i></span>
            	<span style="font-size: 13px; font-weight: bold;">您现在的位置是：<a href="index.html">网站首页</a></span>&nbsp;&gt;&nbsp;<span>友情链接</span>
            	<span style="float: right;" id="weltip">“有朋自远方来，不亦乐乎”</span>
       		</div>

			<div class="linkC">
       			<div style="background-color: #e8e6ec;height: 30px;line-height: 25px">
       				<span style="font-size: 14px;font-family: 微软雅黑;font-weight: bold;">友链说明</span>
       			</div>
       			<div class="tip">
       				<p></p>
       				<p>
       					欢迎来到本网站，如果你想交换友链，请添加本站链接信息，并点击
       					<a href="javascript:void(0);" onclick="addModel()"><span style="color: red">友链申请</span></a>
       					填写你的网站信息。我会选择一些特别优秀的网站放置在首页展示。友情链接的目的是常来常往，凡是加了友链的朋友，我都会经常访问的，也欢迎你来我的网站参观。
       				</p>
       				<p>
       					本站信息：贰月小巷，<a href="www.xhanglog.xn">www.xhanglog.xn</a>
       				</p>
       				<p>注意：<span style="color: #eca5a5">本站会不定期清理一些失效链接和质量差的连接。</span></p>
       			</div>
       		</div>

       		<div class="linkC" style="margin-top: 15px;min-height: 260px">
       			<div style="background-color: #e8e6ec;height: 30px;line-height: 25px">
       				<span style="font-size: 14px;font-family: 微软雅黑;font-weight: bold;">友链列表</span>(排名不分先后)
       			</div>
                <c:forEach items="${links}" var="link">
                    <div class="col-sm-3 link">
                        <a href="${link.linkUrl}">${link.linkName}</a>
                    </div>
                </c:forEach>
       		</div>
		</div>
    </div>
    <footer style="margin-top: 15px">
        <p>Design by <a href="#" target="_blank">贰月小巷</a><span>&nbsp;&nbsp;&nbsp;蜀ICP备123232号-1</span></p>
    </footer>
    <a href="#" class="cd-top">Top</a>

<!-- 添加模态框（Modal） -->
        <div class="modal fade" id="model_add" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">查看信息</h4>
                    </div>
                    <div class="modal-body">
                    	
						<form method="post" action="" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" >
						  <div class="form-group">
						    <label class="col-sm-2 control-label"><span style="color: red">*</span>友链名称</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="linkName" id="linkName">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label"><span style="color: red">*</span>友链地址</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="linkUrl" id="linkUrl">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">所有者名称</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="linkOwnerNickname" id="linkOwnerNickname">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">联系方式</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="linkOwnerContact" id="linkOwnerContact">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">描述</label>
						    <div class="col-sm-10">
						      <textarea class="form-control" rows="3" name="linkDescription" id="linkDescription"></textarea>
						    </div>
						  </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
        <!-- 添加模态框（Modal）end -->

  </body>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/foreground/js/jquery-1.11.0.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="${pageContext.request.contextPath}/static/foreground/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/foreground/js/bootsnav.js"></script>
    <script type="text/javascript">
       /*按enter搜索*/
        $("#keyword").on('keypress',function(e) {
                var keycode = e.keyCode;
                var searchName = $(this).val();
                if(keycode == 13) {
                    e.preventDefault();
                    //请求搜索接口
                    alert(searchName);
                    $(".top-search").slideUp();
                }
        });
        /*scroll to top*/
        var offset = 300,
            offset_opacity = 1200,
            scroll_top_duration = 700,
            $back_to_top = $('.cd-top');

        $(window).scroll(function () {
            ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
            if ($(this).scrollTop() > offset_opacity) {
                $back_to_top.addClass('cd-fade-out');
            }
        });
        $back_to_top.on('click', function (event) {
            event.preventDefault();
            $('body,html').animate({
                    scrollTop: 0,
                }, scroll_top_duration
            );
        });

      function addModel(obj) {
          $('#model_add').modal();
    	 }

    // 提交表单
    function check_form(){
        var linkName = $.trim($('#linkName').val());
        var linkUrl = $.trim($('#linkUrl').val());
        var linkOwnerNickname = $.trim($('#linkOwnerNickname').val());
        var linkOwnerContact = $.trim($('#linkOwnerContact').val());
        var linkDescription = $.trim($('#linkDescription').val());

        if(!linkName){
            alert('链接名称不能为空！');
            return false;
        }
        if(!linkUrl){
            alert('链接地址不能为空！');
            return false;
        }
        // 异步提交数据到页面
        $.ajax({
          url: "${pageContext.request.contextPath}/link/add",
          data:{"linkName":linkName,"linkUrl":linkUrl,"linkOwnerNickname":linkOwnerNickname,
        "linkOwnerContact":linkOwnerContact,"linkDescription":linkDescription},
          type: "post",
          dataType: "json",
          success:function(res){
            if(res.code == 202){
                alert("申请成功！");
                window.location.reload();
            }else{
                alert("申请失败！");
            }
          }
        })
      }

    </script>
</html>