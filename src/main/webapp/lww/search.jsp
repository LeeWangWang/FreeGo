<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/22 16:38
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FreeGo</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <%--导入JavaScript--%>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>

    <script>
        $(function () {
            //查询用户信息
            $.get("/user/findOne", {}, function (user) {
                if (user) {
                    //用户登录了
                    $("#login_out").remove();//移除未登录标签
                    var userHead = user.userHeadPicturePath;
                    var head = '<img class="user-head-pic" src="/FreegoImg/user/' + userHead + '">';
                    $("#user_head").html(head);
                } else {
                    $("#user_panel").remove();
                    $("#login_in").remove();//移除已登录标签
                }
            });
            //显示下拉菜单
            $("#login_status").mouseover(function () {
                $("#menu_panel").next("a").slideDown;
            });
            $("#login_status").mouseleave(function () {
                $("#user_panel").children("a").slideUp;
            });
        });
    </script>

</head>
<body>
    <%--搜索框--%>
    <div class="search-head">
        <div class="wid clearfix">
            <div class="search-head-logo">
                <a href="http://localhost:8080/lww/index.jsp"></a>
            </div>
            <div class="search-bar">
                <div class="search-wrapper">
                    <div class="search-input">
                        <input name="q" type="text" id="search_input" placeholder="搜游记/景点/酒店" autocomplete="off">
                    </div>
                </div>
                <div class="search-button">
                    <a role="button" href="javascript;" id="search_button">
                        <i class="icon-search"></i>
                    </a>
                </div>
            </div>
            <div class="login_status">
                <!-- 未登录状态  -->
                <div id="login_out" class="login_out">
                    <a href="login.jsp">登录</a>
                    <a href="register.jsp">注册</a>
                </div>
                <!-- 登录状态  -->
                <button id="login_in" class="login_in layui-btn layui-btn-primary">
                    <div class="user-head" id="user_head">
                        <img class="user-head-pic" src="/FreegoImg/user/null.jpeg">
                    </div>
                    <i class="glyphicon glyphicon-chevron-down"></i>
                </button>
            </div>
        </div>
    </div>

    <%--搜索主体--%>
    <div class="freego-search-main" id="freego_search_main">
        <%--搜索栏--%>
        <div class="search-nav">
            <div class="wid">
                <div class="nav-list clearfix">
                    <a href="">游记</a>
                    <a href="">景点</a>
                    <a href="">酒店</a>
                </div>
            </div>
        </div>
        <%--搜索内容--%>
        <div class="wid clearfix">
            <div class="ser-nums"></div>
            <div class="flt1 search-lt" id="search_result_left">
                <div class="search-section">
                    <div class="att-list">
                        <ul>

                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/31.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">史上最全面最详细上海迪士尼攻略（演出、合影、住宿、. . . </a>
                                        </h3>
                                        <p class="seg-desc">高光时刻写在最前面的话来张图镇楼~~这张表格是我去迪士尼前看了50+篇攻略并参考迪士尼 app时间表在出行前做的计划，自以为安排的相当好，然鹅. . .</p>
                                        <div class="seg-views">179381浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/32.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">上海老建筑漫步，细品魔都百年风云</a>
                                        </h3>
                                        <p class="seg-desc">【前言】说起 上海 的时候，你们会想到什么呢？代表老 上海 怀旧气息的外滩、新天地、田子坊？代表新 上海 现代感的陆家嘴、市中心各大商圈？大. . . </p>
                                        <div class="seg-views">52144浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/33.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">【终究，还是得逃出去啊！】50千帕的冷冽和渺小. . . </a>
                                        </h3>
                                        <p class="seg-desc">序：终究，还是得逃出去啊！我自己都不信我真的会认真写这篇游记的。嗯，我已经确诊懒癌晚期了，距上一篇马蜂窝游记都过去4年多了，即便是这一篇...</p>
                                        <div class="seg-views">130235浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/34.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">追逐在魔都的闪光少女，错峰出行，解锁上海迪士尼. . . </a>
                                        </h3>
                                        <p class="seg-desc">在这片最神奇而真实的土地上，总有一些属于你的magic moment，我们知道它不是生活的避难所，但还是想让这份美好永驻迪士尼 ，于我们，不仅仅是一...</p>
                                        <div class="seg-views">171829浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/35.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">上海迪士尼溜娃必看，冬日错峰太好玩太好拍！（内. . . </a>
                                        </h3>
                                        <p class="seg-desc">契机身边很多妈妈朋友都已经带小朋友打卡 上海迪士尼 了，都推荐我去，一早就让我心痒痒了。怀二胎期间到现在也没带哥哥好好出去玩过。查了一些资料，...</p>
                                        <div class="seg-views">252059浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/36.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">在【上海海昌海洋公园】的三天两夜，是圆你的梦，. . . </a>
                                        </h3>
                                        <p class="seg-desc">生活是兜兜的梦，梦是兜兜的生活。孩子的梦似乎总是天马行空，而我却被社会磨砺得没有了棱角和幻想，正是兜兜的想象，让我好像重新活了过来！我们的这...</p>
                                        <div class="seg-views">240516浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/31.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">史上最全面最详细上海迪士尼攻略（演出、合影、住宿、. . . </a>
                                        </h3>
                                        <p class="seg-desc">高光时刻写在最前面的话来张图镇楼~~这张表格是我去迪士尼前看了50+篇攻略并参考迪士尼 app时间表在出行前做的计划，自以为安排的相当好，然鹅. . .</p>
                                        <div class="seg-views">179381浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/32.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">上海老建筑漫步，细品魔都百年风云</a>
                                        </h3>
                                        <p class="seg-desc">【前言】说起 上海 的时候，你们会想到什么呢？代表老 上海 怀旧气息的外滩、新天地、田子坊？代表新 上海 现代感的陆家嘴、市中心各大商圈？大. . . </p>
                                        <div class="seg-views">52144浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/33.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">【终究，还是得逃出去啊！】50千帕的冷冽和渺小. . . </a>
                                        </h3>
                                        <p class="seg-desc">序：终究，还是得逃出去啊！我自己都不信我真的会认真写这篇游记的。嗯，我已经确诊懒癌晚期了，距上一篇马蜂窝游记都过去4年多了，即便是这一篇...</p>
                                        <div class="seg-views">130235浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/34.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">追逐在魔都的闪光少女，错峰出行，解锁上海迪士尼. . . </a>
                                        </h3>
                                        <p class="seg-desc">在这片最神奇而真实的土地上，总有一些属于你的magic moment，我们知道它不是生活的避难所，但还是想让这份美好永驻迪士尼 ，于我们，不仅仅是一...</p>
                                        <div class="seg-views">171829浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/35.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">上海迪士尼溜娃必看，冬日错峰太好玩太好拍！（内. . . </a>
                                        </h3>
                                        <p class="seg-desc">契机身边很多妈妈朋友都已经带小朋友打卡 上海迪士尼 了，都推荐我去，一早就让我心痒痒了。怀二胎期间到现在也没带哥哥好好出去玩过。查了一些资料，...</p>
                                        <div class="seg-views">252059浏览</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="/FreegoImg/li/travelnote/36.jpeg">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">在【上海海昌海洋公园】的三天两夜，是圆你的梦，. . . </a>
                                        </h3>
                                        <p class="seg-desc">生活是兜兜的梦，梦是兜兜的生活。孩子的梦似乎总是天马行空，而我却被社会磨砺得没有了棱角和幻想，正是兜兜的想象，让我好像重新活了过来！我们的这...</p>
                                        <div class="seg-views">240516浏览</div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="flt1 search-rt">
                <div class="search-section">
                    <div class="clearfix search-title">
                        <h2>
                            <a href="" target="_blank" class="search-link">附近热门景点</a>
                        </h2>
                        <a href="" target="_blank" class="search-link">全部景点>></a>
                    </div>
                    <div class="hot-att">
                        <ul class="clearfix">
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/1.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-外滩</a>
                                </p>
                            </li>
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/2.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-南京路步行街</a>
                                </p>
                            </li>
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/3.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-上海城隍庙</a>
                                </p>
                            </li>
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/4.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-田子坊</a>
                                </p>
                            </li>
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/5.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-东方明珠方波电视塔</a>
                                </p>
                            </li>
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/6.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-黄浦江</a>
                                </p>
                            </li>
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/7.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-豫园</a>
                                </p>
                            </li>
                            <li>
                                <a href="" target="_blank" class="search-link">
                                    <img src="/FreegoImg/li/hotel/8.jpeg" style="width: 90px;height: 90px">
                                </a>
                                <p>
                                    <a href="" target="_blank" class="search-link">上海-陆家嘴</a>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="s-hr"></div>
                <div class="hot-rank-list search-section">
                    <div class="clearfix ser-title">
                        <h2>最佳酒店</h2>
                        <a href="" target="_blank" class="search-link">更多酒店>></a>
                    </div>
                    <ul>
                        <li class="clearfix">
                            <span class="rank">1</span>
                            <a href="" target="_blank" class="search-link">上海航龙旅馆</a>
                            <b>¥128</b>
                        </li>
                        <li class="clearfix">
                            <span class="rank">2</span>
                            <a href="" target="_blank" class="search-link">上海晨阳宾馆</a>
                            <b>¥112</b>
                        </li>
                        <li class="clearfix">
                            <span class="rank">3</span>
                            <a href="" target="_blank" class="search-link">上海苏鑫宾馆</a>
                            <b>¥89</b>
                        </li>
                        <li class="clearfix">
                            <span class="rank">4</span>
                            <a href="" target="_blank" class="search-link">上海景苑宾馆</a>
                            <b>¥128</b>
                        </li>
                        <li class="clearfix">
                            <span class="rank">5</span>
                            <a href="" target="_blank" class="search-link">格林豪泰上海市康桥工业园区锦绣路商务酒店</a>
                            <b>¥170</b>
                        </li>
                    </ul>
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

</body>
</html>
