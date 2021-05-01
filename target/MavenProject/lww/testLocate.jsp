<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bigautocomplete.js?v=2"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bigautocomplete.css">

    <style type="text/css">
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        .demo{width:720px;margin:30px auto;}
        .demo h2{font-size:16px;color:#3366cc;height:30px;}
        .demo li{float:left;}
        .text{width:529px;height:22px;padding:4px 7px;padding:6px 7px 2px\9;font:16px arial;border:1px solid #cdcdcd;border-color:#9a9a9a #cdcdcd #cdcdcd #9a9a9a;vertical-align:top;outline:none;margin:0 5px 0 0;}
        .button{width:95px;height:32px;padding:0;padding-top:2px\9;border:0;background-position:0 -35px;background-color:#ddd;cursor:pointer}
    </style>

</head>
<body>

<div class="demo">
    <h2>bigautocomplete联想输入测试</h2>
    <form action="" method="post" name="searchform" id="searchform" class="searchinfo">
        <ul>
            <li><input type="text" id="location" value="" class="text" /></li>
            <li><input type="submit" value="搜索" class="button" /></li>
        </ul>
    </form>
</div>

<script>

    $(function() {
        $("#location").bigAutocomplete({
            width:543,
            url:'http://localhost:8080/travelnote/getLocate',
            callback:function(data){
                alert(data.title);
            }
        });
        /*$.post("/travelnote/getLocate", function (data) {
            alert(data);
        });*/
    });
</script>

</body>
</html>
