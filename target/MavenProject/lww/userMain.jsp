<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/5/7 12:14
  Description: 个人主页
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <title>个人主页</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/userMain.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <%--导入JavaScript--%>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>

    <script>
        $(function () {
            var tab = parseInt(getParameter("tab"));
            if (tab == 1) {
            } else if (tab == 2) {
                $('#my_collection_tab').trigger('click');
            } else if (tab == 3) {
                $('#my_order_tab').trigger('click');
            } else if (tab == 4) {
                $('#my_friend_tab').trigger('click');
            }
            //判断用户是否登录
            $.get("/user/findOne", {}, function (user) {
                if (user) {
                    //用户登录了
                    console.log("当前登录用户Id:" + user.userId);
                    $("#login_out").remove();//移除未登录标签
                    var userHead = user.userHeadPicturePath;
                    var head = '<img class="user-head-pic" src="/FreegoImg/user/' + userHead + '">';
                    $("#user_head").html(head);
                    // 给我的游记信息赋值
                    $.post("/travelnote/queryAllTravelNoteInfo", {userId:user.userId}, function (pb) {
                        console.log("查询个人游记信息: "); console.log(pb);
                        var travelnoteList = pb.list;
                        var collectList = pb.collectNum;
                        var likeList = pb.likeNum;
                        var route_lis = "";
                        // 2.1展示游记信息
                        for (var i = 0; i < travelnoteList.length; i++) {
                            var noteInfo = travelnoteList[i];
                            var likeInfo = likeList[i];
                            var collectInfo = collectList[i];
                            var noteText = noteInfo.travelNoteText.replace(/<\/?.*>/ig, '');
                            noteText = noteText.substr(0, 250) + "...";
                            var li ='<li>\n' +
                                    '    <dl>\n' +
                                    '        <dt>\n' +
                                    '            <a class="note_cover" href="http://localhost:8080/lww/travelnote.jsp?noteId='+noteInfo.travelNoteId+'" target="_blank">\n' +
                                    '                <img src="'+noteInfo.travelNoteCover+'">\n' +
                                    '            </a>\n' +
                                    '        </dt>\n' +
                                    '        <dd>\n' +
                                    '            <div class="note_title clearfix">\n' +
                                    '                <div class="note_info">\n' +
                                    '                    <h3>\n' +
                                    '                        <a href="http://localhost:8080/lww/travelnote.jsp?noteId='+noteInfo.travelNoteId+'" target="_blank" title="">'+noteInfo.travelNoteTitle+'</a>\n' +
                                    '                    </h3>\n' +
                                    '                    <div class="note_more">\n' +
                                    '                            <span class="view_num">\n' +
                                    '                                <img src="../images/li/user/eye.png" style="margin-top: 7px;" class="view_img">\n' +
                                    '                                <div>'+noteInfo.pageViews+'</div>\n' +
                                    '                            </span>\n' +
                                    '                        <span class="like_num">\n' +
                                    '                                <img src="../images/li/user/like.png" class="like_img">\n' +
                                    '                                <div>'+likeInfo+'</div>\n' +
                                    '                            </span>\n' +
                                    '                        <span class="collect_num">\n' +
                                    '                                <img src="../images/li/user/star.png" class="collect_img">\n' +
                                    '                                <div>'+collectInfo+'</div>\n' +
                                    '                            </span>\n' +
                                    '                        <span class="time">'+noteInfo.travelTime+'</span>\n' +
                                    '                    </div>\n' +
                                    '                </div>\n' +
                                    '            </div>\n' +
                                    '            <div class="note_word">'+noteText+'</div>\n' +
                                    '        </dd>\n' +
                                    '    </dl>\n' +
                                    '</li>';
                            route_lis += li;
                        }
                        $("#note_info_list").html(route_lis);
                    });
                    $.post("/user/queryFollowAndFans", {userId:user.userId}, function (pb) {
                        console.log("用户的关注以及粉丝:");console.log(pb);
                        var followList = pb.followList;
                        var followTravelNoteNumList = pb.followTravelNoteNumList;
                        var followNumList = pb.followNumList;
                        var follow_lis = "";
                        // 2.1展示关注信息
                        for (var i = 0; i < followList.length; i++) {
                            var userInfo1 = followList[i];
                            var travelNoteNum1 = followTravelNoteNumList[i];
                            var followNum1 = followNumList[i];
                            var follow ='<li>\n' +
                                    '    <div class="author">\n' +
                                    '        <a href="">\n' +
                                    '            <img src="/FreegoImg/user/'+userInfo1.userHeadPicturePath+'" alt="">\n' +
                                    '        </a>\n' +
                                    '    </div>\n' +
                                    '    <div class="name">\n' +
                                    '        <a href="">'+userInfo1.userNickName+'</a>\n' +
                                    '    </div>\n' +
                                    '    <div class="num_list clearfix">\n' +
                                    '        <div class="trvelnotes">\n' +
                                    '            <b>'+travelNoteNum1+'</b>\n' +
                                    '            <span>游记</span>\n' +
                                    '        </div>\n' +
                                    '        <div class="fans">\n' +
                                    '            <b>'+followNum1+'</b>\n' +
                                    '            <span>粉丝</span>\n' +
                                    '        </div>\n' +
                                    '    </div>\n' +
                                    '    <div class="btn-follow">\n' +
                                    '        <div class="change-follow">已关注</div>\n' +
                                    '    </div>\n' +
                                    '</li>';
                            follow_lis += follow;
                        }
                        $("#follow_list").html(follow_lis);
                        // 2.2展示粉丝信息
                        var fansList = pb.fansList;
                        var fansTravelNoteNumList = pb.fansTravelNoteNumList;
                        var fansNumList = pb.fansNumList;
                        var fans_lis = "";
                        for (var j = 0; j < fansList.length; j++) {
                            var userInfo2 = fansList[j];
                            var travelNoteNum2 = fansTravelNoteNumList[j];
                            var followNum2 = fansNumList[j];
                            var fans ='<li>\n' +
                                    '    <div class="author">\n' +
                                    '        <a href="">\n' +
                                    '            <img src="/FreegoImg/user/'+userInfo2.userHeadPicturePath+'" alt="">\n' +
                                    '        </a>\n' +
                                    '    </div>\n' +
                                    '    <div class="name">\n' +
                                    '        <a href="">'+userInfo2.userNickName+'</a>\n' +
                                    '    </div>\n' +
                                    '    <div class="num_list clearfix">\n' +
                                    '        <div class="trvelnotes">\n' +
                                    '            <b>'+travelNoteNum2+'</b>\n' +
                                    '            <span>游记</span>\n' +
                                    '        </div>\n' +
                                    '        <div class="fans">\n' +
                                    '            <b>'+followNum2+'</b>\n' +
                                    '            <span>粉丝</span>\n' +
                                    '        </div>\n' +
                                    '    </div>\n' +
                                    '    <div class="btn-follow">\n' +
                                    '        <div class="change-follow">已关注</div>\n' +
                                    '    </div>\n' +
                                    '</li>';
                            fans_lis += fans;
                        }
                        $("#fans_list").html(fans_lis);
                    });
                } else {
                    $("#login_in").remove();//移除已登录标签
                    location.href="http://localhost:8080/lww/login.jsp";
                }
            });
        });
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

