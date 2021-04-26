<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%--导入CSS--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <%--导入JavaScript--%>
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>
</head>
<body>
    <input type="radio" name="select" value="all" title="全部" checked>
    <input type="radio" name="select" value="scenic" title="景点">
    <input type="radio" name="select" value="hotel" title="酒店">
    <input type="radio" name="select" value="travelnote" title="游记">

</body>
</html>