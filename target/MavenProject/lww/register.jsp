<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/9 14:40
  Description: 用户注册页面
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
    <head>
    <meta charset="utf-8">
    <title>注册-FreeGo</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/css/register.css">
    <%--导入JavaScript--%>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>

    <script>

        //校验手机号
        function checkTelephone(){
            //1.获取手机号
            var phone = $("#userTele").val();
            //2.定义正则
            var reg_phone = /^1[3456789]\d{9}$/;
            //3.判断并给出提示，不合法加一个红色边框
            var flag = reg_phone.test(phone);
            if (flag){
                $("#userTele").css("border","");
                return true;
            } else {
                $("#userTele").css("border","1px solid red");
                return false;
            }
        }

        //校验昵称,单词长度：1~30位
        function checkUserName() {
            //1.获取昵称
            var userName = $("#userName").val();
            //2.定义正则表达式
            var reg_userName = /^\w{1,15}$/;
            //3.判断并给出提示，不合法加一个红色边框
            var flag = reg_userName.test(userName);
            if (flag) {
                $("#userName").css("border", "");
                $("#errorMsg").html("");
            } else {
                $("#userName").css("border", "1px solid red");
                $("#errorMsg").html("昵称包含特殊字符或长度错误");
            }
            return flag;
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

        //校验确认密码
        function checkConfirmPassword() {
            //1.获取密码
            var password = $("#checkPassword").val();
            //2.定义正则
            var reg_password = /^\w{8,20}$/;
            //3.判断并给出提示，不合法加一个红色边框
            var flag = reg_password.test(password);
            if (flag) {
                $("#checkPassword").css("border", "")
            } else {
                $("#checkPassword").css("border", "1px solid red");
            }
            return flag;
        }

        //校验两次密码是否一样
        function checkTwoPassword() {
            //1.获取两个密码
            var password1 = $("#password").val();
            var password2 = $("#checkPassword").val();
            //3.判断两次密码是否一致，若不一致给出提示
            if (password1 != password2) {
                $("#errorMsg").html("两次密码不一致");
                return false;
            }
            $("#errorMsg").html("");
            return true;
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
            $("#registerForm").submit(function () {
                var flag = checkTelephone() && checkUserName() && checkPassword() && checkConfirmPassword() && checkTwoPassword() && checkCode();
                if (flag) {
                    //校验通过，发送sjax请求，提交表单的数据
                    //action=register & userTele=15556145755 & userNickName=Joshua_Lee & userPassword=11111111 & check=1234
                    $.post("/user/register", $(this).serialize(), function (data) {
                        //处理服务器响应数据 data {flag:true,errorMsg:"注册失败"}
                        alert("flag: "+data.flag + ",msg:" + data.errorMsg);
                        if (data.flag) {
                            //注册成功
                            window.location.href="index.jsp";
                        } else {
                            //注册失败
                            $("#checkCode").click();
                            $("#errorMsg").html(data);
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

    <div id="rg_layout" class="rg_layout">
        <div class="rg_form clearfix">

            <div class="rg_form_left">
                <p>新用户注册</p>
                <p>USER REGISTER</p>
            </div>

            <div class="rg_form_center">
                <div id="errorMsg" style="color: red;text-align: center"></div>
                <%--注册表单--%>
                <form id="registerForm" action="user">
                    <%--提交处理请求的标识符--%>
                    <input type="hidden" name="action" value="register">
                    <table style="margin-top: 25px;">

                        <tr>
                            <td class="td_left">
                                <label for="userTele">手机号</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="userTele" name="userTele" placeholder="请输入手机号">
                            </td>
                        </tr>

                        <tr>
                            <td class="td_left">
                                <label for="userName">昵称</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="userName" name="userNickName" placeholder="请输入昵称(不能有空格)">
                            </td>
                        </tr>

                        <tr>
                            <td class="td_left">
                                <label for="password">密码</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="password" name="userPassword" placeholder="请输入密码(8~20位)">
                            </td>
                        </tr>

                        <tr>
                            <td class="td_left">
                                <label for="password">确认密码</label>
                            </td>
                            <td class="td_right">
                                <input type="text" id="checkPassword" placeholder="确认密码(8~20位)">
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
                                <input type="submit" class="submit" value="注册">
                                <span id="msg" style="color: red;"></span>
                            </td>
                        </tr>

                    </table>
                </form>
            </div>

            <div class="rg_form_right">
                <p>
                    已有账号？
                    <a href="login.jsp">立即登录</a>
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
        document.getElementById("rg_layout").style.background="url(../images/li/signup&login/"+bg_img[Math.floor(Math.random()*(bg_img.length))]+") no-repeat center";
        $("#checkCode").click();

    </script>

</body>

</html>
