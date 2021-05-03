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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bigautocomplete.css">
    <%--导入JavaScript--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bigautocomplete.js?v=2"></script>
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
                    <label style="width: 130px" class="layui-form-label">出发时间</label>
                    <div style="margin-left: 130px;" class="layui-input-block">
                        <input type="text" name="date" lay-verify="required|StartDate" id="input_date" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline" style="float: right">
                    <label style="width: 130px" class="layui-form-label">人物</label>
                    <div style="margin-left: 130px;" class="layui-input-block">
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
                    <label style="width: 130px" class="layui-form-label">出行天数</label>
                    <div style="margin-left: 130px;" class="layui-input-block">
                        <input type="text" name="day" lay-verify="required|number" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline" style="float: right">
                    <label style="width: 130px" class="layui-form-label">人均花费/RMB</label>
                    <div style="margin-left: 130px;" class="layui-input-block">
                        <input type="text" name="cost" lay-verify="required|number" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label style="width: 130px" class="layui-form-label">请输入目的地</label>
                    <div style="margin-left: 130px;" class="layui-input-block">
                        <input type="text" name="locate" lay-verify="required" id="input_location" placeholder="搜索目的地" autocomplete="off">
                    </div>
                </div>
                <div class="layui-inline" style="float: right">
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

<script>
    window.onload = function(){
        var tn_Title = null;
        var tn_Cover = null;
        var tn_Text = null;
        var tn_publishDate = null;
        var tn_travelTime = null;
        var tn_travelDays = 0;
        var tn_travelPerson = 0;
        var tn_travelPrice = 0;
        var tn_travelLocate = 0;
        var locateInfo = [{title:'北京市'},{title:'天津市'},{title:'石家庄市'},{title:'唐山市'},{title:'秦皇岛市'},{title:'邯郸市'},{title:'邢台市'},{title:'保定市'},{title:'张家口市'},{title:'承德市'},{title:'沧州市'},{title:'廊坊市'},{title:'衡水市'},{title:'太原市'},{title:'大同市'},{title:'阳泉市'},{title:'长治市'},{title:'晋城市'},{title:'朔州市'},{title:'晋中市'},{title:'运城市'},{title:'忻州市'},{title:'临汾市'},{title:'吕梁市'},{title:'呼和浩特市'},{title:'包头市'},{title:'乌海市'},{title:'赤峰市'},{title:'通辽市'},{title:'鄂尔多斯市'},{title:'呼伦贝尔市'},{title:'巴彦淖尔市'},{title:'兴安盟'},{title:'锡林郭勒盟'},{title:'阿拉善盟'},{title:'沈阳市'},{title:'大连市'},{title:'鞍山市'},{title:'抚顺市'},{title:'本溪市'},{title:'丹东市'},{title:'锦州市'},{title:'营口市'},{title:'阜新市'},{title:'辽阳市'},{title:'盘锦市'},{title:'铁岭市'},{title:'朝阳市'},{title:'葫芦岛市'},{title:'长春市'},{title:'吉林市'},{title:'四平市'},{title:'辽源市'},{title:'通化市'},{title:'白山市'},{title:'松原市'},{title:'白城市'},{title:'延边朝鲜族自治州'},{title:'哈尔滨市'},{title:'齐齐哈尔市'},{title:'鸡西市'},{title:'鹤岗市'},{title:'双鸭山市'},{title:'大庆市'},{title:'伊春市'},{title:'佳木斯市'},{title:'七台河市'},{title:'牡丹江市'},{title:'黑河市'},{title:'绥化市'},{title:'大兴安岭地区'},{title:'上海市'},{title:'南京市'},{title:'无锡市'},{title:'徐州市'},{title:'苏州市'},{title:'南通市'},{title:'连云港市'},{title:'淮安市'},{title:'盐城市'},{title:'扬州市'},{title:'镇江市'},{title:'泰州市'},{title:'宿迁市'},{title:'杭州市'},{title:'宁波市'},{title:'温州市'},{title:'嘉兴市'},{title:'湖州市'},{title:'绍兴市'},{title:'金华市'},{title:'衢州市'},{title:'舟山市'},{title:'台州市'},{title:'丽水市'},{title:'合肥市'},{title:'芜湖市'},{title:'蚌埠市'},{title:'淮南市'},{title:'马鞍山市'},{title:'淮北市'},{title:'铜陵市'},{title:'安庆市'},{title:'黄山市'},{title:'滁州市'},{title:'阜阳市'},{title:'宿州市'},{title:'六安市'},{title:'亳州市'},{title:'池州市'},{title:'宣城市'},{title:'福州市'},{title:'厦门市'},{title:'莆田市'},{title:'三明市'},{title:'泉州市'},{title:'漳州市'},{title:'南平市'},{title:'龙岩市'},{title:'宁德市'},{title:'南昌市'},{title:'景德镇市'},{title:'萍乡市'},{title:'九江市'},{title:'鹰潭市'},{title:'赣州市'},{title:'吉安市'},{title:'宜春市'},{title:'抚州市'},{title:'上饶市'},{title:'济南市'},{title:'青岛市'},{title:'淄博市'},{title:'枣庄市'},{title:'东营市'},{title:'烟台市'},{title:'潍坊市'},{title:'济宁市'},{title:'泰安市'},{title:'威海市'},{title:'日照市'},{title:'临沂市'},{title:'德州市'},{title:'聊城市'},{title:'滨州市'},{title:'菏泽市'},{title:'郑州市'},{title:'开封市'},{title:'洛阳市'},{title:'平顶山市'},{title:'安阳市'},{title:'鹤壁市'},{title:'新乡市'},{title:'焦作市'},{title:'濮阳市'},{title:'许昌市'},{title:'漯河市'},{title:'三门峡市'},{title:'南阳市'},{title:'商丘市'},{title:'信阳市'},{title:'周口市'},{title:'驻马店市'},{title:'省直辖县级行政区划'},{title:'武汉市'},{title:'黄石市'},{title:'十堰市'},{title:'宜昌市'},{title:'襄阳市'},{title:'鄂州市'},{title:'荆门市'},{title:'孝感市'},{title:'荆州市'},{title:'黄冈市'},{title:'咸宁市'},{title:'随州市'},{title:'恩施土家族苗族自治州'},{title:'省直辖县级行政区划'},{title:'长沙市'},{title:'株洲市'},{title:'湘潭市'},{title:'衡阳市'},{title:'邵阳市'},{title:'岳阳市'},{title:'常德市'},{title:'张家界市'},{title:'益阳市'},{title:'郴州市'},{title:'永州市'},{title:'怀化市'},{title:'娄底市'},{title:'湘西土家族苗族自治州'},{title:'广州市'},{title:'韶关市'},{title:'深圳市'},{title:'珠海市'},{title:'汕头市'},{title:'佛山市'},{title:'江门市'},{title:'湛江市'},{title:'茂名市'},{title:'肇庆市'},{title:'惠州市'},{title:'梅州市'},{title:'汕尾市'},{title:'河源市'},{title:'阳江市'},{title:'清远市'},{title:'东莞市'},{title:'中山市'},{title:'潮州市'},{title:'云浮市'},{title:'南宁市'},{title:'柳州市'},{title:'桂林市'},{title:'梧州市'},{title:'北海市'},{title:'防城港市'},{title:'钦州市'},{title:'贵港市'},{title:'玉林市'},{title:'百色市'},{title:'贺州市'},{title:'河池市'},{title:'来宾市'},{title:'崇左市'},{title:'海口市'},{title:'三亚市'},{title:'三沙市'},{title:'儋州市'},{title:'海南省'},{title:'重庆市'},{title:'成都市'},{title:'自贡市'},{title:'攀枝花市'},{title:'泸州市'},{title:'德阳市'},{title:'广元市'},{title:'遂宁市'},{title:'内江市'},{title:'乐山市'},{title:'南充市'},{title:'眉山市'},{title:'宜宾市'},{title:'广安市'},{title:'达州市'},{title:'雅安市'},{title:'巴中市'},{title:'资阳市'},{title:'阿坝藏族羌族自治州'},{title:'甘孜藏族自治州'},{title:'凉山彝族自治州'},{title:'贵阳市'},{title:'六盘水市'},{title:'遵义市'},{title:'安顺市'},{title:'毕节市'},{title:'铜仁市'},{title:'黔西南布依族苗族自治州'},{title:'黔东南苗族侗族自治州'},{title:'黔南布依族苗族自治州'},{title:'昆明市'},{title:'曲靖市'},{title:'玉溪市'},{title:'保山市'},{title:'昭通市'},{title:'丽江市'},{title:'普洱市'},{title:'临沧市'},{title:'楚雄彝族自治州'},{title:'红河哈尼族彝族自治州'},{title:'文山壮族苗族自治州'},{title:'西双版纳傣族自治州'},{title:'大理白族自治州'},{title:'德宏傣族景颇族自治州'},{title:'迪庆藏族自治州'},{title:'拉萨市'},{title:'日喀则市'},{title:'昌都市'},{title:'林芝市'},{title:'山南市'},{title:'那曲市'},{title:'阿里地区'},{title:'西安市'},{title:'铜川市'},{title:'宝鸡市'},{title:'咸阳市'},{title:'渭南市'},{title:'延安市'},{title:'汉中市'},{title:'榆林市'},{title:'安康市'},{title:'商洛市'},{title:'兰州市'},{title:'嘉峪关市'},{title:'金昌市'},{title:'白银市'},{title:'天水市'},{title:'武威市'},{title:'张掖市'},{title:'平凉市'},{title:'酒泉市'},{title:'庆阳市'},{title:'定西市'},{title:'陇南市'},{title:'临夏回族自治州'},{title:'甘南藏族自治州'},{title:'西宁市'},{title:'海东市'},{title:'海北藏族自治州'},{title:'黄南藏族自治州'},{title:'海南藏族自治州'},{title:'果洛藏族自治州'},{title:'玉树藏族自治州'},{title:'海西蒙古族藏族自治州'},{title:'银川市'},{title:'石嘴山市'},{title:'吴忠市'},{title:'固原市'},{title:'中卫市'},{title:'乌鲁木齐市'},{title:'克拉玛依市'},{title:'吐鲁番市'},{title:'哈密市'},{title:'昌吉回族自治州'},{title:'博尔塔拉蒙古自治州'},{title:'巴音郭楞蒙古自治州'},{title:'阿克苏地区'},{title:'克孜勒苏柯尔克孜自治州'},{title:'喀什地区'},{title:'和田地区'},{title:'伊犁哈萨克自治州'},{title:'塔城地区'},{title:'阿勒泰地区'},{title:'自治区直辖县级行政区划'},{title:'石河子市'},{title:'阿拉尔市'},{title:'图木舒克市'},{title:'五家渠市'},{title:'铁门关市'},{title:'西藏自治区'},{title:'河北省'},{title:'山西省'},{title:'内蒙古自治区'},{title:'辽宁省'},{title:'黑龙江省'},{title:'江苏省'},{title:'浙江省'},{title:'安徽省'},{title:'福建省'},{title:'江西省'},{title:'山东省'},{title:'河南省'},{title:'湖北省'},{title:'湖南省'},{title:'广东省'},{title:'广西壮族自治区'},{title:'四川省'},{title:'贵州省'},{title:'云南省'},{title:'陕西省'},{title:'甘肃省'},{title:'青海省'},{title:'宁夏回族自治区'},{title:'新疆维吾尔自治区'},{title:'捷克'},{title:'西双版纳'}];

        <%--自动搜索功能--%>
        $.post("/travelnote/getLocate", function (data) {
            console.log("前台获取地址信息: "); console.log(eval(data));
        } );

        $("#input_location").bigAutocomplete({
            width:543,
            data:locateInfo
        });

        <%--layui上传图片--%>
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
                        $('#head_photo').attr('src', path);                  //头图路径
                        $('#head_photo').attr('data-file', imgPath);         //头图文件名
                    }
                }
                ,error: function(){
                    //请求异常回调
                }
            });
        });

        <%--WangEditor富文本编辑框--%>
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
            console.log("头图的路径: "); console.log(imgSrc);
            if (imgSrc == "" || imgSrc == null || imgSrc == undefined) {
                alert("未设置头图，请设置头图");
                return false;
            }
            return true;
        }
        //校验标题
        function checktitle() {
            var title = $("#travelNote_title").val();
            console.log("标题的内容: "); console.log(title);
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
            console.log("游记的内容: ");console.log(noteText);
            if (noteText.length < 50) {
                alert("游记内容太短，请多写一些旅游体验。");
                return false;
            }
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
                //校验通过，给全局变量赋值，触发layui的From表单验证

                //获取当前日期
                var myDate = new Date();
                var nowMonth = myDate.getMonth() + 1;
                var nowDate = myDate.getDate();
                var seperator = "-";
                if (nowMonth >= 1 && nowMonth <= 9) {
                    nowMonth = "0" + nowMonth;
                }
                if (nowDate >= 1 && nowDate <= 9) {
                    nowDate = "0" + nowDate;
                }
                var today = myDate.getFullYear() + seperator + nowMonth + seperator + nowDate;

                myDate.toLocaleDateString();
                tn_publishDate = myDate;
                tn_Title = $("#travelNote_title").val();
                tn_Cover = $("#head_photo").attr("src");
                tn_Text = editor.txt.html();
                tn_publishDate = today;

                $('#submit_btn').trigger('click');
                return true;
            }
            alert("发布失败，请稍后重试");
            return false;
        });

        <%--layui的From表单--%>
        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form
                ,layer = layui.layer
                ,laydate = layui.laydate;
            //日期
            laydate.render({
                elem: '#input_date'
            });

            //监听提交
            form.on('submit(add-info)', function(){

                //表单取值
                var data = form.val('get-info');
                console.log("游记信息"); console.log(data);

                //处理人物下拉列表信息
                var people_select;
                switch (parseInt(data.people)) {
                    case 0 : people_select = 23; break;     //一个人
                    case 1 : people_select = 19; break;     //情侣/夫妻
                    case 2 : people_select = 24; break;     //带孩子
                    case 3 : people_select = 18; break;     //家庭出游
                    case 4 : people_select = 26; break;     //和朋友
                    case 5 : people_select = 21; break;     //和同学
                    default :  people_select = 25;          //其他
                }

                //给参数赋值
                tn_travelTime = data.date;                      //出行日期
                tn_travelDays = parseInt(data.day);             //出行天数
                tn_travelPerson = people_select;                //人物
                tn_travelPrice = parseInt(data.cost);           //人均花费
                //处理目的地信息
                var position = data.locate;
                $.post("/travelnote/checkLocate",{name : position}, function (data) {
                    tn_travelLocate = data;                     //目的地

                    //生成游记对象，发送到后台进行保存
                    var travelNote = {
                        travelNoteTitle : tn_Title,
                        travelNoteCover : tn_Cover,
                        travelNoteText : tn_Text,
                        publishDate : tn_publishDate,
                        travelTime : tn_travelTime,
                        travelDays : tn_travelDays,
                        travelPerson : tn_travelPerson,
                        travelPrice : tn_travelPrice,
                        travelLocate : tn_travelLocate,
                    };
                    console.log("生成的游记实例信息"); console.log(travelNote);
                    $.post("/travelnote/addTravelNote",{travelnote : JSON.stringify(travelNote)}, function (data) {
                        console.log("保存游记信息后返回值: "); console.log(data);
                        if (data != null) {
                            location.href = "http://localhost:8080/lww/travelnote.jsp?noteid=" + data.travelNoteId;
                        } else {
                            alert("游记信息发表失败,请稍后重试");
                        }
                    });
                });
                return false;
            });

        });

    }
</script>

</body>
</html>
