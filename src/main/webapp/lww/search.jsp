<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/22 16:38
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
    <link rel="stylesheet" type="text/css" href="css/search.css">
    <%--导入jQuery--%>
    <script src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <%--导入布局js，共享header和footer--%>
    <script type="text/javascript" src="js/include.js"></script>
</head>
<body>
    <%--导入头部--%>
    <div id="header"></div>

    <%--搜索框--%>
    <div class="search-head">
        <div class="wid clearfix">
            <div class="search-head-logo">
                <a href=""></a>
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
            <div class="flt1 search-list" id="search_result_left">
                <div class="search-section">
                    <div class="att-list">
                        <ul>
                            <li>
                                <div class="clearfix">
                                    <div class="flt1">
                                        <a href="" target="_blank" class="search-link">
                                            <img src="">
                                        </a>
                                    </div>
                                    <div class="ct-text">
                                        <h3>
                                            <a href="">史上最全面最详细上海迪士尼攻略（演出、合影、住宿、. . . </a>
                                        </h3>
                                        <p class="seg-desc">在这种环境下拍的照片全糊了完全不能看，所以从网上搜的1些图片给大家参考~ 就是乘坐上图这样的小...【推荐指数：未体验不打分】 【身高要求：不...</p>
                                        <ul class="seg-info-list clearfix">
                                            <li>179381浏览</li>
                                        </ul>
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
    <div id="footer"></div>
</body>
</html>
