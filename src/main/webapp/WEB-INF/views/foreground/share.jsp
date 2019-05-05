<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="p" uri="http://xhanglog.cn/common" %>
<!DOCTYPE html>
<html lang="zh-CN" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>贰月小巷 | 一些资源</title>
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/animate.css" rel="stylesheet"><!-- 动画效果 -->
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootsnav.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/index.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/foreground/css/share.css">
</head>
<body>
<!-- Start Navigation -->
<jsp:include page="common/nav.jsp"></jsp:include>
<!-- End Navigation -->
<article>
    <h2 class="litle"><span>生活不止眼前的苟且，还有远方的八哥</span>${menu.menuName}</h2>
    <c:if test="${page.rows.size() == 0}">
        <div style="text-align: center;">
            <img style="margin: 10% 20% 0 20%" src="http://image.xhanglog.cn/notfound1.gif">
            <span><h4>你要找的内容还没有呢，换一个试试吧...</h4></span>
        </div>
    </c:if>
    <c:if test="${page.rows.size() != 0}">
        <div class="mbbox">
            <c:forEach items="${page.rows}" var="artical">
                <div class="mbpic effect" data-scroll-reveal="enter from the bottom">
                    <div class="mbimg"> <img src="${artical.coverImage}" > </div>
                    <div class="mbtitle"> <a href="${pageContext.request.contextPath}/artical/info/${artical.articalId}.html">${artical.title}</a> </div>
                    <p class="mbinfo">${artical.summary}</p>
                </div>
            </c:forEach>
        </div>
        <div style="text-align: center">
        <c:if test="${navState == 1}">
            <p:page url="${pageContext.request.contextPath}/artical/tag/${tag.tagName}"></p:page>
        </c:if>
        <c:if test="${navState == 2}">
            <p:page url="${pageContext.request.contextPath}/artical/menu/${menu.menuName}"></p:page>
        </c:if>
        </div>
    </c:if>
</article>
<footer>
    <p>Design by <a href="#" target="_blank">贰月小巷</a><span>&nbsp;&nbsp;&nbsp;蜀ICP备18012986号-1	&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/login.html" target="_blank">后台入口</a></span></p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
<script src="${pageContext.request.contextPath}/static/foreground/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/foreground/js/bootsnav.js"></script>
</html>