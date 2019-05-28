<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-default navbar-mobile bootsnav" >
    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <form method="post" action="${pageContext.request.contextPath}/artical/search" id="search">
                <div class="input-group">
                    <span class="input-group-addon" ><i class="fa fa-search"></i></span>
                    <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Please input you want to find , then hit enter to begin">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </form>
        </div>
    </div>
    <!-- End Top Search -->
    <div class="container">
        <!-- Start Atribute Navigation -->
        <div class="attr-nav">
            <ul>
                <li class="search"><a href="#"><i class="fa fa-search fa-lg"></i></a></li>
            </ul>
        </div>
        <!-- End Atribute Navigation -->
        <!-- Start Header Navigation -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="#brand"><img src="${pageContext.request.contextPath}/static/foreground/img/logo/logo.png" class="logo" alt=""></a>
        </div>
        <!-- End Header Navigation -->
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-menu">
            <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                <li><a href="${pageContext.request.contextPath}/index.html">主页</a></li>
                <c:forEach items="${menuList}" var="menu">
                    <c:if test="${menu.menuLeaval == 0 && menu.pid == 0}">
                        <li><a href="${pageContext.request.contextPath}/artical/menu/${menu.menuName}">${menu.menuName}</a></li>
                    </c:if>
                    <c:if test="${menu.menuLeaval == 1}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" >${menu.menuName}</a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${menuList}" var="subMenu">
                                    <c:if test="${menu.menuId == subMenu.pid}">
                                        <li><a href="${pageContext.request.contextPath}/artical/menu/${subMenu.menuName}">${subMenu.menuName}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/about.html">关于我呀</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<script src="${pageContext.request.contextPath}/static/foreground/js/jquery-1.11.0.min.js"  type="text/javascript"></script>
<script type="text/javascript">
    /*按enter搜索*/
    $("#keyword").on('keypress',function(e) {
        var keycode = e.keyCode;
        var keyword = $(this).val();
        if(keycode == 13) {
            e.preventDefault();
            //请求搜索接口
            $('#search').submit();
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
</script>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
