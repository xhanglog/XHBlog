<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>贰月小巷 | 记录生活，分享所得</title>
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/animate.css" rel="stylesheet"><!-- 动画效果 -->
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootsnav.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/index.css" rel="stylesheet">

</head>
<style type="text/css">
    a:hover { text-decoration: none;}
</style>
<body>
<!-- Start Navigation -->
<jsp:include page="common/nav.jsp"></jsp:include>
<!-- End Navigation -->
<div class="container">
    <div class="row mainbody">
        <article>
            <div class="col-sm-8">
                <c:forEach items="${articalList}" var="artical">
                    <%--有封面图片--%>
                    <c:if test="${artical.coverImage != null}">
                        <div class="blogs" style="border: solid #FFFFFF 1px;border-radius:6px;">
                            <h3 class="blogtitle"><a href="${pageContext.request.contextPath}/artical/info/${artical.articalId}.html">${artical.title}</a></h3>
                            <span class="blogpic"><a href="${pageContext.request.contextPath}/artical/info/${artical.articalId}.html" title=""><img src="${artical.coverImage}" alt=""></a></span>
                            <p class="blogtext">${artical.summary}</p>
                            <div class="bloginfo">
                                <ul>
                                    <li class="time"><span class="ico"><i class="fa fa-calendar fa-fw"></i></span>&nbsp;<fmt:formatDate value="${artical.updateTime}" pattern="yyyy-MM-dd HH:mm"/></li>
                                    <li class="view"><span class="ico"><i class="fa fa-eye fa-fw"></i></span>&nbsp${artical.lookCount}阅读</li>
                                    <li class="view"><span class="ico"><i class="fa fa-comments fa-fw"></i></span>&nbsp;${artical.commentCount}评论</li>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <!-- 没有封面图片显示 -->
                    <c:if test="${artical.coverImage == null}">
                        <div class="blogs" style="border: solid #FFFFFF 1px;border-radius:6px;">
                            <h3 class="blogtitle"><a href="${pageContext.request.contextPath}/artical/info/${artical.articalId}.html">${artical.title}</a></h3>
                            <p class="blogtext">${artical.summary}</p>
                            <div class="bloginfo">
                                <ul>
                                    <li class="time"><span class="ico"><i class="fa fa-calendar fa-fw"></i></span>&nbsp;<fmt:formatDate value="${artical.updateTime}" pattern="yyyy-MM-dd HH:mm"/></li>
                                    <li class="view"><span class="ico"><i class="fa fa-eye fa-fw"></i></span>&nbsp;${artical.lookCount}阅读</li>
                                    <li class="view"><span class="ico"><i class="fa fa-comments fa-fw"></i></span>&nbsp;${artical.commentCount}评论</li>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </article>
        <aside>
            <div class="col-sm-4 r_box">
                <div class="about_me" style="border-radius:10px;">
                    <h2>博主简介</h2>
                    <ul>
                        <i><img src="http://image.xhanglog.cn/tx.jpg"></i>
                        <p><b>贰月小巷</b>，一个90后草根站长。喜欢美食、电影、音乐、编程...不是传说中的大佬，但是就是喜欢折腾。没有完不成的事，只有不想完成的事。生活不止诗和远方，还有眼前的鸡腿。加油吧，骚年。</p>
                    </ul>
                </div>
                <jsp:include page="common/sidebar.jsp"></jsp:include>
            </div>
        </aside>
    </div>
</div>
<footer>
    <p>Design by <a href="#" target="_blank">贰月小巷</a><span>&nbsp;&nbsp;&nbsp;蜀ICP备18012986号-1	&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/login.html" target="_blank">后台入口</a></span></p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
<script src="${pageContext.request.contextPath}/static/foreground/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/foreground/js/bootsnav.js"></script>
</html>