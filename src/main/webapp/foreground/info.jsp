<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>贰月小巷博客 | 记录生活，分享所得</title>
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/animate.css" rel="stylesheet"><!-- 动画效果 -->
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootsnav.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/index.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/foreground/css/info.css">
</head>
<body>
<!-- Start Navigation -->
<jsp:include page="common/nav.jsp"></jsp:include>
<!-- End Navigation -->
<div class="container">
    <div class="row mainbody">
        <article>
            <div class="col-sm-8">
                <div class="place" style="height: 40px;background-color: #ffffff;border-radius: 5px;margin-bottom: 10px">
                    <span class="ico"><i class="fa fa-map-marker"></i></span>
                    <span style="font-size: 13px; font-weight: bold;">您现在的位置是：<a href="${pageContext.request.contextPath}/index.html">网站首页</a></span>&nbsp;&gt;&nbsp;<span>文章详情</span>
                </div>
                <div class="info" style="background-color: #ffffff;border-radius: 5px;border: solid 1px #ffffff;">
                    <!-- <div class="newsview"> -->
                    <h3 class="news_title">${artical.title}</h3>
                    <div class="bloginfo">
                        <ul style="color: #555;margin-left: 15px;">
                            <li class="author"><span class="ico"><i class="fa fa-user fa-fw"></i></span>&nbsp;${artical.user.sysUserName}</li>
                            <li class="time"><span class="ico"><i class="fa fa-calendar fa-fw"></i></span>&nbsp;<fmt:formatDate value="${artical.createTime}" pattern="yyyy-MM-dd HH:mm"/></li>
                            <li class="view"><span class="ico"><i class="fa fa-eye fa-fw"></i></span>&nbsp;${artical.lookCount}阅读</li>
                            <li class="view"><span class="ico"><i class="fa fa-comments fa-fw"></i></span>&nbsp;${artical.commentCount}评论</li>
                            <li class="view"><span class="ico"><i class="fa fa-tags fa-fw"></i></span>&nbsp;${artical.keywords}</li>
                        </ul>
                    </div>
                    <div class="news-content" style="margin: 0 18px 18px 26px ">
                        ${artical.content}
                    </div>
                    <!-- </div> -->
                </div>
                <div class="next_info">
                    <div class="col-sm-6 prevnew">
                        <c:choose>
                            <c:when test="${preArtical != null}">
                                <a href="${pageContext.request.contextPath}/artical/info/${preArtical.id}.html">
                                    &lt上一篇:<br>
                                        ${preArtical.title}
                                </a>
                            </c:when>
                            <c:otherwise>
                                    没有了<br>
                                        已经是第一篇文章
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-sm-6 nextnew">
                        <c:choose>
                            <c:when test="${afterArtical != null}">
                                <a href="${pageContext.request.contextPath}/artical/info/${afterArtical.id}.html">
                                    下一篇&gt;<br>
                                        ${afterArtical.title}
                                </a>
                            </c:when>
                            <c:otherwise>
                                没有了<br>
                                已经是最后一篇文章
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>

                <div class="comment" style="padding-top: 20px">
                    <c:if test="${qqname == null}">
                        <div>通过<a href="${pageContext.request.contextPath}/qqLogin" onclick="qqLogin()">QQ</a>登录之后即可评论回复</div>
                    </c:if>
                    <c:if test="${qqname != null}">
                        <div>${qqname}，欢迎发表你的观点...</div>
                    </c:if>
                    <div class="commentbox">
                        <textarea cols="80" rows="50" placeholder="来都来了，说点什么吧......" class="mytextarea" id="content"></textarea>
                        <div class="btn btn-info pull-right" id="comment">评论</div>
                    </div>
                    <div class="comment-list">
                        <c:forEach items="${commentList}" var="com">
                            <c:if test="${com.commentPid == 0}">
                                <div class="comment-info">
                                    <header><img src="${com.memberPic}"></header>
                                    <div class="comment-right">
                                        <input type="hidden" value="${com.commentId}">
                                        <h3>${com.memberName}</h3>
                                        <div class="comment-content-header"><span><i class="fa fa-clock-o fa-fw"></i><fmt:formatDate value="${com.commentCreateTime}" pattern="yyyy-MM-dd HH:mm"/></span></div>
                                        <p class="content">${com.commentContent}</p>
                                        <div class="comment-content-footer" >
                                            <div class="row">
                                                <div class="col-md-10"></div>
                                                <div class="col-md-2"><span class="reply-btn" >回复</span></div>
                                            </div>
                                        </div>
                                        <div class="reply-list">
                                            <c:forEach items="${commentList}" var="cc">
                                                <c:if test="${cc.zid == com.commentId && cc.commentPid != 0}">
                                                    <div class="reply" >
                                                        <input type="hidden" value="${cc.commentId}">
                                                        <div><a href="javascript:void(0)">${cc.memberName}</a>:<a href="javascript:void(0)">@${cc.commentPname}</a><span>${cc.commentContent}</span></div>
                                                        <p><span><fmt:formatDate value="${cc.commentCreateTime}" pattern="yyyy-MM-dd HH:mm"/></span> <span class="reply-btn" id="a2">回复</span></p>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>

            </div>
        </article>
        <aside>
            <div class="col-sm-4 r_box">
                <jsp:include page="common/sidebar.jsp"></jsp:include>
            </div>
        </aside>
    </div>
