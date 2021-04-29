<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/27 21:43
  Description: 用户发表游记页面
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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
            //判断用户是否登录
            $.get("/user/findOne", {}, function (user) {
                if (user) {
                    //用户登录了
                    $("#login_out").remove();//移除未登录标签
                    var userHead = user.userHeadPicturePath;
                    var head = '<img class="user-head-pic" src="/FreegoImg/user/' + userHead + '">';
                    $("#user_head").html(head);
                } else {
                    location.href="http://localhost:8080/lww/login.jsp";
                }
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
        <div class="set-bg-toppiccnt">
            <img id="head_photo" alt="">
        </div>
        <%--头图和标题--%>
        <div class="set-page" id="btn_container">
            <a role="button" class="set-add uploaderattop uplod-topic" id="upload_topic"></a>
            <h2>设置游记头图</h2>
            <p>图片建议选择尺寸大于1680px的高清大图，如相机原图</p>
            <div class="clear"></div>
            <div class="add-photo" id="add_photo">
<%--                <input id="upload_head" class="upload-head" name="file" type="file" accept="image/jpeg,image/png,image/jpg" onchange="uploadHeadPhoto(this)">--%>
            </div>
        </div>
        <div class="set-title">
            <input type="text" id="travelNote_title" value placeholder="填写游记标题" maxlength="48">
            <div class="clear"></div>
        </div>
    </div>

    <div class="publish-main">
        <div class="publish-input">
            <%--工具栏--%>
            <div id="toolbar_container" class="toolbar"></div>
            <%--输入正文--%>
            <div id="textarea_container" class="text"></div>
        </div>

        <%--选择游记信息--%>
        <form class="layui-form layui-form-pane" lay-verify="required" lay-filter="get-info" action="">

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">出发时间</label>
                    <div class="layui-input-block">
                        <input type="text" name="date" lay-verify="required|StartDate" id="input_date" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline" style="float: right">
                    <label class="layui-form-label">人物</label>
                    <div class="layui-input-block">
                        <select name="people">
                            <option value="0">一个人</option>
                            <option value="1">情侣/夫妻</option>
                            <option value="2">带孩子</option>
                            <option value="3">家庭出游</option>
                            <option value="4">和朋友</option>
                            <option value="5">和同学</option>
                            <option value="6"selected="">其它</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">出行天数</label>
                    <div class="layui-input-block">
                        <input type="text" name="day" lay-verify="required|number" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline" style="float: right">
                    <label class="layui-form-label">人均花费/RMB</label>
                    <div class="layui-input-block">
                        <input type="text" name="cost" lay-verify="required|number" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item form-confirm">
                <button class="layui-btn" id="submit_btn" lay-submit="" lay-filter="add-info" style="visibility: hidden; height: 0px;"></button>
            </div>
        </form>

        <%--取消或发表--%>
        <div class="action-ft">
            <div class="action-btn">
                <a id="btn_cancel" class="btn-cancel" role="button">取消</a>
                <a id="btn_publish" class="btn-publish" role="button">发表游记</a>
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

<%--layui上传图片--%>
<script>
    window.onload=function(){
        layui.use('upload', function(){
            var upload = layui.upload;

            //执行实例
            var uploadInst = upload.render({
                elem: '#add_photo' //绑定元素
                ,url: '/uploadFile' //上传接口
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#head_photo').attr('src', result); //图片链接（base64）
                        $('#btn_container').css("color","#FFFFFF");
                    });
                }
                ,done: function(res){
                    if (res.code == 0) {
                        //上传成功
                        var imgPath = res.data.src;
                        var path = "/FreegoImg/li/travelnote/" +imgPath;
                        $('#head_photo').attr('src', path);                 //头图路径
                        $('#head_photo').attr('data-file', imgPath);         //头图文件名
                    }
                }
                ,error: function(){
                    //请求异常回调
                }
            });
        });
    }
</script>

<%--layui的From表单--%>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#input_date'
        });

        //自定义验证规则
        form.verify({
            StartDate: function (value) {
                if (value == "" || value == null || value == undefined){
                    layer.alert('请选择出发时间', {
                        offset:'300px',
                        title:'错误提示'
                    });
                }
            }
        });

        //监听提交
        form.on('submit(add-info)', function(data){
            //生成游记对象，发送到后台进行保存——————————————————————————————————————————————————————————————
            /*layer.alert(JSON.stringify(data.field), {
                offset:'300px',
                title: '最终的提交信息'
            });*/
            //表单取值
            var data = form.val('get-info');
            alert("表单取值: " + JSON.stringify(data));
            return false;
        });

    });
</script>

<%--WangEditor富文本编辑框--%>
<script type="text/javascript">
    const E = window.wangEditor
    const editor = new E('#toolbar_container', '#textarea_container') // 传入两个元素
    // 配置菜单栏，设置不需要的菜单
    editor.config.excludeMenus = ['fontName', 'italic', 'strikeThrough', 'indent', 'lineHeight', 'todo', 'justify', 'quote', 'video', 'code']
    editor.config.placeholder = '从这里开始游记正文...'
    editor.config.height = 600
    // editor.config.onchange = function (newHtml) { console.log('change 之后最新的 html', newHtml) }
    editor.config.uploadImgServer = 'http://localhost:8080/upload'          // 配置 server 接口地址
    editor.config.showLinkImg = false                                       //即可隐藏插入网络图片的功能
    editor.config.uploadImgAccept = ['jpg', 'jpeg', 'png']                  //限制图片类型
    editor.create();

    //校验头图
    function checkCover() {
        var imgSrc = $("#head_photo").attr("src");
        console.log("头图的路径: " + imgSrc);
        if (imgSrc == "" || imgSrc == null || imgSrc == undefined) {
            alert("未设置头图，请设置头图");
            return false;
        }
        return true;
    }
    //校验标题
    function checktitle() {
        var title = $("#travelNote_title").val();
        console.log("标题的内容: " + title);
        if (title.length == 0) {
            alert("请输入游记标题");
            return false;
        } else if (title.length > 50) {
            alert("游记标题字数超出50个字符，请重新编辑");
            return false;
        }
        return true;
    }
    //校验内容
    function checkText() {
        var noteText = editor.txt.html();
        console.log("游记的内容: " + noteText);
        if (noteText.length < 50) {
            alert("游记内容太短，请多写一些旅游体验。");
            return false;
        }
        alert("游记内容："+noteText);
        return true;
    }
    //取消按钮
    $("#btn_cancel").click(function () {
        var result = window.confirm("确定取消，系统可能不会保存您所做的更改。");
        if (result == true) {
            window.location.href="javascript:history.go(-1)";
        } else {
            return;
        }
    });
    //发表游记
    $("#btn_publish").click(function () {
        var flag = checkCover() && checktitle() && checkText();
        if (flag) {
            //校验通过，触发layui的From表单验证
            $('#submit_btn').trigger('click');
            return true;
        }
        alert("发布失败，请稍后重试");
        return false;
    });
    
</script>

</body>
</html>
