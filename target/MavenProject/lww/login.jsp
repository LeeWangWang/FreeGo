<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/19 10:40
  Description: 用户登录页面
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登录-FreeGo</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/login.css">
    <%--导入JavaScript--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>

    <script>

        //校验手机号
        function checkAccount(){
            //1.获取账号
            var account = $("#userAccount").val();
            var flag = false;
            if (account.indexOf("@") == -1) {
                //2.定义正则<<手机号>>
                var reg_phone = /^1[3456789]\d{9}$/;
                //3.判断并给出提示，不合法加一个红色边框
                flag = reg_phone.test(account);
            } else {
                //
                //2.定义正则<<邮箱>>
                var reg_email = /^\w+@\w+\.\w+$/;
                //3.判断并给出提示，不合法加一个红色边框
                flag = reg_email.test(account);
            }
            if (flag){
                $("#userAccount").css("border","");
                return true;
            } else {
                $("#userAccount").css("border","1px solid red");
                return false;
            }
        }

        //校验密码
        function checkPassword() {
            //1.获取密码
            var password = $("#password").val();
            //2.定义正则
            var reg_password = /^\w{8,20}$/;
            //3.判断并给出提示，不合法加一个红色边框
            var flag = reg_password.test(password);
            if (flag) {
                $("#password").css("border", "")
            } else {
                $("#password").css("border", "1px solid red");
            }
            return flag;
        }

        //校验验证码，为空，加一个红色边框
        function checkCode(){
            var check = $("#check").val();
            if (check != ""){
                $("#check").css("border","");
                return true;
            } else {
                $("#check").css("border","1px solid red");
                return false;
            }
        }

        //当表单提交时，调用所有校验方法
        $(function () {
            $("#loginForm").submit(function () {
                var flag = checkAccount() && checkPassword() && checkCode();
                if (flag) {
                    //校验通过，发送sjax请求，提交表单的数据
                    //action=login & userAccount=15556145755 & userPassword=11111111 & check=1234
                    $.post("/user/login", $(this).serialize(), function (data) {
                        //处理服务器响应数据 data {flag:true,errorMsg:"登录失败"}
                        //alert("flag: "+data.flag + ",msg:" + data.errorMsg);
                        if (data.flag) {
                            //登录成功
                            window.location.href="index.jsp";
                        } else {
                            //登录失败
                            $("#checkCode").click();
                            $("#errorMsg").html(data.errorMsg);
                        }
                    });
                }
                //如果这个方法没有返回值，或者返回false表单不提交
                return false;
            });
        });
    </script>
</head>

<body>

<div id="login_layout" class="login_layout">
    <div class="login_form clearfix">

        <div class="login_form_left">
            <p>用户登录</p>
            <p>USER LOGIN</p>
        </div>

        <div class="login_form_center">
            <div id="errorMsg" style="color: red;text-align: center"></div>
            <%--登录表单--%>
            <form id="loginForm" action="user" method="post" accept-charset="utf-8">
                <%--提交处理请求的标识符--%>
                <input type="hidden" name="action" value="login">
                <table>
                    <tr>
                        <td class="td_left">
                            <label for="userAccount">账号</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="userAccount" name="userAccount" placeholder="您的邮箱/手机号">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="password">密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="password" name="userPassword" placeholder="请输入密码(8~20位)">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="check">验证码</label>
                        </td>
                        <td class="td_right check">
                            <input type="text" id="check" name="check" placeholder="验证码" class="check">
                            <img src="checkCode" id="checkCode" height="32px" alt="" onclick="changeCheckCode(this)">
                            <script type="text/javascript">
                                //图片点击事件
                                function changeCheckCode(img) {
                                    img.src="/checkCode?"+new Date().getTime();
                                }
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right check">
                            <input type="submit" class="submit" value="立即登录">
                            <span id="msg" style="color: red;"></span>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="login_form_right">
            <p>
                没有账号？
                <a href="register.jsp">立即注册</a>
            </p>
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
    $("#login_layout").attr("style", "background-size: cover");
    $("#checkCode").click();
</script>

</body>
</html>









