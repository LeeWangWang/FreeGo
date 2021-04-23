<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/20 15:38
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FreeGo</title>
    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <%--导入jQuery--%>
    <script src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <%--导入布局js--%>
    <script src="js/getParameter.js"></script>
    <script></script>

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
                    <a href="" class="show-title">
                        <div class="travelnote-date">2021.4.19</div>
                        <div class="travelnote-title">【自驾甘孜】仓央嘉措，无尽雪山和风</div>
                    </a>
                    <a href="" class="show-pic">
                        <img src="/FreegoImg/li/travelnote/1.jpeg" alt="" class="banner-picture">
                    </a>
                </div>

                <div id="banner_2" class="item">
                    <a href="" class="show-title">
                        <div class="show-date">2021.4.19</div>
                        <div class="travelnote-title">常州金坛亲子游｜撷一肩春色，跟着小念一起花样春游吧</div>
                    </a>
                    <a href="" class="show-pic">
                        <img src="/FreegoImg/li/travelnote/2.jpeg" alt="" class="banner-picture">
                    </a>
                </div>

                <div id="banner_3" class="item">
                    <a href="" class="show-title">
                        <div class="show-date">2021.4.19</div>
                        <div class="travelnote-title">别样东莞｜广东第四城的美食和古迹</div>
                    </a>
                    <a href="" class="show-pic">
                        <img src="/FreegoImg/li/travelnote/3.jpeg" alt="" class="banner-picture">
                    </a>
                </div>

                <div id="banner_4" class="item">
                    <a href="" class="show-title">
                        <div class="show-date">2021.4.19</div>
                        <div class="travelnote-title">走吧、让我们一路川西吧！</div>
                    </a>
                    <a href="" class="show-pic">
                        <img src="/FreegoImg/li/travelnote/4.jpeg" alt="" class="banner-picture">
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
        <div class="index-search-container" id="index_search">
            <div class="index-search-group">
                <div class="index-search-tab" id="index_search_tab">
                    <%--单选框--%>
                    <ul class="clearfix">
                        <li class="tab-select">
                            <div class="tab-check" id="tab_all"></div>
                            <div class="tab-text">全部</div>
                        </li>
                        <li class="tab-select">
                            <div class="tab-check" id="tab_travelnote"></div>
                            <div class="tab-text">游记</div>
                        </li>
                        <li class="tab-select">
                            <div class="tab-check" id="tab_scenic"></div>
                            <div class="tab-text">景点</div>
                        </li>
                        <li class="tab-select">
                            <div class="tab-check" id="tab_hotel"></div>
                            <div class="tab-text">酒店</div>
                        </li>
                    </ul>
                </div>
                <div class="index-search-bar" id="index_search_bar">
                    <div class="index-search-wrapper">
                        <div class="index-search-input">
                            <input name="q" type="text" placeholder="搜游记/景点/酒店" id="index_search_input_all" autocomplete="off">
                        </div>
                    </div>
                    <div class="index-search-button" id="index_search_btn_all">
                        <a role="button" href="javascript;"></a>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <%--游记部分--%>
    <div class="freego-travelnote">

        <div class="index-travelnote">

            <%--游记tab--%>
            <div class="travelnote-tab">
                <div class="travelnote-hot" id="travelnoe_hot">
                    <a href="javascript:void(0);" rel="nofollow">热门游记</a>
                </div>
                <div class="travelnote-new" id="travelnoe_new">
                    <a href="javascript:void(0);" rel="nofollow">最新发表</a>
                </div>
                <div class="travelnote-publish" id="travelnoe_publish">
                    <img class="travelnote-publish-img" src="../images/li/travelnote/write.jpeg">
                    <div class="travelnote-publish-text">写游记</div>
                </div>
            </div>

            <%--游记列表--%>
            <div class="page-block-travelnote" id="pgae_block_travelnote">
                <div class="travelnote-list">

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/11.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">清明青岛，有点德味儿</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">写在前面 考虑到孕妇的行动不便，为期三天的清明假期我们选择了离北京
                                        不远的青岛作为2021年出行的第一站，也是最后一站。整体来讲， 青岛 虽与九年前的样子差别不大，
                                        能留下深刻印象的景点也不多，却是一个可以短暂放空，享受海鲜饕餮盛宴的清净之地。在清朝末年被
                                        德国人与日本人轮番殖民占领的青岛，通过一系列外资的引入与最新城市规划理念的实践，逐渐登上历史
                                        的舞台，成为当代中国北方最重要的沿海城市之一。如今的青岛继续发扬历史遗留下来的经济文化优. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">青岛</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head1.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">DiDi_酱</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">1207/</div>
                                    <div class="travlenote-collection">6</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">34</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/12.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">【彩虹帮】东欧自驾之黑山漫游，想念亚得里亚海的艳阳</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">黑山旅行预告片如果说我们在巴尔干半岛二十天的自驾旅行，就像是收获
                                        了一捧五彩缤纷的 东欧 宝石，那么 黑山 ，一定是其中最闪烁耀眼的那一颗。布德 瓦碧蓝的 地中海
                                        海滩， 科托尔 古城的红色屋顶，亚得里亚海初夏的烈日艳阳，音乐节热烈躁动的音浪，一切的景致都
                                        比想象中来得更加迷人。无敌美景的民宿带来家一般的温暖，让旅行的时光变得温情自然了许多，也让
                                        属于 黑山 的每一个日子，都闪闪地发着光亮。有遭遇过不快，也遇见了暖心。美好沉甸甸的，. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">大柴旦</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head4.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">彩虹帮的二当家</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">7.1w/</div>
                                    <div class="travlenote-collection">729</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">2066</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/13.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">【西行日记｜十月浪漫】之三：走过青海——走过翡翠. . .</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">特以此篇纪念我52岁的生日 在我若干次的自驾旅途中，行程往往都是不按
                                        计划走的，它只受心的支配。此次西部之行同样如此。按计划，10月30日，我们早已经在家中。但是，
                                        实际上，这一天我们却仍旧行驶在315国道上。这是旅行带来的意外，旅行又怎会给人带来一个个出奇
                                        不意的幸福和历久弥新的回忆呢？10月30日，我正好52岁。拜苍天所赐，在我喜欢的315国道上，特意
                                        为我准备了一块刻有“1030”字样的路碑。这是我此生过的最特别、最有意义的生日，不仅有天空、大地
                                        的豪迈，还有“在路上”的那份仪式感。为此，特在开篇写下这些话，以见证并纪念我52岁的生日。. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">青海</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head6.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">大浪汪洋</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">2.2w/</div>
                                    <div class="travlenote-collection">288</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">5034</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/14.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">俄罗斯的十八天之圣彼得堡（一）~圣伊萨克大教堂、. . .</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">【出行时间：2019年9月2~3日】

                                        上海 鲁迅公园内专门有个旅游角，每周的星期六上午是喜欢旅游人士的“大聚会”，参加这类聚合的大多
                                        数是年长的老人，一般性“野路子”的旅行社也会来“混迹于中”，我就是在这个旅游角上认识了年近80的
                                        、又是坐在残疾车上的老顾，攀谈之余，聊起了 俄罗斯 旅游的事，想不到他把我登记在案；临出发前，
                                        他们为我们每一位游客买了一份保险，52元人民币，保单赔偿额是最低的，只有25万人民币，然而恰恰
                                        在我的名字上多了一个单人旁，尽管音是相同的，但字不同万一发生了什么事保险公司是不赔. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">圣彼得堡</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head3.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">好望角</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">1207/</div>
                                    <div class="travlenote-collection">6</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">34</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/13.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">【西行日记｜十月浪漫】之三：走过青海——走过翡翠. . .</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">特以此篇纪念我52岁的生日 在我若干次的自驾旅途中，行程往往都是不按
                                        计划走的，它只受心的支配。此次西部之行同样如此。按计划，10月30日，我们早已经在家中。但是，
                                        实际上，这一天我们却仍旧行驶在315国道上。这是旅行带来的意外，旅行又怎会给人带来一个个出奇
                                        不意的幸福和历久弥新的回忆呢？10月30日，我正好52岁。拜苍天所赐，在我喜欢的315国道上，特意
                                        为我准备了一块刻有“1030”字样的路碑。这是我此生过的最特别、最有意义的生日，不仅有天空、大地
                                        的豪迈，还有“在路上”的那份仪式感。为此，特在开篇写下这些话，以见证并纪念我52岁的生日。. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">青海</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head6.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">大浪汪洋</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">2.2w/</div>
                                    <div class="travlenote-collection">288</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">5034</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/14.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">俄罗斯的十八天之圣彼得堡（一）~圣伊萨克大教堂、. . .</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">【出行时间：2019年9月2~3日】

                                        上海 鲁迅公园内专门有个旅游角，每周的星期六上午是喜欢旅游人士的“大聚会”，参加这类聚合的大多
                                        数是年长的老人，一般性“野路子”的旅行社也会来“混迹于中”，我就是在这个旅游角上认识了年近80的
                                        、又是坐在残疾车上的老顾，攀谈之余，聊起了 俄罗斯 旅游的事，想不到他把我登记在案；临出发前，
                                        他们为我们每一位游客买了一份保险，52元人民币，保单赔偿额是最低的，只有25万人民币，然而恰恰
                                        在我的名字上多了一个单人旁，尽管音是相同的，但字不同万一发生了什么事保险公司是不赔. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">圣彼得堡</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head3.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">好望角</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">1207/</div>
                                    <div class="travlenote-collection">6</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">34</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/11.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">清明青岛，有点德味儿</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">写在前面 考虑到孕妇的行动不便，为期三天的清明假期我们选择了离北京
                                        不远的青岛作为2021年出行的第一站，也是最后一站。整体来讲， 青岛 虽与九年前的样子差别不大，
                                        能留下深刻印象的景点也不多，却是一个可以短暂放空，享受海鲜饕餮盛宴的清净之地。在清朝末年被
                                        德国人与日本人轮番殖民占领的青岛，通过一系列外资的引入与最新城市规划理念的实践，逐渐登上历史
                                        的舞台，成为当代中国北方最重要的沿海城市之一。如今的青岛继续发扬历史遗留下来的经济文化优. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">青岛</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head1.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">DiDi_酱</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">1207/</div>
                                    <div class="travlenote-collection">6</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">34</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/12.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">【彩虹帮】东欧自驾之黑山漫游，想念亚得里亚海的艳阳</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">黑山旅行预告片如果说我们在巴尔干半岛二十天的自驾旅行，就像是收获
                                        了一捧五彩缤纷的 东欧 宝石，那么 黑山 ，一定是其中最闪烁耀眼的那一颗。布德 瓦碧蓝的 地中海
                                        海滩， 科托尔 古城的红色屋顶，亚得里亚海初夏的烈日艳阳，音乐节热烈躁动的音浪，一切的景致都
                                        比想象中来得更加迷人。无敌美景的民宿带来家一般的温暖，让旅行的时光变得温情自然了许多，也让
                                        属于 黑山 的每一个日子，都闪闪地发着光亮。有遭遇过不快，也遇见了暖心。美好沉甸甸的，. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">大柴旦</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head4.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">彩虹帮的二当家</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">7.1w/</div>
                                    <div class="travlenote-collection">729</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">2066</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/13.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">【西行日记｜十月浪漫】之三：走过青海——走过翡翠. . .</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">特以此篇纪念我52岁的生日 在我若干次的自驾旅途中，行程往往都是不按
                                        计划走的，它只受心的支配。此次西部之行同样如此。按计划，10月30日，我们早已经在家中。但是，
                                        实际上，这一天我们却仍旧行驶在315国道上。这是旅行带来的意外，旅行又怎会给人带来一个个出奇
                                        不意的幸福和历久弥新的回忆呢？10月30日，我正好52岁。拜苍天所赐，在我喜欢的315国道上，特意
                                        为我准备了一块刻有“1030”字样的路碑。这是我此生过的最特别、最有意义的生日，不仅有天空、大地
                                        的豪迈，还有“在路上”的那份仪式感。为此，特在开篇写下这些话，以见证并纪念我52岁的生日。. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">青海</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head6.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">大浪汪洋</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">2.2w/</div>
                                    <div class="travlenote-collection">288</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">5034</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="travelnote-item clearfix">
                        <div class="travelnote-left">
                            <a href="" target="_blank">
                                <img src="/FreegoImg/li/travelnote/14.jpeg" alt="" class="travelnote-picture">
                            </a>
                        </div>
                        <div class="travelnote-right">

                            <dl>
                                <dt>
                                    <a href="" target="_blank">俄罗斯的十八天之圣彼得堡（一）~圣伊萨克大教堂、. . .</a>
                                </dt>
                                <dd>
                                    <a href="" target="_blank">【出行时间：2019年9月2~3日】

                                        上海 鲁迅公园内专门有个旅游角，每周的星期六上午是喜欢旅游人士的“大聚会”，参加这类聚合的大多
                                        数是年长的老人，一般性“野路子”的旅行社也会来“混迹于中”，我就是在这个旅游角上认识了年近80的
                                        、又是坐在残疾车上的老顾，攀谈之余，聊起了 俄罗斯 旅游的事，想不到他把我登记在案；临出发前，
                                        他们为我们每一位游客买了一份保险，52元人民币，保单赔偿额是最低的，只有25万人民币，然而恰恰
                                        在我的名字上多了一个单人旁，尽管音是相同的，但字不同万一发生了什么事保险公司是不赔. . .</a>
                                </dd>
                            </dl>

                            <div class="travelnote-extra">
                                <%--定位--%>
                                <div class="travelnote-location">
                                    <img class="travelnote-location-pic" src="../images/li/travelnote/location.jpeg">
                                    <div class="travelnote-location-text">圣彼得堡</div>
                                </div>
                                <%--用户--%>
                                <div class="travelnote-user">
                                    <div class="travelnote-user-head">
                                        <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head3.jpeg">
                                    </div>
                                    <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">好望角</a>
                                </div>
                                <%--浏览量/收藏量--%>
                                <div class="travelnote-view-collection">
                                    <img src="../images/li/travelnote/eye.jpeg">
                                    <div class="travelnote-view">1207/</div>
                                    <div class="travlenote-collection">6</div>
                                </div>
                                <%--点赞量--%>
                                <div class="travelnote-like">
                                    <div class="travelnote-user-likes">34</div>
                                    <img class="travelnote-user-likes-pic" src="../images/li/travelnote/like.jpeg">
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
                    <li class="first-page"><a href="">首页</a></li>
                    <li class="threeword"><a href="#">上一页</a></li>
                    <li class="curPage"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">9</a></li>
                    <li><a href="#">10</a></li>
                    <li class="threeword"><a href="javascript:;">下一页</a></li>
                    <li class="last-page"><a href="javascript:;">末页</a></li>
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
        /*轮播图-搜索栏*/
        document.getElementById("tab_all").style.background="url(../images/li/index/check_box_check.jpeg)";
        /*头部*/
        document.getElementById("head_nav_index_li").style.background="#ff9d00";
        document.getElementById("head_nav_index_a").style.color="#FFFFFF";
    </script>

</body>
</html>
