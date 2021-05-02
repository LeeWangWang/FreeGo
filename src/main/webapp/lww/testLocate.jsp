<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/publish.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bigautocomplete.css">
    <%--导入JavaScript--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bigautocomplete.js?v=2"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/package/dist/wangEditor.min.js"></script>

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
        <ul style="margin-bottom: 40px; float: left">
            <li><input type="text" id="location1" value="" class="text" /></li>
            <li><input type="submit" value="搜索" class="button" /></li>
        </ul>
        <ul style="margin-bottom: 40px; float: left ">
            <li><input type="text" id="location2" value="" class="text" /></li>
            <li><input type="submit" value="搜索" class="button" /></li>
        </ul>
        <ul>
            <li><input type="text" id="location3" value="" class="text" /></li>
            <li><input type="submit" value="搜索" class="button" /></li>
        </ul>
    </form>
</div>

<script>

    var locateInfo = null;
    var jsonData = null;
    var result = null;

    $(function() {
        $.post("/travelnote/getLocate", function (data) {
            locateInfo = data;
            jsonData = JSON.stringify(data);// 转成JSON格式
            result = $.parseJSON(jsonData);// 转成JSON对象
            console.log("前台获取地址信息: ");
            console.log(locateInfo);
            console.log("前台获取地址信息: ");
            console.log(jsonData);
            console.log("前台获取地址信息: ");
            console.log(result);
        }, "json");

        $("#location1").bigAutocomplete({
            width:543,
            data:locateInfo,
            callback:function(data){
            }
        });

        $("#location2").bigAutocomplete({
            width:543,
            data:jsonData,
            callback:function(data){
            }
        });

        $("#location3").bigAutocomplete({
            width:543,
            data:result,
            callback:function(data){
            }
        });
    });
</script>

</body>
</html>
