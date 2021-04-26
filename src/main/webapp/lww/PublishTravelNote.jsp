<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/26 14:29
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <title>发表游记</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/publish.css">
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

<div id="topic" class="pagelet-block">
    <div class="set-index" id="cover_box">
        <div class="set-bg-toppiccnt"></div>
        <%--头图和标题--%>
        <div class="set-page" id="pluplader_btn_container">
            <a role="button" class="set-add uploaderattop uplod-topic" id="upload_topic"></a>
            <h2>设置游记头图</h2>
            <p>图片建议选择尺寸大于1680px的高清大图，如相机原图</p>
            <div class="clear"></div>
            <div id="html5_1f46e0m311okqa1f9c3musvvf3_container" class="add-photo" style="position: absolute; top: 200px; left: 275px; width: 67px; height: 67px; overflow: hidden; z-index: -1;">
                <input id="html5_1f46e0m311okqa1f9c3musvvf3" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" accept="image/jpeg,image/png,image/jpg">
            </div>
        </div>
        <div class="set-title">
            <input type="text" id="title" value placeholder="填写游记标题" maxlength="48">
            <span>
                可输入<strong>48</strong>字
            </span>
            <div class="clear"></div>
        </div>
    </div>
    <%--发表游记主体--%>
    <div class="container clearfix">
        <%--正文--%>
        <div id="pagelet-block-4ad4826942bcca47594e5b38d0ca4b1e" class="content pagelet-block">
            <div class="content-box">
                <div class="textarea-placeholder">
                    <textarea cols="30" role="1" class="textarea-plc" tabindex="1" placeholder="从这里开始游记正文..."></textarea>
                </div>
            </div>
        </div>
        <%--发表游记侧边栏--%>
        <div id="sidebar" class="sidebar pagelet-block">
            <div class="sidebar-item">
                <a role="button" class="add-btn add-panel-photo">
                    <input id="html5_1f46f1gnprd81nl01o1s1cdu19dll" type="file" accept="image/jpeg,image/png,image/jpg">
                    <span>插入图片</span>
                </a>
            </div>

            <div class="sidebar-item">
                <a role="button" class="add-btn insert-choice">
                    插入段落标题
                </a>
                <div class="add-panel-title">
                    <div class="a-inpwarp">
                        <input class="paragraph-title" type="text" placeholder="请输入段落名称">
                        <span class="limit-tip">
                                可输入<em>20</em>字
                            </span>
                    </div>
                    <a class="a-btn submit-paragraph" role="button">确定</a>
                </div>
                <div class="add-panel-title">
                    <input id="html5_1f46f1gnprd81nl01o1s1cdu19d2l" type="file" accept="image/jpeg,image/png,image/jpg">
                    <span>插入图片</span>
                </div>
            </div>
            <div class="side-save" id="draft_save_block">
                <a class="btn-save" role="button">
                    <i></i>保存草稿
                </a>
            </div>
        </div>
        <%--取消或发表--%>
        <div class="action-ft">
            <div class="action-btn">
                <a class="btn-cancel" role="button">取消</a>
                <a class="btn-publish" role="button">发表游记</a>
            </div>
        </div>
        <script id="relate-mdd-pop-tmpl" type="text/x-jquery-tmpl">
            <a role="button" class="close-btn"><i></i></a>
            <div class="pl-body">
                <div class="pl-subtit">系统检测到你的游记中提及了以下目的地，请选择和你游记最有关联的目的地</div>
                <div class="pl-tags" style="overflow:auto">
                    {{each(i, mdd) mdd_tags}}
                        <a class="pl-tag" name="info_tag">${mdd}</a>
                    {{/each}}
                </div>
                <div class="pl-subtit">如果都不理想，那就为你的游记添加一个目的地吧</div>
                <div class="pl-add">
                    <div class="pl-search">
                        <div name="mdd-search-form">
                            <div class="pl-schbar">
                                <input autocomplete="off" class="search-input" type="text" name="q" placeholder="搜索目的地"><i></i>
                            </div>
                        </div>
                        <div class="pl-schlist hide">
                            <ul class="suggest-list">
                            </ul>
                        </div>
                    </div>
                    <div class="input_mddname_panel hide">
                        <a class="pl-tag cur input_mddname" role="button">aaa</a>
                    </div>
                </div>
                <div class="pl-action"><a class="btn-done">完成</a></div>
            </div>
        </script>
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
</script>

</body>
</html>
