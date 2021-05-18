<%@ page import="domain.HotelInfo" %>
<%@ page import="domain.ScenicInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.LocateInfo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>layDate快速使用</title>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
    <input type="text" class="layui-input" id="test1">
</div>

<script src="layui/layui.js"></script>

<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });
    });
</script>
</body>
</html>