<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/9 19:46
  Description: 头部
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="lww/js/getParameter.js"></script>

<header id="header">

    <%--头部--%>
    <div id="header">

        <div class="freego_header clearfix" id="head_nav_warper">

            <div class="head_logo"><a class="freego_logo" title="FreeGo" href="http://localhost:8080/index.jsp"></a></div>

            <ul class="head_nav" id="_j_head_nav" role="tablist">
                <li id="head_nav_index_li" role="presentation"><a href="" id="head_nav_index_a">首页</a></li>
                <li id="head_nav_scenic_li" role="presentation"><a href="" id="head_nav_scenic_a" title="景点">景点</a></li>
                <li id="head_nav_gonglve_li" role="presentation"><a href="" id="head_nav_gonglve_a" title="旅游攻略">旅游攻略</a></li>
                <li id="head_nav_hotel_li" role="presentation"><a href="" id="head_nav_hotel_a" title="酒店">订酒店</a></li>
            </ul>

            <div class="login_status">
                <!-- 未登录状态  -->
                <div id="login_out" class="login_out">
                    <a href="login.jsp">登录</a>
                    <a href="register.jsp">注册</a>
                </div>
                <!-- 登录状态  -->
                <div id="login_in" class="login_in">
                    <span id="span_username"></span>
                    <a href="javascript:location.href='user/exit';">退出</a>
                    <a id="cancelAccount">注销账号</a>
                </div>
            </div>

        </div>

    </div>

</header>

<script>
    document.getElementById("head_nav_index_li").style.background="#ff9d00";
    document.getElementById("head_nav_index_a").style.color="#FFFFFF";
</script>


