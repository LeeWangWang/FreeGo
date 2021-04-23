<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/23 14:37
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>TravelNote</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/travelnote.css">
    <%--导入jQuery--%>
    <script src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <%--导入布局js--%>
    <script src="js/getParameter.js"></script>
</head>
<body>
    <%--导入头部--%>
    <div id="header">

        <div class="freego_header clearfix" id="head_nav_warper">

            <div class="head_logo"><a class="freego_logo" title="FreeGo" href="http://localhost:8080/index.jsp"></a></div>

            <ul class="head_nav" id="_j_head_nav" role="tablist">
                <li id="head_nav_index_li" role="presentation"><a href="" id="head_nav_index_a">首页</a></li>
                <li id="head_nav_scenic_li" role="presentation"><a href="" id="head_nav_scenic_a" title="景点">景点</a></li>
                <li id="head_nav_gonglve_li" role="presentation"><a href="" id="head_nav_gonglve_a" title="旅游攻略">旅游攻略</a></li>
                <li id="head_nav_hotel_li" role="presentation"><a href="" id="head_nav_hotel_a" title="酒店">订酒店</a></li>
            </ul>

            <div class="search-bar">
                <div class="search-wrapper">
                    <div class="search-input">
                        <input name="q" type="text" id="search_input" placeholder="" autocomplete="off">
                        <a role="button" href="javascript:" class="glyphicon glyphicon-search" id="head_search_link"></a>
                    </div>
                </div>
            </div>

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

    <%--游记主体部分--%>
    <div class="travelnote-main">
        <div class="set-index" id="cover_box">
            <div class="set-bg-load-cover">
                <img src="/FreegoImg/li/travelnote/51.jpeg">
            </div>

            <div class="set-title">
                <div class="title-info">
                    <h1 class="travelnote-title">浦口｜寻觅山水田园，不负春光。</h1>
                </div>
            </div>

            <div class="set-info clearfix">

                <div class="user-head">
                    <img src="/FreegoImg/li/user/head12.jpeg">
                </div>
                <div class="person">
                    <a href="" target="_blank" class="person-pic">
                        <img src="">
                    </a>
                    <div>
                        <a href="" target="_blank" class="person-name">H-C川(上海)</a>
                        <a href="" target="_blank" class="person-follow">
                            <span class="glyphicon glyphicon-plus"></span>
                            关注
                        </a>
                        <div class="publish-time">
                            <span class="time">2021-04-06-09:43</span>
                            <span>
                                <img src="../images/li/travelnote/eye.jpeg">
                                3.7w
                            </span>
                        </div>
                    </div>
                </div>

                <div class="bar-collection-like">
                    <div class="collection">
                        <a href="javascript:void(0);" rel="nofollow" class="tn-btn">
                            <img></img>
                            <span>11</span>
                            <div>收藏</div>
                        </a>
                    </div>
                    <div class="like">
                        <a href="javascript:void(0);" rel="nofollow" class="tn-btn">
                            <img></img>
                            <span>681</span>
                            <div>点赞</div>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <%--导入尾部--%>
    <div id="footer">
        <div class="why_select">

            <dl style="margin-left: 133px">
                <dt class="foot-pic">
                    <img src="../images/li/index/foot_1.jpeg" alt="">
                </dt>
                <dd>
                    <h1>产品齐全</h1>
                    <h2>产品自主选，随心买</h2>
                </dd>
            </dl>

            <dl>
                <dt class="foot-pic">
                    <img src="../images/li/index/foot_2.jpeg" alt="">
                </dt>
                <dd>
                    <h1>便利快捷</h1>
                    <h2>24小时不打烊，随时买</h2>
                </dd>
            </dl>

            <dl>
                <dt class="foot-pic">
                    <img src="../images/li/index/foot_3.jpeg" alt="">
                </dt>
                <dd>
                    <h1>安全支付</h1>
                    <h2>知名支付工具，放心买</h2>
                </dd>
            </dl>

            <dl>
                <dt class="foot-pic">
                    <img src="../images/li/index/foot_4.jpeg" alt="">
                </dt>
                <dd style="margin-right: 0px">
                    <h1>贴心服务</h1>
                    <h2>客服全年无休，安心买</h2>
                </dd>
            </dl>

        </div>
        <div class="company">
            <p>山东工商学院 计算机科学与技术学院 软件工程专业 2017级 毕业设计</p>
        </div>
    </div>

    <script>
        /*头部*/
        document.getElementById("head_nav_gonglve_li").style.background="#ff9d00";
        document.getElementById("head_nav_gonglve_a").style.color="#FFFFFF";
    </script>

</body>
</html>
