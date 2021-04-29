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
    <%--导入头部--%>
    <div id="header">
        <div class="freego_header clearfix" id="head_nav_warper">
            <div class="head_logo"><a class="freego_logo" title="FreeGo" href="http://localhost:8080/index.jsp"></a></div>
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
                <img src="/FreegoImg/li/travelnote/51.jpeg">
            </div>

            <div class="set-title">
                <div class="title-info">
                    <h1 class="travelnote-title">浦口｜寻觅山水田园，不负春光。</h1>
                </div>
            </div>
        </div>
        <div class="set-info clearfix">

            <div class="user-head">
                <img src="/FreegoImg/user/head12.jpeg">
            </div>
            <div class="person">
                <div>
                    <a href="" target="_blank" class="person-name">H-C川(上海)</a>
                    <a href="" target="_blank" class="person-follow">
                        <span class="glyphicon glyphicon-plus"></span>
                        关注
                    </a>
                    <div class="publish-time">
                        <span class="time">2021-04-06</span>
                        <span>
                            <img src="../images/li/travelnote/Icon/eye.jpeg">
                            3.7w
                        </span>
                    </div>
                </div>
            </div>

            <div class="bar-collection-like">
                <div class="collection">
                    <a href="javascript:void(0);" rel="nofollow" class="tn-btn">
                        <i class="glyphicon glyphicon-star-empty"></i>
                        <span>11收藏</span>
                    </a>
                </div>
                <div class="like">
                    <a href="javascript:void(0);" rel="nofollow" class="tn-btn">
                        <i class="glyphicon glyphicon-thumbs-up"></i>
                        <span>681点赞</span>
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
                            <li class="time">
                                <img src="../images/li/travelnote/Icon/time.jpeg">
                                出发时间
                                <span>/</span>
                                <p id="travelnote_time">2021-03-26</p>
                            </li>
                            <li class="day">
                                <img src="../images/li/travelnote/Icon/day.jpeg">
                                出行天数
                                <span>/</span>
                                <p id="travelnote_day">3天</p>
                            </li>
                            <li class="people">
                                <img src="../images/li/travelnote/Icon/people.jpeg">
                                人物
                                <span>/</span>
                                <p id="travelnote_people">情侣/夫妻</p>
                            </li>
                            <li class="cost">
                                <img src="../images/li/travelnote/Icon/cost.jpeg">
                                人均费用
                                <span>/</span>
                                <p id="travelnote_cost">1000RMB</p>
                            </li>
                            <li class="locate">
                                <img src="../images/li/travelnote/Icon/locate.jpeg">
                                目的地
                                <span>/</span>
                                <p id="travelnote_locate">上海</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <%--游记正文--%>
                <div class="vc-article">
                    <div class="vc-con master-content">
                        <div class="content-box">
                            <p class="note-content">
                                好多人记住“浦口”这个地名，源自于朱自清的那篇散文《背影》，其中描写的火车站，便是南京江北的浦口，而我却是从《金陵十三钗》豆蔻：“你叫浦生，浦口生的，我家也是浦口的”，这句话而得知。
                                <br>
                                <br>
                                南京 作为旅行宝藏地，浦口区之前都没有列入我的旅行清单里，这一次主要想踏青，经攻略研究，才发现山水田园的浦口，拥有所有一切关于春天的描述。
                            </p>
                            <div class="article-title">
                                <span class="anchor t1">不负春光</span>
                            </div>
                            <p class="note-content">漫步永宁张圩，在蓝天下赏金色油菜花海。</p>
                            <div id="note_photo_1167180750" class="add-pic anchorcnt-seqitem">
                                <img src="/FreegoImg/li/travelnote/note_photo_1167180750.jpg">
                            </div>
                            <p class="note-content">听一阵樱花纷纷，邂逅一场粉色的梦。</p>
                            <div id="note_photo_1167193222" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167193222.jpg">
                            </div>
                            <p class="note-content">穿梭在老山森林间，探秘大自然的美妙。</p>
                            <div id="note_photo_1167965372" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167965372.jpg">
                            </div>
                            <div id="note_photo_1168632765" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1168632765.jpg">
                            </div>
                            <p class="note-content">游历于生态乐园，感受摩天轮下的春暖花开</p>
                            <div id="note_photo_1170156340" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1170156340.jpg">
                            </div>
                            <div id="note_photo_1170171463" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1170171463.jpg">
                            </div>
                            <div class="article-title">
                                <h2 class="t1">
                                    <span class="anchor">【一】</span>
                                </h2>
                            </div>
                            <div class="article-title">
                                <span class="anchor t1">滨江风光带</span>
                            </div>
                            <p class="note-content">
                                避开人头攒动的鸡鸣寺赏樱，寻一处小众秘境。滨江风光带，千株樱花竞相绽放，依山傍水， 临江 赏樱。
                                <br>
                                <br>
                                说起来 南京 也是滨江城市，蜿蜒流淌的长江给 南京 城留下了百公里的主岸线，在打造一个绿色生态环境的同时保留了一些原有的姿色，如今这里也成为很多老 南京 人都想去走一走的新景观。
                            </p>
                            <div id="note_photo_1167387227" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167387227.jpg">
                            </div>
                            <div id="note_photo_1167596203" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167596203.jpg">
                            </div>
                            <div id="note_photo_1167193219" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167193219.jpg">
                            </div>
                            <p class="note-content">
                                滨江风光带位于浦口闻涛广场附近，春暖花开，虽不能面向大海，但行走在滨江风光带景色撩人，暖暖的江风拂面，醉人的碧草樱花清香沁人心脾。
                                <br>
                                <br>
                                在这里可以驻扎帐篷野餐，边吃着甜品吹着江风，看着来往的渡轮货船游走于江面之上，正值春的好时光，这种场景也太惬意了吧~
                            </p>
                            <div id="note_photo_1167193203" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167193203.jpg">
                            </div>
                            <div id="note_photo_1167192994" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167192994.jpg">
                            </div>
                            <div id="note_photo_1167193224" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167193222.jpg">
                            </div>
                            <div id="note_photo_1167193243" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167193243.jpg">
                            </div>
                            <div id="note_photo_1167193276" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167193276.jpg">
                            </div>
                            <div id="note_photo_1167193251" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1167193251.jpg">
                            </div>
                            <p class="note-content">
                                临近江边有一处集观景、休闲设施、游憩、乐园等多功能为一体的公园。
                                <br>
                                <br>
                                因樱花年份的关系，不同于樱花大道，公园内的樱花稍显小家碧玉，但也丝毫不减欣赏它的柔美，这里赏樱空间宽阔舒适，满眼春光。
                            </p>
                            <div class="article-title">
                                <span class="anchor t1">·福寿居共享度假小院</span>
                            </div>
                            <p class="note-content">
                                福寿居共享度假小院临近 永宁 张圩油菜花海，因赏花较晚，临行前决定就近选择一家，没想到 永宁 小镇上还有一处如此干净温馨的民宿。
                                <br>
                                <br>
                                民宿由一对夫妻经营，老板娘很爱干净，我们从入口便是脱鞋的状态哈～
                            </p>
                            <div id="note_photo_1170313782">
                                <img src="/FreegoImg/li/travelnote/note_photo_1170313782.jpg">
                            </div>
                            <p class="note-content">
                                整个大堂和房间的布置简约大气，桌面上还摆放了有关浦口的书籍画册，透过玻璃窗前可见水光倒影，这才是真正的小桥流水人家吧～
                                <br>
                                <br>
                                对了，民宿有餐厅的哦～ 用餐需要提前预定。
                            </p>
                            <div id="note_photo_1170313784" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1170313784.jpg">
                            </div>
                            <div id="note_photo_1170313786" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1170313786.jpg">
                            </div>
                            <div id="note_photo_1170313788" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1170313788.jpg">
                            </div>
                            <div id="note_photo_1170313790" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1170313790.jpg">
                            </div>
                            <div id="note_photo_1170313792" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1170313792.jpg">
                            </div>
                            <div class="article-title">
                                <span class="anchor t1">行程</span>
                            </div>
                            <p class="note-content">
                                3天2晚的行程
                                <br>
                                <br>
                                D1:上海—南京南（高铁）—租车提车—滨江风光带— 永宁 张圩油菜花海—侯冲樱花隧道—西埂莲乡村（宿：福寿居共享度假小院）
                                <br>
                                <br>
                                D2:老山国家森林公园—水墨大埝（宿：汤泉大吉温泉度假村）
                                <br>
                                <br>
                                D3：惠济寺遗址文化公园—雨发生态旅游区—还车—返程 上海 （高铁）
                                <br>
                                <br>
                                短暂的旅途将告一段落，镜头里定格的每一瞬间，旅行中路过的每一处风景，都是我的经历，而下一次的未知魅力，都是最期待的。
                            </p>
                            <div id="note_photo_1175043811" class="add-pic anchorcnt-seqitem" >
                                <img src="/FreegoImg/li/travelnote/note_photo_1175043811.jpg">
                            </div>
                        </div>
                    </div>
                    <%--举报部分--%>
                    <div class="report">
                        <a class="r-report">举报</a>
                    </div>
                </div>
            </div>
            <%--游记目录--%>
            <%--<div class="view-side">
                <div id="pagelet-block-1aecefa7c9d7389a7c594923a53dcc1c" class="pagelet-block">
                    <div class="notes-catalog">
                        <div class="side-title" id="catalog_title">游记目录</div>
                        <div id="pagelet-block-60e0226a9a32d403a320ee76fa6ab210" class="pagelet-block">
                            <div id="catalog_list">
                                <ul class="catalog-content">
                                    <li class="vatalog-city" id="paragraph_nav_0">
                                        <span class="catalog-num">01/</span>
                                        <a role="button" tabindex="0" title="默认段落(0)" class="catalog-line-catalog-link">默认段落</a>
                                    </li>
                                    <li class="vatalog-city" id="paragraph_nav_1">
                                        <span class="catalog-num">02/</span>
                                        <a role="button" tabindex="0" title="不负春光(0)" class="catalog-line-catalog-link">不负春光</a>
                                    </li>
                                    <li class="vatalog-city" id="paragraph_nav_2">
                                        <span class="catalog-num">03/</span>
                                        <a role="button" tabindex="0" title="【一】(0)" class="catalog-line-catalog-link">【一】</a>
                                    </li>
                                    <li class="vatalog-city" id="paragraph_nav_3">
                                        <span class="catalog-num">04/</span>
                                        <a role="button" tabindex="0" title="滨江风光带(0)" class="catalog-line-catalog-link">滨江风光带</a>
                                    </li>
                                    <li class="vatalog-city" id="paragraph_nav_4">
                                        <span class="catalog-num">05/</span>
                                        <a role="button" tabindex="0" title="·福寿居共享度假小院(0)" class="catalog-line-catalog-link">·福寿居共享度假小院</a>
                                    </li>
                                    <li class="vatalog-city" id="paragraph_nav_5">
                                        <span class="catalog-num">06/</span>
                                        <a role="button" tabindex="0" title="行程(0)" class="catalog-line-catalog-link">行程</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
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