</div>
<input id="openID" value="${openID}" type="hidden" />
<input id="avatar" value="${avatar}" type="hidden" />
<input id="qqname" value="${qqname}" type="hidden" />
<input id="articalId" value="${artical.id}" type="hidden" />
<footer style="margin-top: 15px">
    <p>Design by <a href="#" target="_blank">贰月小巷</a><span>&nbsp;&nbsp;&nbsp;蜀ICP备18012986号-1</span></p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
<script src="${pageContext.request.contextPath}/static/foreground/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/foreground/js/bootsnav.js"></script>
<%--评论--%>
<script type="text/javascript">
    var openID = document.getElementById("openID").value;
    var avatar = document.getElementById("avatar").value;
    var qqname = document.getElementById("qqname").value;
    var articalId = document.getElementById("articalId").value;
    $(function(){
        $("#comment").click(function(){
            if (openID == ""){
                alert("登录后才可以评论哟");
            }else {
                var obj = new Object();
                obj.time = getNowDateFormat();
                obj.img= avatar;
                obj.replyName= qqname;
                obj.content=$("#content").val();
                if(obj.content != ""){
                    $.ajax({
                        type: "get",
                        url: '/comment/add',
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        data: {openID: openID,content: obj.content,articalId:articalId,
                            zid: null,commentPid: null,commentPname:null},
                        success: function () {
                        },
                        error: function () {
                        }
                    });
                    $(".comment-list").append("<div class='comment-info'><header><img src='"+obj.img+"'></header><div class='comment-right'><h3>"+obj.replyName+"</h3>"
                        +"<div class='comment-content-header'><span><i class=\"fa fa-clock-o fa-fw\"></i>"+obj.time+"</span>"+"</div><p class='content'>"+obj.content
                        +"</p><div class='comment-content-footer'><div class='row'><div class='col-md-10'>"+ "</div><div class='col-md-2'><span class='reply-btn'>回复" +
                        "</span></div></div></div><div class='reply-list'></div></div></div>");
                    $("#content").val("");
                }else{
                    alert("还没有输入东西！");
                }
            }
        });

        $(".reply-btn").click(function(){
            if (openID == ""){
                alert("登录后才可以评论哟");
            }else {
                var html = "<div class='replybox'><textarea cols='80' rows='50' placeholder='来说几句吧......' class='mytextarea' ></textarea><span class='send'>发送</span><span class='cancel'>取消</span></div>";
                if($('div').is('.replybox')){
                    $(".replybox").remove();
                }
                replyClick($(this));
            }
        });

        function getNowDateFormat(){
            var nowDate = new Date();
            var year = nowDate.getFullYear();
            var month = filterNum(nowDate.getMonth()+1);
            var day = filterNum(nowDate.getDate());
            var hours = filterNum(nowDate.getHours());
            var min = filterNum(nowDate.getMinutes());
            var seconds = filterNum(nowDate.getSeconds());
            return year+"-"+month+"-"+day+" "+hours+":"+min+":"+seconds;
        }

        function filterNum(num){
            if(num < 10){
                return "0"+num;
            }else{
                return num;
            }
        }

        function replyClick(el){
            var s = el.parent().parent().append("<div class='replybox'><textarea cols='80' rows='50' placeholder='来说几句吧......' class='mytextarea' ></textarea><span class='send'>发送</span><span class='cancel'>取消</span></div>");

            s.find(".cancel").click(function(){
                $(".replybox").remove();
            });

            s.find(".send").click(function(){
                var content = $(this).prev().val();
                if(content != ""){
                    var parentEl = $(this).parent().parent().parent().parent();
                    var obj = new Object();
                    obj.replyName= qqname;
                    if(el.parent().parent().hasClass("reply")){
                        console.log("1111");
                        obj.beReplyName = el.parent().parent().find("a:first").text();
                        obj.pid = el.parent().parent().find("input").val();
                    }else{
                        console.log("2222");
                        obj.beReplyName=parentEl.find("h3").text();
                        obj.pid=parentEl.find("input").val();
                    }
                    obj.zid = parentEl.find("input").val();
                    obj.content=content;
                    obj.time = getNowDateFormat();
                    var replyString = createReplyComment(obj);

                    $(".replybox").remove();
                    parentEl.find(".reply-list").append(replyString).find(".reply-list-btn:last").click(function(){alert("不能回复自己");});
                    $.ajax({
                        type: "get",
                        url: '/comment/add',
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        data: {openID: openID,content: obj.content,articalId:articalId,
                            zid: obj.zid,commentPid: obj.pid,commentPname:obj.beReplyName},
                        success: function () {
                        },
                        error: function () {
                        }
                    });
                }else{
                    alert("还没有内容");
                }
            });
        }

        function createReplyComment(reply){
            var replyEl = "<div class='reply'><div><a href='javascript:void(0)' class='replyname'>"+reply.replyName+"</a>:<a href='javascript:void(0)'>@"+reply.beReplyName+"</a><span>"+reply.content+"</span></div>"
                + "<p><span>"+reply.time+"</span> <span class='reply-list-btn'>回复</span></p></div>";
            return replyEl;
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
</script>
</html>