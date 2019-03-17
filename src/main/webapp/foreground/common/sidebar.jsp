<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="tuijian" style="border-radius:10px;height: 255px">
    <h2 id="tab"><a href="#" class="current">站长推荐</a><a href="#">点击排行</a><a href="#">评论最多</a></h2>
    <div id="tuijian_content">
        <ul style="display:block;">
            <c:forEach items="${recommendedArtical}" var="artical">
                <li><a href="${pageContext.request.contextPath}/artical/info/${artical.id}.html">${artical.title}</a></li>
            </c:forEach>
        </ul>
        <ul>
            <c:forEach items="${clickMost}" var="artical">
                <li><a href="${pageContext.request.contextPath}/artical/info/${artical.id}.html">${artical.title}</a></li>
            </c:forEach>
        </ul>
        <ul>
            <c:forEach items="${commentMost}" var="artical">
                <li><a href="${pageContext.request.contextPath}/artical/info/${artical.id}.html">${artical.title}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="cloud" style="border-radius:10px;">
    <h2>标签云</h2>
    <ul>
        <c:forEach items="${tagList}" var="tag">
            <a href="${pageContext.request.contextPath}/artical/tag/${tag.tagName}">${tag.tagName}</a>
        </c:forEach>
    </ul>
</div>
<div class="links">
    <h2><a href="#">友情链接</a></h2>
    <div class="col-sm-6">
        <ul>
            <c:forEach items="${linkList}" var="link" varStatus="xx">
                <c:if test="${xx.count % 2 == 1}">
                    <li><a href="${link.linkUrl}" target="_blank">${link.linkName}</a></li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="col-sm-6">
        <ul>
            <c:forEach items="${linkList}" var="link" varStatus="xx">
                <c:if test="${xx.count % 2 == 0}">
                    <li><a href="${link.linkUrl}" target="_blank">${link.linkName}</a></li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
<script type="text/javascript">
    //tab
    var oLi = document.getElementById("tab").getElementsByTagName("a");
    var oUls = document.getElementById("tuijian_content").getElementsByTagName("ul");
    for(var i = 0; i < oLi.length; i++){
        oLi[i].index = i;
        oLi[i].onmouseover = function (){
            for(var n = 0; n < oLi.length; n++) oLi[n].className="";
            this.className = "current";
            for(var n = 0; n < oUls.length; n++) oUls[n].style.display = "none";
            oUls[this.index].style.display = "block"
        }
    };
</script>