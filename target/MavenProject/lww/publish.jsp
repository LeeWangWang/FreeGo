<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/27 21:43
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/package/dist/wangEditor.min.js"></script>

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

<div id="publish">

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

    <div id="toolbar_container" class="toolbar" style="border: 1px solid #ccc;"></div>
    <div id="textarea_container" class="text" style="border: 1px solid #ccc;min-height: 400px;"></div>

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

<%--引入 wangEditor.min.js --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/lww/package/dist/wangEditor.min.js"></script>
<script type="text/javascript">
    const E = window.wangEditor
    const editor = new E('#toolbar-container', '#text-container') // 传入两个元素
    // 配置菜单栏，设置不需要的菜单
    editor.config.excludeMenus = [
        'fontName',
        'italic',
        'strikeThrough',
        'indent',
        'lineHeight',
        'todo',
        'justify',
        'quote',
        'video',
        'code'
    ]
    editor.config.placeholder = '请输入游记内容'
    editor.config.onchange = function (newHtml) {
        console.log('change 之后最新的 html', newHtml)
    }
    editor.config.uploadImgServer = 'http://localhost:8080/upload'          // 配置 server 接口地址
    editor.config.showLinkImg = false                                       //即可隐藏插入网络图片的功能
    editor.config.uploadImgAccept = ['jpg', 'jpeg', 'png']                  //限制图片类型
    editor.create()
</script>

</body>
</html>
