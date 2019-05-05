<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="${pageContext.request.contextPath}/admin/index.html">贰月小巷—后台管理</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${user.sysUserName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('切换帐号','${pageContext.request.contextPath}/admin/editPsd.html',400,400)">修改密码</a></dd>
                <dd><a href="${pageContext.request.contextPath}/admin/user/loginOut">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="http://www.xhanglog.cn">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6a2;</i>
                    <cite>文章管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/writeBlog.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>写文章</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/articalList.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>文章信息管理</cite>
                        </a>
                    </li >

                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>会员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/memberList.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>会员列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/adminList.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>类别管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/menuList.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>菜单分类</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/tagList.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>标签信息</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe82a;</i>
                    <cite>友链管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/linkList.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>友链列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe69b;</i>
                    <cite>评论管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/admin/commentList.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>评论列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->