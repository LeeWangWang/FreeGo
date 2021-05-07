<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/20 15:38
  Description: FreeGo主页
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FreeGo</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <%--导入JavaScript--%>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>

    <script>
        $(function () {
            //判断用户是否登录
            $.get("/user/findOne", {}, function (user) {
                if (user) {
                    //用户登录了
                    console.log("当前登录用户Id:" + user.userId);
                    $("#login_out").remove();//移除未登录标签
                    var userHead = user.userHeadPicturePath;
                    var head = '<img class="user-head-pic" src="/FreegoImg/user/' + userHead + '">';
                    $("#user_head").html(head);
                } else {
                    $("#login_in").remove();//移除已登录标签
                    location.href="http://localhost:8080/lww/login.jsp";
                }
            });

            //当页码加载完成后，调用load方法，发送ajax请求加载数据
            load(null);

            //发表游记
            $("#travelnoe_publish").click(function () {
                $.get("/user/findOne", {}, function (user) {
                    if (user) {
                        //用户登录了
                        location.href = "http://localhost:8080/lww/publish.jsp";
                    } else {
                        location.href = "http://localhost:8080/lww/login.jsp";
                    }
                });
            });

            $("#user_head").click(function () {
                location.href = "http://localhost:8080/lww/userMain.jsp";
            });

            //当表单提交时，调用查询方法
            $("#btn_search").click(function () {
                if ($("#checkbox_travelnote").get(0).checked) {
                    location.href="http://localhost:8080/lww/search.jsp?type=1&search=" + $("#index_search_input_all").val();
                    // do something
                } else if ($("#checkbox_scenic").get(0).checked) {
                    // do something
                } else {
                    //do something
                }
            });
        });

        function load(currentPage) {
            //游记推荐
            $.get("/user/findOne", {}, function (user) {
                var userId = user.userId;
                $.post("/travelnote/recommendTravelNoteInfo", {userId : userId, currentPage:currentPage}, function (pb) {
                    var data = pb.headRow;
                    console.log("游记推荐: "); console.log(pb);
                    //更改轮播图信息
                    $("#travelNote_date_1").html(data[0].travelTime);
                    $("#travelNote_title_1").html(data[0].travelNoteTitle);
                    $(".banner-href-1").attr("href", "http://localhost:8080/lww/travelnote.jsp?noteId=" + data[0].travelNoteId);
                    $("#banner_img_1").html('<img src="'+data[0].travelNoteCover+'" alt="" class="banner-picture">');

                    $("#travelNote_date_2").html(data[1].travelTime);
                    $("#travelNote_title_2").html(data[1].travelNoteTitle);
                    $(".banner-href-2").attr("href", "http://localhost:8080/lww/travelnote.jsp?noteId=" + data[1].travelNoteId);
                    $("#banner_img_2").html('<img src="'+data[1].travelNoteCover+'" alt="" class="banner-picture">');

                    $("#travelNote_date_3").html(data[2].travelTime);
                    $("#travelNote_title_3").html(data[2].travelNoteTitle);
                    $(".banner-href-3").attr("href", "http://localhost:8080/lww/travelnote.jsp?noteId=" + data[2].travelNoteId);
                    $("#banner_img_3").html('<img src="'+data[2].travelNoteCover+'" alt="" class="banner-picture">');

                    $("#travelNote_date_4").html(data[3].travelTime);
                    $("#travelNote_title_4").html(data[3].travelNoteTitle);
                    $(".banner-href-4").attr("href", "http://localhost:8080/lww/travelnote.jsp?noteId=" + data[3].travelNoteId);
                    $("#banner_img_4").html('<img src="'+data[3].travelNoteCover+'" alt="" class="banner-picture">');

                    //1.分页工具条数据展示
                    //1.1 展示总页码和总记录数
                    $("#totalPage").html(pb.totalPage);
                    $("#totalCount").html(pb.totalCount);

                    var lis = "";

                    var fristPage = '<li onclick="javascipt:load(1)"><a href="javascript:void(0)">首页</a></li>';

                    //计算上一页的页码
                    var beforeNum =  pb.currentPage - 1;
                    if(beforeNum <= 0) {
                        beforeNum = 1;
                    }
                    var beforePage = '<li  onclick="javascipt:load('+beforeNum+')" class="threeword"><a href="javascript:void(0)">上一页</a></li>';

                    lis += fristPage;
                    lis += beforePage;

                    var begin; // 开始位置
                    var end ; //  结束位置

                    //1.要显示5个页码
                    if(pb.totalPage < 5){
                        //总页码不够5页
                        begin = 1;
                        end = pb.totalPage;
                    }else{
                        //总页码超过5页
                        begin = pb.currentPage - 3 ;
                        end = pb.currentPage + 2 ;

                        //2.如果前边不够3个，后边补齐5个
                        if(begin < 1){
                            begin = 1;
                            end = begin + 4;
                        }

                        //3.如果后边不足2个，前边补齐5个
                        if(end > pb.totalPage){
                            end = pb.totalPage;
                            begin = end - 4 ;
                        }
                    }

                    for (var i = begin; i <= end ; i++) {
                        var li;
                        //判断当前页码是否等于i
                        if(pb.currentPage == i){
                            li = '<li class="curPage" onclick="javascipt:load('+i+')"><a href="javascript:void(0)">'+i+'</a></li>';
                        }else{
                            //创建页码的li
                            li = '<li onclick="javascipt:load('+i+')"><a href="javascript:void(0)">'+i+'</a></li>';
                        }
                        //拼接字符串
                        lis += li;
                    }

                    //计算下一页的页码
                    var nextNum =  pb.currentPage + 1;
                    if(nextNum >= pb.totalPage){
                        nextNum = pb.totalPage;
                    }

                    var nextPage = '<li  onclick="javascipt:load('+nextNum+')" class="threeword"><a href="javascript:void(0)">下一页</a></li>';

                    var lastPage = '<li onclick="javascipt:load('+pb.totalPage+')"><a href="javascript:void(0)">末页</a></li>';

                    lis += nextPage;
                    lis += lastPage;

                    //将lis内容设置到 ul
                    $("#pageNum").html(lis);

                    // 2.列表数据展示
                    var travelnoteList = pb.list;
                    var locateList = pb.locate;
                    var userList = pb.userList;
                    var collectList = pb.collectNum;
                    var likeList = pb.likeNum;
                    var route_lis = "";
                    // 2.1展示游记信息
                    for (var i = 0; i < travelnoteList.length; i++) {
                        var noteInfo = travelnoteList[i];
                        var locateInfo = locateList[i];
                        var userInfo = userList[i];
                        var collectInfo = collectList[i];
                        var likeInfo = likeList[i];
                        var noteText = noteInfo.travelNoteText.replace(/<\/?.*>/ig, '');
                        noteText = noteText.substr(0, 170) + "...";
                        var li = '<div class="travelnote-item clearfix">\n' +
                                '    <div class="travelnote-left">\n' +
                                '        <a href="http://localhost:8080/lww/travelnote.jsp?noteId='+noteInfo.travelNoteId+'" target="_blank">\n' +
                                '            <img src="'+noteInfo.travelNoteCover+'" alt="" class="travelnote-picture">\n' +
                                '        </a>\n' +
                                '    </div>\n' +
                                '    <div class="travelnote-right">\n' +
                                '        <dl>\n' +
                                '            <dt>\n' +
                                '                <a href="http://localhost:8080/lww/travelnote.jsp?noteId='+noteInfo.travelNoteId+'" target="_blank">'+noteInfo.travelNoteTitle+'</a>\n' +
                                '            </dt>\n' +
                                '            <dd>\n' +
                                '                <a href="http://localhost:8080/lww/travelnote.jsp?noteId='+noteInfo.travelNoteId+'" target="_blank" class="travelnote-list-text">'+noteText+'</a>\n' +
                                '            </dd>\n' +
                                '        </dl>\n' +
                                '        <div class="travelnote-extra">\n' +
                                '            <%--定位--%>\n' +
                                '            <div class="travelnote-location">\n' +
                                '                <img class="travelnote-location-pic" src="../images/li/travelnote/Icon/location.jpeg">\n' +
                                '                <div id="locate_'+noteInfo.travelNoteId+'" class="travelnote-location-text">'+locateInfo+'</div>\n' +
                                '            </div>\n' +
                                '            <%--用户--%>\n' +
                                '            <div class="travelnote-user">\n' +
                                '                <div class="travelnote-user-head">\n' +
                                '                    <img class="travelnote-user-head-pic" src="/FreegoImg/user/'+userInfo.userHeadPicturePath+'">\n' +
                                '                </div>\n' +
                                '                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">'+userInfo.userNickName+'</a>\n' +
                                '            </div>\n' +
                                '            <%--浏览量/收藏量--%>\n' +
                                '            <div class="travelnote-view-collection">\n' +
                                '                <img src="../images/li/travelnote/Icon/eye.jpeg">\n' +
                                '                <div class="travelnote-view">'+noteInfo.pageViews+'/</div>\n' +
                                '                <div id="collectNum_'+noteInfo.travelNoteId+'" class="travlenote-collection">'+collectInfo+'</div>\n' +
                                '            </div>\n' +
                                '            <%--点赞量--%>\n' +
                                '            <div class="travelnote-like">\n' +
                                '                <div id="likeNum_'+noteInfo.travelNoteId+'" class="travelnote-user-likes">'+likeInfo+'</div>\n' +
                                '                <img class="travelnote-user-likes-pic" src="../images/li/travelnote/Icon/like.jpeg">\n' +
                                '            </div>\n' +
                                '        </div>\n' +
                                '    </div>\n' +
                                '</div>';
                        route_lis += li;
                    }
                    $("#travelnote_list").html(route_lis);
                    //定位到页面顶部
                    window.scrollTo(0,0);
                });
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

    <%--轮播图--%>
    <section id="freego_banner">

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div id="banner_warp" class="carousel-inner" role="listbox">

                <div id="banner_1" class="item active">
                    <a href="" class="show-title banner-href-1" target="_blank">
                        <div id="travelNote_date_1" class="travelnote-date"></div>
                        <div id="travelNote_title_1" class="travelnote-title"></div>
                    </a>
                    <a id="banner_img_1" href="" class="show-pic banner-href-1" target="_blank">
                    </a>
                </div>

                <div id="banner_2" class="item">
                    <a href="" class="show-title banner-href-2" target="_blank">
                        <div id="travelNote_date_2" class="travelnote-date"></div>
                        <div id="travelNote_title_2" class="travelnote-title"></div>
                    </a>
                    <a id="banner_img_2" href="" class="show-pic banner-href-2" target="_blank">
                    </a>
                </div>

                <div id="banner_3" class="item">
                    <a href="" class="show-title banner-href-3" target="_blank">
                        <div id="travelNote_date_3" class="travelnote-date"></div>
                        <div id="travelNote_title_3" class="travelnote-title"></div>
                    </a>
                    <a id="banner_img_3" href="" class="show-pic banner-href-3" target="_blank">
                    </a>
                </div>

                <div id="banner_4" class="item">
                    <a href="" class="show-title banner-href-4" target="_blank">
                        <div id="travelNote_date_4" class="travelnote-date"></div>
                        <div id="travelNote_title_4" class="travelnote-title"></div>
                    </a>
                    <a id="banner_img_4" href="" class="show-pic banner-href-4" target="_blank">
                    </a>
                </div>

            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <%--搜索框--%>
        <form class="index-search-container layui-form" id="index_search">
            <div class="index-search-group">
                <div class="index-search-tab" id="index_search_tab">
                    <%--单选框--%>
                    <ul class="clearfix">
                        <li class="tab-select" id="select_travelnote">
                            <input id="checkbox_travelnote" type="radio" name="select" value="游记" title="游记" checked>
                        </li>
                        <li class="tab-select" id="select_scenic">
                            <input id="checkbox_scenic" type="radio" name="select" value="景点" title="景点">
                        </li>
                        <li class="tab-select" id="select_hotel">
                            <input id="checkbox_hotel" type="radio" name="select" value="酒店" title="酒店">
                        </li>
                    </ul>
                </div>
                <div class="index-search-bar" id="index_search_bar">
                    <div class="index-search-wrapper">
                        <div class="index-search-input">
                            <input name="q" type="text" placeholder="搜游记/景点/酒店" id="index_search_input_all" autocomplete="off">
                        </div>
                    </div>
                    <button id="btn_search" type="button" class="layui-btn layui-btn-warm layui-btn-radius">搜索</button>
                </div>
            </div>
        </form>

    </section>

    <%--游记部分--%>
    <div class="freego-travelnote">

        <div class="index-travelnote">

            <%--游记tab--%>
            <div class="travelnote-tab">
                <div class="travelnote-hot" id="travelnoe_hot">
                    <a href="javascript:void(0);" rel="nofollow">热门游记</a>
                </div>
                <%--<div class="travelnote-new" id="travelnoe_new">
                    <a href="javascript:void(0);" rel="nofollow">最新发表</a>
                </div>--%>
                <div class="travelnote-publish" id="travelnoe_publish">
                    <img class="travelnote-publish-img" src="../images/li/travelnote/Icon/write.jpeg">
                    <div class="travelnote-publish-text">写游记</div>
                </div>
            </div>

            <%--游记列表--%>
            <div class="page-block-travelnote" id="pgae_block_travelnote">
                <div id="travelnote_list" class="travelnote-list">
                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/11.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">
                            <dl>
                                <dt>
                                    <a href="" target="_blank" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">清明青岛，有点德味儿</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">写在前面 考虑到孕妇的行动不便，为期三天的清明假期我们选择了离北京
                                        不远的青岛作为2021年出行的第一站，也是最后一站。整体来讲， 青岛 虽与九年前的样子差别不大，
                                        能留下深刻印象的景点也不多，却是一个可以短暂放空，享受海鲜饕餮盛宴的清净之地。在清朝末年被
                                        德国人与日本人轮番殖民占领的青岛，通过一系列外资的引入与最新城市规划理念的实践，逐渐登上历史
                                        的舞台，成为当代中国北方最重要的沿海城市之一。如今的青岛继续发扬历史遗留下来的经济文化优. . .</a>
                                </dd>
                            </dl>
                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/Icon/location.jpeg">
                                    <div class="travelnote-location-text">青岛</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/user/head1.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">DiDi_酱</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/Icon/eye.jpeg">
                                    <div class="travelnote-view">1207/</div>
                                    <div class="travlenote-collection">6</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">34</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/Icon/like.jpeg">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%--分页栏--%>
    <div class="page_one">
        <div class="contant">
            <div class="page_num_inf">
                <i></i> 共
                <span id="totalPage">12</span>页<span id="totalCount">132</span>条
            </div>
            <div class="pageNum">
                <ul id="pageNum">
                    <li class="threeword"><a href="#">上一页</a></li>
                    <li class="curPage"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li class="threeword"><a href="javascript:;">下一页</a></li>
                </ul>
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
        document.getElementById("head_nav_index_li").style.background="#ff9d00";
        document.getElementById("head_nav_index_a").style.color="#FFFFFF";
    </script>

</body>
</html>
