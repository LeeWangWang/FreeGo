<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/22 16:38
  Description: 游记搜索界面
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
            var type = parseInt(getParameter("type"));
            if (type == 1) {
                $("#toolbar_travelNote").css('color', '#ffffff');
                $("#toolbar_travelNote").css('background-color', '#ff9d00');
            } else if (type == 2) {
                $("#toolbar_scenic").css('color', '#ffffff');
                $("#toolbar_scenic").css('background-color', '#ff9d00');
            } else {
                $("#toolbar_hotel").css('color', '#ffffff');
                $("#toolbar_hotel").css('background-color', '#ff9d00');
            }
            //获取search的参数值
            var search = getParameter("search");
            console.log("解码前: " + search);
            if (search) {
                search = window.decodeURIComponent(search);
                console.log("解码后: " + search);
            }
            var userId;
            //查询用户信息
            $.get("/user/findOne", {}, function (user) {
                if (user) {
                    //用户登录了
                    userId = user.userId;
                    console.log("当前登录用户Id:" + user.userId);
                    $("#login_out").remove();//移除未登录标签
                    var userHead = user.userHeadPicturePath;
                    var head = '<img class="user-head-pic" src="/FreegoImg/user/' + userHead + '">';
                    $("#user_head").html(head);
                    $("#search_input").val(search);
                    searchTravelNote(search);
                } else {
                    $("#login_in").remove();//移除已登录标签
                    location.href="http://localhost:8080/lww/login.jsp";
                }
            });
        });

        $("#search_button").click(function () {
            console.log("搜索内容 "); console.log( $("#search_input").val() );
            searchTravelNote( $("#search_input").val() );
        });
        $("#toolbar_scenic").click(function () {
            location.href = "";
        });
        $("#toolbar_hotel").click(function () {
            location.href = "";
        });

        function searchTravelNote(searchName) {
            $.post("/travelnote/queryTravelNoteInfoBySearch", {search:searchName}, function (result) {
                console.log("查询游记结果:"); console.log(result);
                var route_lis = "";
                for (var i = 0; i < result.length; i++) {
                    var noteInfo = result[i];
                    var noteText = noteInfo.travelNoteText.replace(/<\/?.*>/ig, '');
                    noteText = noteText.substr(0, 60) + "...";
                    var li = '<li>\n' +
                        '    <div class="clearfix">\n' +
                        '        <div class="flt1">\n' +
                        '            <a href="http://localhost:8080/lww/travelnote.jsp?noteId='+noteInfo.travelNoteId+'" target="_blank" class="search-link">\n' +
                        '                <img src="'+noteInfo.travelNoteCover+'">\n' +
                        '            </a>\n' +
                        '        </div>\n' +
                        '        <div class="ct-text">\n' +
                        '            <h3>\n' +
                        '                <a href="http://localhost:8080/lww/travelnote.jsp?noteId='+noteInfo.travelNoteId+'" target="_blank">'+noteInfo.travelNoteTitle+'</a>\n' +
                        '            </h3>\n' +
                        '            <p class="seg-desc">'+noteText+'</p>\n' +
                        '            <div class="seg-views">'+noteInfo.pageViews+'浏览</div>\n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '</li>';
                    route_lis += li;
                }
                $("#travelNote_list").html(route_lis);
            });
        }

    </script>

    <%--用户头像下拉列表--%>
    <script>
        layui.use(['dropdown', 'util', 'layer'], function(){
            var dropdown = layui.dropdown;
            dropdown.render({
                elem: '#login_in'       //可绑定在任意元素中，此处以上述按钮为例
                ,trigger: 'hover'       //触发组件的事件类型。
                ,data: [{
                    title: '我的游记'
                    ,id: 'icon_travelnote'
                    ,href: 'http://localhost:8080/lww/userMain.jsp?tab=1'
                },{
                    title: '我的收藏'
                    ,id: 'icon_collection'
                    ,href: 'http://localhost:8080/lww/userMain.jsp?tab=2'
                },{
                    title: '我的订单'
                    ,id: 'icon_order'
                    ,href: 'http://localhost:8080/lww/userMain.jsp?tab=3'
                },{
                    title: '我的关注'
                    ,id: 'icon_follow'
                    ,href: 'http://localhost:8080/lww/userMain.jsp?tab=4'
                },{
                    title: '退出登录'
                    ,id: 'icon_logout'
                    ,href: 'http://localhost:8080/user/exit'
                }]
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
                    <a role="button" href="javascript:void(0)" id="search_button">
                        <i class="icon-search"></i>
                    </a>
                </div>
            </div>
            <div class="login_status">
                <!-- 未登录状态  -->
                <div id="login_out" class="login_out">
                    <a href="http://localhost:8080/lww/login.jsp">登录</a>
                    <a href="http://localhost:8080/lww/register.jsp">注册</a>
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
                    <a id="toolbar_travelNote" href="javascript:void(0)">游记</a>
                    <a id="toolbar_scenic" href="javascript:void(0)">景点</a>
                    <a id="toolbar_hotel" href="javascript:void(0)">酒店</a>
                </div>
            </div>
        </div>
        <%--搜索内容--%>
        <div class="wid clearfix">
            <div class="ser-nums"></div>
            <div class="flt1 search-lt" id="search_result_left">
                <div class="search-section">
                    <div class="att-list">
                        <ul id="travelNote_list">

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
                                        <p class="seg-desc">高光时刻写在最前面的话来张图镇楼. . .</p>
                                        <div class="seg-views">179381浏览</div>
                                    </div>
                                </div>
                            </li>

                        </ul>
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

</body>
</html>
