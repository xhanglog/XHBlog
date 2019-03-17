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
                <a onclick="InsertTag('java')" href="#">java</a>
                <a onclick="InsertTag('正则表达式')" href="#">正则表达式</a>
                <a onclick="InsertTag('css')" href="#">css</a>
                <a onclick="InsertTag('dao')" href="#">dao</a>
                <a onclick="InsertTag('jquery')" href="#">jquery</a>
                <a onclick="InsertTag('js')" href="#">js</a>
                <a onclick="InsertTag('ssh')" href="#">ssh</a>
                <a onclick="InsertTag('web')" href="#">web</a>
                <a onclick="InsertTag('冲突')" href="#">冲突</a>
                <a onclick="InsertTag('二次探测法')" href="#">二次探测法</a>
                <a onclick="InsertTag('哈希表')" href="#">哈希表</a>
                <a onclick="InsertTag('框架')" href="#">框架</a>
                <a onclick="InsertTag('平方探测法')" href="#">平方探测法</a>
                <a onclick="InsertTag('散列函数')" href="#">散列函数</a>
                <a onclick="InsertTag('时间同步')" href="#">时间同步</a>
                <a onclick="InsertTag('数据结构')" href="#">数据结构</a>
                <a onclick="InsertTag('图片轮播')" href="#">图片轮播</a>
    </div>
</body>

</html>
