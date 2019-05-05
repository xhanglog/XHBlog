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
    <title>贰月小巷 | 记录生活，分享所得</title>
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/animate.css" rel="stylesheet"><!-- 动画效果 -->
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootsnav.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/index.css" rel="stylesheet">

</head>
<style type="text/css">
    .place {
        line-height: 38px; padding-left:10px; margin-bottom: 10px
    }
    .place a{
        color: #3e3838;
    }
    a:hover{
        text-decoration: none;
    }
</style>
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
                    <span style="font-size: 13px; font-weight: bold;">您现在的位置是：<a href="${pageContext.request.contextPath}/index.html">网站首页</a></span>&nbsp;&gt;&nbsp;
                    <span>
                        <c:if test="${navState == 1}">
                            标签:${tag.tagName}
                        </c:if>
                        <c:if test="${navState == 2}">
                            ${menu.menuName}列表
                        </c:if>
                        <c:if test="${navState == 3}">
                            共找到含有“<span style="font-weight: bold">${keyword}</span>”的数据<span style="font-weight: bold">${page.total}</span>条
                        </c:if>
                    </span>
                </div>
                <c:if test="${page.rows.size() == 0}">
                    <div style="text-align: center;">
                        <img style="margin: 10% 20% 0 20%" src="http://image.xhanglog.cn/notfound1.gif"/>
                        <span><h4>你要找的内容还没有呢，换一个试试吧...</h4></span>
                    </div>
                </c:if>
                <c:if test="${page.rows.size() != 0}">
                    <c:forEach items="${page.rows}" var="artical">
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
                    <div style="text-align: center">
                    <c:if test="${navState == 1}">
                        <p:page url="${pageContext.request.contextPath}/artical/tag/${tag.tagName}"></p:page>
                    </c:if>
                    <c:if test="${navState == 2}">
                        <p:page url="${pageContext.request.contextPath}/artical/menu/${menu.menuName}"></p:page>
                    </c:if>
                    <c:if test="${navState == 3}">
                        <p:page url="${pageContext.request.contextPath}/artical/search"></p:page>
                    </c:if>

                    </div>
                </c:if>
            </div>

        </article>
        <aside>
            <div class="col-sm-4 r_box">
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