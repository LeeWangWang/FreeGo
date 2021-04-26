<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/25 19:39
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <%--导入JavaScript--%>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>

    <script>
        layui.use(['dropdown', 'util', 'layer'], function(){
            var dropdown = layui.dropdown
                ,util = layui.util
                ,layer = layui.layer
                ,$ = layui.jquery;
            dropdown.render({
                elem: '#demo4'
                ,trigger: 'hover'
                ,data: [{
                    title: 'menu item 1'
                    ,id: 100
                },{
                    title: 'menu item 2'
                    ,id: 101
                },{
                    title: 'menu item 3'
                    ,id: 102
                }]
            });

            dropdown.render({
                elem: '#login_in'
                ,trigger: 'hover'
                ,data: [{
                    title: '我的游记'
                    ,id: 110
                },{
                    title: '我的收藏'
                    ,id: 111
                },{
                    title: '我的订单'
                    ,id: 112
                },{
                    title: '我的关注'
                    ,id: 113
                }]
            });
        });
    </script>
</head>
<body>

    <button class="layui-btn layui-btn-primary" id="demo4">
        hover
        <i class="layui-icon layui-icon-more-vertical layui-font-12"></i>
    </button>

    <button id="login_in" class="login_in layui-btn layui-btn-primary">
        <div class="user-head" id="user_head">
            <img class="user-head-pic" src="/FreegoImg/user/null.jpeg">
        </div>
        <i class="glyphicon glyphicon-chevron-down"></i>
        <i class="layui-icon layui-icon-more-vertical layui-font-12"></i>
    </button>


</body>
</html>
