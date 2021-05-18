<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/5/8
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: 穆正阳
  DateTime: 2021/4/19 10:40
  Description: 管理员登录页面
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>预定酒店结果</title>
        <%--导入CSS--%>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/login.css">
        <%--导入JavaScript--%>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    </head>
<body>
<% int userId = (int)session.getAttribute("userId");%>
<div id="login_layout" class="login_layout">
    <div class="login_form clearfix">

        <div class="login_form_left">
            <p>支付结果</p>
            <p>Payment Results</p>
        </div>

        <div class="login_form_center" style="margin-top: 100px;">
            <div id="errorMsg" style="color: red;text-align: center"></div>
            <%--登录表单--%>
            <form id="loginForm" action="${pageContext.request.contextPath}/HotelServlet?methods=toHotel&userId=<%=userId%>" method="post" accept-charset="utf-8">
                <%--提交处理请求的标识符--%>
                <input type="hidden" name="action" value="login">
                <table style="margin-left: 40px;">
                    <h1 style="margin-left: 140px;">支付成功</h1>
                    <tr>
                        <td class="td_right check">
                            <input type="submit" class="submit" value="确认" onclick="closeThis()">
                            <span id="msg" style="color: red;"></span>
                        </td>
                        <script>
                            function closeThis(){
                                window.opener=null;
                                window.open('','_self');
                                window.close();
                            }
                        </script>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<script>
    var bg_img = ['0.jpeg', '1.jpeg', '2.jpeg', '3.jpeg', '4.jpeg', '5.jpeg', '6.jpeg', '7.jpeg', '8.jpeg', '9.jpeg', '10.jpeg',
        '11.jpeg', '12.jpeg', '13.jpeg', '14.jpeg', '15.jpeg', '16.jpeg', '17.jpeg', '18.jpeg', '19.jpeg', '20.jpeg',
        '21.jpeg', '22.jpeg', '23.jpeg', '24.jpeg', '25.jpeg', '26.jpeg', '27.jpeg', '28.jpeg', '29.jpeg', '30.jpeg',
        '31.jpeg', '32.jpeg', '33.jpeg', '34.jpeg', '35.jpeg', '36.jpeg', '37.jpeg', '38.jpeg', '39.jpeg', '40.jpeg',
        '41.jpeg', '42.jpeg', '43.jpeg', '44.jpeg', '45.jpeg'];
    document.getElementById("login_layout").style.background="url(../images/li/signup&login/"+bg_img[Math.floor(Math.random()*(bg_img.length))]+") no-repeat center";
    $("#checkCode").click();
</script>

</body>
</html>