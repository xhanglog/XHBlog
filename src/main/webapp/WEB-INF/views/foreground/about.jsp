<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>贰月小巷 | 关于我</title>
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/fonts/FontAwesome/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/animate.css" rel="stylesheet"><!-- 动画效果 -->
    <link href="${pageContext.request.contextPath}/static/foreground/css/bootsnav.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/foreground/css/index.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/foreground/css/about.css">
</head>
<body>
<!-- Start Navigation -->
<jsp:include page="common/nav.jsp"></jsp:include>
<!-- End Navigation -->
<div class="container">
    <div class="about">
        <h2 class="ab_title">基本信息</h2>
        <div class="ab_content"><p class="fp">贰月小巷，一个90后草根站长。喜欢美食、电影、游戏、编程...不是传说中的大佬，但是就是喜欢折腾。</p>
        </div>

        <h2 class="ab_title">工作技能</h2>
        <div class="ab_content">
            <p class="fp">前端技能：①熟悉HTML，css，JavaScript；</p>
            <p class="sp">②能熟练使用bootstrap，对node.js,vue.js等前端框架有一定了解。</p>
            <p class="fp">后端技能：①JAVA基础扎实，有良好的编程习惯；</p>
            <p class="sp">②熟悉springMVC，spring，mybatis，springboot等框架的使用；</p>
            <p class="sp">③熟练掌握MySQL等数据库的使用及优化；</p>
            <p class="sp">④熟悉Linux系统，掌握LInux常用的指令。</p>
        </div>

        <h2 class="ab_title">关于博客</h2>
        <div class="ab_content">
            <p class="fp">
                很早以前就想写一个属于自己的博客网站，买好了云服务器，域名备好了案，结果忙来忙去的服务器闲置了差不多快一年了。二零一八年十二月二十六日，开始写自己的博客网站，大年三十晚上博客上线，也终于赶在年末拥有了自己的博客网站(此处手动滑稽一下)。
            </p>
            <p class="fp">
                本博客前端使用的是bootstrap框架，参考了很多大佬的博客网站的布局什么的，(⊙o⊙)…作为一个后端猿，前端写的也只有将就着看了。后端是使用了java的ssm框架，后面有时间改用springboot。
            </p>
            <p class="fp">
                由于博主的能力有限，还在学习阶段，如果博文有什么不对的地方，欢迎各位大佬指正。另外，本博客分享的资源有些来源于网友分享，如果侵犯到了您的合法权益，请联系博主删除。
            </p>
        </div>
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