<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/23 14:37
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>TravelNote</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/travelnote.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <%--导入JavaScript--%>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>

    <script>
        $(function () {
            //——————————————————————————————初始化——————————————————————————————
            var userId;
            var noteId = getParameter("noteId");
            var likeNum = 0;
            var collectNum = 0;
            $.get("/travelnote/queryTravelNoteInfoById", {noteId: noteId}, function (travelnote) {
                console.log("当前游记信息"); console.log(travelnote);
                //查询用户信息
                $.get("/user/findOne", {}, function (user) {
                    if (user) {         //用户登录了
                        userId = user.userId;
                        //是否已关注
                        $.get("/travelnote/isUserFollowedByTravelNoteId", {userId: userId, noteId: noteId}, function (flag) {
                            console.log("当前关注信息: " + flag);
                            if (flag == "true") {
                                $(".person-follow").text("已关注");
                            }
                        });
                        //是否已收藏
                        $.get("/travelnote/isTravelNoteCollect", {userId: userId, noteId: noteId}, function (flag) {
                            console.log("当前收藏信息: " + flag);
                            if (flag == "true") {
                                $("#tn_collect_icon").css('color', '#ff9d00');
                            }
                        });
                        //是否已点赞
                        $.get("/travelnote/isTravelNoteLike", {userId: userId, noteId: noteId}, function (flag) {
                            console.log("当前点赞信息: " + flag);
                            if (flag == "true") {
                                $("#tn_like_icon").css('color', '#ff9d00');
                            }
                        });
                        $("#login_out").remove();//移除未登录标签
                        var userHead = user.userHeadPicturePath;
                        var head = '<img class="user-head-pic" src="/FreegoImg/user/' + userHead + '">';
                        $("#user_head").html(head);
                    } else {
                        userId = 0;
                        $("#login_in").remove();//移除已登录标签
                        location.href="http://localhost:8080/lww/login.jsp";
                    }
                });
                //获取游记收藏量
                $.get("/travelnote/queryTravelNoteCollectionNum", {userId: userId, noteId: noteId}, function (number) {
                    console.log("当前收藏数量信息: " + number);
                    collectNum = parseInt(number);
                    $("#tn_collect_num").text(number + "收藏");
                });
                //获取游记点赞量
                $.get("/travelnote/queryTravelNoteLikeNum", {userId: userId, noteId: noteId}, function (number) {
                    console.log("当前点赞数量信息: " + number);
                    likeNum = parseInt(number);
                    $("#tn_like_num").text(number + "点赞");
                });
                //获取位置名称
                $.get("/travelnote/matchLocate", {locateId: travelnote.travelLocate}, function (locate) {
                    console.log("当前位置信息: " + locate);
                    $("#travelnote_locate").html('<img src="../images/li/travelnote/Icon/locate.jpeg">目的地<span>/</span>' + locate);
                });
                //获取人物名称
                $.get("/travelnote/matchPeople", {peopleId: travelnote.travelPerson}, function (people) {
                    console.log("当前人物信息: " + people);
                    $("#travelnote_people").html('<img src="../images/li/travelnote/Icon/people.jpeg">人物<span>/</span>' + people);
                });
                $("#set_bg_cover").attr("src",travelnote.travelNoteCover);
                $("#travelnote_title").text(travelnote.travelNoteTitle);
                $("#publish_time").text(travelnote.publishDate);
                $("#view_num").html('<img src="../images/li/travelnote/Icon/eye.jpeg">'+(parseInt(travelnote.pageViews) + 1));
                $("#travelnote_time").html('<img src="../images/li/travelnote/Icon/time.jpeg">出发时间<span>/</span>' + travelnote.travelTime);
                $("#travelnote_day").html('<img src="../images/li/travelnote/Icon/day.jpeg">出行天数<span>/</span>' + travelnote.travelDays);
                $("#travelnote_cost").html('<img src="../images/li/travelnote/Icon/cost.jpeg">人均费用<span>/</span>' + travelnote.travelPrice);
                $("#content_box").html(travelnote.travelNoteText);
                //更新文章浏览量
                $.get("/travelnote/updateTravelNoteView", {noteId: noteId}, function (flag) {
                    console.log("更新文章浏览量结果: " + flag);
                });
            });
            //————————————————————————————绑定触发事件——————————————————————————————
            //关注按钮
            $(".person-follow").click(function () {
                var follow = $("#person_follow").text();
                console.log("关注信息:" + follow);
                if (follow == "关注") {
                    $("#person_follow").text("已关注");
                } else {
                    $("#person_follow").text("关注");
                }
                //更新关注信息
                $.get("/travelnote/updateUserFollowByTravelNoteId", {userId: userId, noteId: noteId}, function (flag) {
                    console.log("更新关注结果: " + flag);
                });
            });
            //收藏按钮
            $("#tn_collect_icon").click(function () {
                var color = "" + $("#tn_collect_icon").css("color");
                console.log("收藏按钮颜色: " + color);
                if (color == "rgb(0, 0, 0)") {
                    $("#tn_collect_icon").css('color', '#ff9d00');
                    collectNum = collectNum + 1;
                    $("#tn_collect_num").text(collectNum + "收藏");
                } else {
                    $("#tn_collect_icon").css('color', '#000000');
                    collectNum = collectNum - 1;
                    $("#tn_collect_num").text(collectNum + "收藏");
                }
                //更新收藏信息
                $.get("/travelnote/updateTravelNoteCollect", {userId: userId, noteId: noteId}, function (flag) {
                    console.log("更新收藏结果: " + flag);
                });
            });
            //点赞按钮
            $("#tn_like_icon").click(function () {
                var color = "" + $("#tn_like_icon").css("color");
                console.log("点赞按钮颜色: " + color);
                if (color == "rgb(0, 0, 0)") {
                    $("#tn_like_icon").css('color', '#ff9d00');
                    likeNum = likeNum + 1;
                    $("#tn_like_icon").text(likeNum + "收藏");
                } else {
                    $("#tn_like_icon").css('color', '#000000');
                    likeNum = likeNum - 1;
                    $("#tn_like_icon").text(likeNum + "收藏");
                }
                //更新点赞信息
                $.get("/travelnote/updateTravelNoteLike", {userId: userId, noteId: noteId}, function (flag) {
                    console.log("更新点赞结果: " + flag);
                });
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
                <li id="head_nav_index_li" role="presentation"><a href="" id="head_nav_index_a">首页</a></li>
                <li id="head_nav_scenic_li" role="presentation"><a href="" id="head_nav_scenic_a" title="景点">景点</a></li>
                <li id="head_nav_hotel_li" role="presentation"><a href="" id="head_nav_hotel_a" title="酒店">订酒店</a></li>
                <li id="head_nav_gonglve_li" role="presentation"><a href="" id="head_nav_gonglve_a" title="旅游攻略">旅游攻略</a></li>
            </ul>
            <div class="top-search-bar">
                <div class="top-search-wrapper">
                    <div class="top-search-input">
                        <input name="q" type="text" id="top_search_input" placeholder="" autocomplete="off">
                        <a role="button" href="javascript:" class="glyphicon glyphicon-search" id="top_head_search_link"></a>
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
                <button id="login_in" class="login_in layui-btn layui-btn-primary">
                    <div class="user-head" id="user_head">
                        <img class="user-head-pic" src="/FreegoImg/user/null.jpeg">
                    </div>
                    <i class="glyphicon glyphicon-chevron-down"></i>
                </button>
            </div>
        </div>
    </div>

    <div class="main">
        <%--游记头部--%>
        <div class="set-index" id="cover_box">
            <div class="set-bg-load-cover">
                <img id="set_bg_cover" src="/FreegoImg/li/travelnote/51.jpeg">
            </div>

            <div class="set-title">
                <div class="title-info">
                    <h1 class="travelnote-title" id="travelnote_title">浦口｜寻觅山水田园，不负春光。</h1>
                </div>
            </div>
        </div>
        <div class="set-info clearfix">

            <div class="user-head">
                <img src="/FreegoImg/user/head12.jpeg">
            </div>
            <div class="person">
                <div>
                    <div id="person_name" class="person-name">H-C川(上海)</div>
                    <div id="person_follow" class="person-follow">关注</div>
                    <div class="publish-time">
                        <span class="time" id="publish_time">2021-04-06</span>
                        <span id="view_num"><img src="../images/li/travelnote/Icon/eye.jpeg">3.7w</span>
                    </div>
                </div>
            </div>

            <div class="bar-collection-like">
                <div class="collection">
                    <a href="javascript:void(0);" rel="nofollow" class="tn-btn">
                        <i id="tn_collect_icon" class="glyphicon glyphicon-star-empty"></i>
                        <span id="tn_collect_num">11收藏</span>
                    </a>
                </div>
                <div class="like">
                    <a href="javascript:void(0);" rel="nofollow" class="tn-btn">
                        <i id="tn_like_icon" class="glyphicon glyphicon-thumbs-up"></i>
                        <span id="tn_like_num">681点赞</span>
                    </a>
                </div>
            </div>

        </div>
        <%--游记内容--%>
        <div class="travelnote-view clearfix">
            <div class="view-con">
                <%--游记特点--%>
                <div class="travelnote-directory">
                    <div class="travelnote-dir-list">
                        <ul>
                            <li class="time" id="travelnote_time">
                                <img src="../images/li/travelnote/Icon/time.jpeg">出发时间<span>/</span>2021-03-26
                            </li>
                            <li class="day" id="travelnote_day">
                                <img src="../images/li/travelnote/Icon/day.jpeg">出行天数<span>/</span>3天
                            </li>
                            <li class="people" id="travelnote_people">
                                <img src="../images/li/travelnote/Icon/people.jpeg">人物<span>/</span>情侣/夫妻
                            </li>
                            <li class="cost" id="travelnote_cost">
                                <img src="../images/li/travelnote/Icon/cost.jpeg">人均费用<span>/</span>1000RMB
                            </li>
                            <li class="locate" id="travelnote_locate">
                                <img src="../images/li/travelnote/Icon/locate.jpeg">目的地<span>/</span>上海
                            </li>
                        </ul>
                    </div>
                </div>
                <%--游记正文--%>
                <div class="vc-article">
                    <div class="vc-con master-content">
                        <div class="content-box" id="content_box"></div>
                    </div>
                    <%--举报部分--%>
                    <div class="report">
                        <a class="r-report">举报</a>
                    </div>
                </div>
            </div>
            <%--游记评论--%>
            <div class="note-reply-bottomReplyApi">
                <div class="freego-cmt-warp" id="top_reply_list">

                    <div class="freego-cmt-item" id="note_reply_127001353" data-username="MkocoIe">
                        <div class="comment-info">
                            <div class="comment-user-head">
                                <a href="" title="MkocoIe" target="_blank">
                                    <img src="/FreegoImg/user/head6.jpeg" alt="MkocoIe">
                                </a>
                            </div>
                            <div class="comment-user-nickname">
                                <a class="" target="_blank">MkocoIe</a>
                            </div>
                        </div>
                        <div class="comment-con-warp clearfix">
                            <div class="comment-con">
                                <div class="comment-photo">
                                    <img style="height: 450px;" src="/FreegoImg/li/travelnote/note_photo_1167180750.jpg">
                                </div>
                                <div class="comment-word">
                                    <p>哇哦~太美了</p>
                                </div>
                            </div>
                            <div class="comment-bot">
                                <div class="time">2021-04-06 09:54</div>
                                <div class="option">
                                    <a role="button" class="reply">回复</a>
                                </div>
                            </div>
                            </div>
                    </div>
                    <div style="padding-left: 68px;" class="freego-cmt-item" id="note_reply_127001734" data-username="H-C川">
                        <div class="comment-info">
                            <div class="comment-user-head">
                                <a href="" title="Muse" target="_blank">
                                    <img src="/FreegoImg/user/head12.jpeg" alt="H-C川">
                                </a>
                            </div>
                            <div class="comment-user-nickname">
                                <a class="" target="_blank">H-C川</a>
                                <p>回复</p>
                                <a class="" target="_blank">MkocoIe</a>
                            </div>
                        </div>
                        <div class="comment-con-warp clearfix">
                            <div class="comment-word">
                                <p>谢谢啦，以后我也会尽量多发一些游记。</p>
                            </div>
                        </div>
                        <div class="comment-bot">
                            <div class="time">2021-04-06 10:34</div>
                            <div class="option">
                                <a role="button" class="reply">回复</a>
                            </div>
                        </div>
                    </div>
                    <div style="padding-left: 68px;" class="freego-cmt-item" id="note_reply_127001740" data-username="MkocoIe">
                        <div class="comment-info">
                            <div class="comment-user-head">
                                <a href="" title="Muse" target="_blank">
                                    <img src="/FreegoImg/user/head6.jpeg" alt="MkocoIe">
                                </a>
                            </div>
                            <div class="comment-user-nickname">
                                <a class="" target="_blank">MkocoIe</a>
                                <p>回复</p>
                                <a class="" target="_blank">H-C川</a>
                            </div>
                        </div>
                        <div class="comment-con-warp clearfix">
                            <div class="comment-word">
                                <p>嗯嗯，期待您更多的游记。</p>
                            </div>
                        </div>
                        <div class="comment-bot">
                            <div class="time">2021-04-06 10:34</div>
                            <div class="option">
                                <a role="button" class="reply">回复</a>
                            </div>
                        </div>
                    </div>


                    <div class="freego-cmt-item" id="note_reply_127005928" data-username="MkocoIe">
                        <div class="comment-info">
                            <div class="comment-user-head">
                                <a href="" title="MkocoIe" target="_blank">
                                    <img src="/FreegoImg/user/head6.jpeg" alt="MkocoIe">
                                </a>
                            </div>
                            <div class="comment-user-nickname">
                                <a class="" target="_blank">MkocoIe</a>
                            </div>
                        </div>
                        <div class="comment-con-warp clearfix">
                            <div class="comment-con">
                                <div class="comment-photo">
                                    <img style="height: 450px;" src="/FreegoImg/li/travelnote/note_photo_1167193224.jpg">
                                </div>
                                <div class="comment-word">
                                    <p>美美美</p>
                                </div>
                            </div>
                            <div class="comment-bot">
                                <div class="time">2021-04-07 10:23</div>
                                <div class="option">
                                    <a role="button" class="reply">回复</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="padding-left: 68px;" class="freego-cmt-item" id="note_reply_127006348" data-username="H-C川">
                        <div class="comment-info">
                            <div class="comment-user-head">
                                <a href="" title="Muse" target="_blank">
                                    <img src="/FreegoImg/user/head12.jpeg" alt="H-C川">
                                </a>
                            </div>
                            <div class="comment-user-nickname">
                                <a class="" target="_blank">H-C川</a>
                                <p>回复</p>
                                <a class="" target="_blank">MkocoIe</a>
                            </div>
                        </div>
                        <div class="comment-con-warp clearfix">
                            <div class="comment-word">
                                <p>谢谢夸赞</p>
                            </div>
                        </div>
                        <div class="comment-bot">
                            <div class="time">2021-04-07 14:17</div>
                            <div class="option">
                                <a role="button" class="reply">回复</a>
                            </div>
                        </div>
                    </div>


                    <div class="freego-cmt-item" id="note_reply_127005942" data-username="西兰花花花">
                        <div class="comment-info">
                            <div class="comment-user-head">
                                <a href="" title="MkocoIe" target="_blank">
                                    <img src="/FreegoImg/user/head9.jpeg" alt="西兰花花花">
                                </a>
                            </div>
                            <div class="comment-user-nickname">
                                <a class="" target="_blank">西兰花花花</a>
                            </div>
                        </div>
                        <div class="comment-con-warp clearfix">
                            <div class="comment-con">
                                <div class="comment-photo">
                                    <img style="height: 200px;" src="/FreegoImg/li/travelnote/note_photo_1167182750.jpg">
                                </div>
                                <div class="comment-word">
                                    <p>叼烟？？哈哈哈</p>
                                </div>
                            </div>
                            <div class="comment-bot">
                                <div class="time">2021-04-08 9:23</div>
                                <div class="option">
                                    <a role="button" class="reply">回复</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="padding-left: 68px;" class="freego-cmt-item" id="note_reply_127006384" data-username="H-C川">
                        <div class="comment-info">
                            <div class="comment-user-head">
                                <a href="" title="Muse" target="_blank">
                                    <img src="/FreegoImg/user/head12.jpeg" alt="H-C川">
                                </a>
                            </div>
                            <div class="comment-user-nickname">
                                <a class="" target="_blank">H-C川</a>
                                <p>回复</p>
                                <a class="" target="_blank">西兰花花花</a>
                            </div>
                        </div>
                        <div class="comment-con-warp clearfix">
                            <div class="comment-word">
                                <p>哈哈，这都被你发现啦</p>
                            </div>
                        </div>
                        <div class="comment-bot">
                            <div class="time">2021-04-08 16:17</div>
                            <div class="option">
                                <a role="button" class="reply">回复</a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="comment-reply-warp">
                    <div class="comment-tab">
                        <div>回复游记</div>
                    </div>
                    <div class="comment-tab-con">
                        <div class="photo-con">
                            <a href="" target="_blank" title="">
                                <img src="/FreegoImg/user/head1.jpeg" alt="">
                            </a>
                        </div>
                        <div class="reply-con clearfix" id="reply_editer">
                            <div class="reply-text">
                                <textarea class="reply-area" name="reply_content" cols="30" rows="10"></textarea>
                            </div>
                            <div class="reply-submit">
                                <a role="button" class="publish-reply" title="发表回复">发表回复</a>
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

    <script>
        /*头部*/
        document.getElementById("head_nav_gonglve_li").style.background="#ff9d00";
        document.getElementById("head_nav_gonglve_a").style.color="#FFFFFF";
    </script>

</body>
</html>