<%--导入头部--%>
<div id="header">
    <div class="freego_header clearfix" id="head_nav_warper">
        <div class="head_logo"><a class="freego_logo" title="FreeGo" href="http://localhost:8080/lww/index.jsp"></a></div>
        <ul class="head_nav" id="_j_head_nav" role="tablist">
            <li id="head_nav_index_li" role="presentation"><a href="http://localhost:8080/lww/index.jsp" id="head_nav_index_a">首页</a></li>
            <li id="head_nav_scenic_li" role="presentation"><a href="http://localhost:8080/lww/scenic.jsp" id="head_nav_scenic_a" title="景点">景点</a></li>
            <li id="head_nav_hotel_li" role="presentation"><a href="http://localhost:8080/lww/hotel.jsp" id="head_nav_hotel_a" title="酒店">订酒店</a></li>
            <li id="head_nav_gonglve_li" role="presentation"><a href="http://localhost:8080/lww/search.jsp?type=1&search=" id="head_nav_gonglve_a" title="旅游攻略">旅游攻略</a></li>
        </ul>
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

<div class="banner-background">
    <img class="img-background" src="../images/li/user/banner_background.jpg">
</div>

<div class="layui-tab layui-tab-card" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li id="my_travelNote_tab" style="margin-left: 140px;" class="layui-this">我的游记</li>
        <li id="my_collection_tab">我的收藏</li>
        <li id="my_order_tab">我的订单</li>
        <li id="my_friend_tab">我的好友</li>
    </ul>
    <div class="layui-tab-content">
        <%--我的游记--%>
        <div class="layui-tab-item layui-show">
            <div class="note_list">
                <ul id="note_info_list">
                    <%--<li>
                        <dl>
                            <dt>
                                <a class="note_cover" href="" target="_blank">
                                    <img src="/FreegoImg/li/travelnote/11.jpeg" height="400" width="680">
                                </a>
                            </dt>
                            <dd>
                                <div class="note_title clearfix">
                                    <div class="note_info">
                                        <h3>
                                            <a href="" target="_blank" title="">游记标题</a>
                                        </h3>
                                        <div class="note_more">
                                                <span class="view_num">
                                                    <img src="../images/li/user/eye.png" style="margin-top: 7px;" class="view_img">
                                                    <div>1241</div>
                                                </span>
                                            <span class="like_num">
                                                    <img src="../images/li/user/like.png" class="like_img">
                                                    <div>123</div>
                                                </span>
                                            <span class="collect_num">
                                                    <img src="../images/li/user/star.png" class="collect_img">
                                                    <div>123</div>
                                                </span>
                                            <span class="time">2021-04-26 15:05:10</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="note_word">
                                    30岁我们把家安在了路上小时候其实没怎么幻想过30岁的生活，那时候觉得20岁才是风华正茂的年纪，好像只有“年轻”两个字，才代表着无限可能。后来，日子过得越来越快，人开始被时间推着走，一晃神，才发现又一个十年过去了，转眼间，我们已经跨过了30岁的30岁我们把家安在了路上小时候其实没怎么幻想过30岁的生活，那时候觉得20岁才是风华正茂的年纪，好像只有“年轻”两个字，才代表着无限可能。后来，日子过得越来越快，人开始被时间推着走，一晃神，才发现又一个十年过去了，转眼间，我们已经跨过了30岁的30岁我们把家安在了路上小时候其实没怎么幻想过30岁的生活，那时候觉得20岁才是风华正茂的年纪，好像只有“年轻”两个字，才代表着无限可能。后来，日子过得越来越快，人开始被时间推着走，一晃神，才发现又一个十年过去了，转眼间，我们已经跨过了30岁的30岁我们把家安在了路上小时候其实没怎么幻想过30岁的生活，那时候觉得20岁才是风华正茂的年纪，好像只有“年轻”两个字，才代表着无限可能。后来，日子过得越来越快，人开始被时间推着走，一晃神，才发现又一个十年过去了，转眼间，我们已经跨过了30岁的
                                </div>
                            </dd>
                        </dl>
                    </li>--%>
                </ul>
            </div>
        </div>
        <%--我的收藏--%>
        <div class="layui-tab-item">
            <div class="my_collection">
            </div>
        </div>
        <%--我的订单--%>
        <div class="layui-tab-item">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li style="margin-left: 150px;" class="layui-this">全部</li>
                    <li>待支付</li>
                    <li>待出行</li>
                    <li>待点评</li>
                    <li>取消/退款</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="order-table">
                            <table class="order-hd">
                                <tbody>
                                    <tr>
                                        <th class="td-info">订单信息</th>
                                        <th class="td-type">类型</th>
                                        <th class="td-date">行程日期</th>
                                        <th class="td-cost">支付金额</th>
                                        <th class="td-status">订单状态</th>
                                        <th class="td-operate">操作</th>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="order-bd">
                                <table data-id="30290342020082824111018" data-type="sales" class="order-item">
                                    <caption>
                                        <span class="num">订单号：
                                            <a href="/order_center/index/view_order?order_id=30290342020082824111018&amp;busi_type=sales" target="_blank">30290342020082824111018</a>
                                        </span>
                                        <span class="time">下单时间：2020-08-28 20:11:31</span>
                                        <span class="telphone">联系电话：4006588799转11660</span>
                                    </caption>
                                    <tbody>
                                        <tr>
                                            <td class="td-info">
                                                <a class="pro-img" href="http://www.mafengwo.cn/sales/3029034.html" target="_blank">
                                                    <img src="http://b1-q.mafengwo.net/s12/M00/80/4B/wKgED1v3d7KAb3eTAAYgqvc6eIk389.png?imageMogr2%2Fthumbnail%2F%21140x140r%2Fgravity%2FCenter%2Fcrop%2F%21140x140%2Fquality%2F90">
                                                </a>
                                                <div class="pro-detail">
                                                    <p class="title" title="武汉欢乐谷门票（刷身份证入园/支持随时退  日/夜场票）"><a href="http://www.mafengwo.cn/sales/3029034.html" target="_blank">武汉欢乐谷门票（刷身份证入园/支持随时退  日/夜场票）</a></p>
                                                    <p class="sub" title="门票 × 1">门票 × 1</p>
                                                </div>
                                            </td>
                                            <td class="td-type">门票</td>
                                            <td class="td-date">
                                                <p>使用日期(当地时间)：2021-01-06</p>
                                            </td>
                                            <td class="td-cost">
                                                <strong>￥198.00</strong>
                                            </td>
                                            <td class="td-status">
                                                <p class="s0">
                                                    已关闭
                                                </p>
                                            </td>
                                            <td class="td-operate">
                                                <a data-japp="order_delete" data-jappconf="order" data-order_id="30290342020082824111018" data-busi_type="sales" data-track="_refer=list" href="javascript:void(0);">
                                                    删除订单
                                                </a>
                                                <a href="http://www.mafengwo.cn/order_center/index/view_order?order_id=30290342020082824111018&amp;busi_type=sales&amp;_refer=list" target="_blank">
                                                    查看订单
                                                </a>
                                                <a href="http://www.mafengwo.cn/sales/3029034.html?_refer=list" target="_blank">
                                                    重新预订
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div style="min-height: 300px"></div>
                    </div>
                    <div class="layui-tab-item">
                        <div style="min-height: 300px"></div>
                    </div>
                    <div class="layui-tab-item">
                        <div style="min-height: 300px"></div>
                    </div>
                    <div class="layui-tab-item">
                        <div style="min-height: 300px"></div>
                    </div>
                </div>
            </div>
        </div>
        <%--我的好友--%>
        <div class="layui-tab-item">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li style="margin-left: 140px;" class="layui-this">我的关注</li>
                    <li>我的粉丝</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="content">
                            <ul id="follow_list" class="firedInfom clearfix">
                                <%--<li>
                                    <div class="author">
                                        <a href="">
                                            <img src="/FreegoImg/user/null.jpeg" alt="">
                                        </a>
                                    </div>
                                    <div class="name">
                                        <a href="">浅浅蓝信筏</a>
                                    </div>
                                    <div class="num_list clearfix">
                                        <div class="trvelnotes">
                                            <b>29</b>
                                            <span>游记</span>
                                        </div>
                                        <div class="fans">
                                            <b>20</b>
                                            <span>粉丝</span>
                                        </div>
                                    </div>
                                    <div class="btn-follow">
                                        <div class="change-follow">已关注</div>
                                    </div>
                                </li>--%>
                            </ul>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="content">
                            <ul id="fans_list" class="firedInfom clearfix">
                                <%--<li>
                                    <div class="author">
                                        <a href="">
                                            <img src="/FreegoImg/user/head1.jpeg" alt="">
                                        </a>
                                    </div>
                                    <div class="name">
                                        <a href="">我的hr</a>
                                    </div>
                                    <div class="num_list clearfix">
                                        <div class="trvelnotes">
                                            <b>29</b>
                                            <span>游记</span>
                                        </div>
                                        <div class="fans">
                                            <b>20</b>
                                            <span>粉丝</span>
                                        </div>
                                    </div>
                                    <div class="btn-follow">
                                        <div class="change-follow">已关注</div>
                                    </div>
                                </li>--%>
                            </ul>
                        </div>
                    </div>
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
