<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>插入标签</title>
    <style>
        body {
            font-size: 13px;
            font-family: Verdana,Arial,Helvetica,sans-serif;
            line-height: 1.8;
        }

        a {
            margin-right: 10px;
        }

        a:link, a:visited, a:active {
            color: #015FB6;
        }

        a:hover {
            color: #E33E06;
        }
    </style>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        function InsertTag(tagname) {
            var decodedTag = $('<div/>').html(tagname).text();
            var txbTag = '';
            try {
                txbTag = window.opener.document.getElementById(tags).value;   
            } catch(e) {
                /*document.domain = 'cnblogs.com';*/
                txbTag = window.opener.document.getElementById("tags");
            }

            if (txbTag.value == '') {
                txbTag.value += decodedTag;
            }
            else {
                txbTag.value += "," + decodedTag;
            }
        }
    </script>
</head>
<body>
    <div id="taglist">
        <c:forEach items="${tags}" var="tag">
            <a onclick="InsertTag('${tag.tagName}')" href="#">${tag.tagName}</a>
        </c:forEach>
    </div>
</body>

</html>
