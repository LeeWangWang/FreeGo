<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
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

    <style type="text/css">
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        .demo{width:720px;margin:30px auto;}
        .demo h2{font-size:16px;color:#3366cc;height:30px;}
        .demo li{float:left;}
        .text{width:529px;height:22px;padding:4px 7px;padding:6px 7px 2px\9;font:16px arial;border:1px solid #cdcdcd;border-color:#9a9a9a #cdcdcd #cdcdcd #9a9a9a;vertical-align:top;outline:none;margin:0 5px 0 0;}
        .button{width:95px;height:32px;padding:0;padding-top:2px\9;border:0;background-position:0 -35px;background-color:#ddd;cursor:pointer}
    </style>

</head>
<body>

<div class="demo">
    <h2>bigautocomplete联想输入测试</h2>
    <form action="" method="post" name="searchform" id="searchform" class="searchinfo">
        <ul style="margin-bottom: 40px; float: left">
            <li><input type="text" id="location1" value="" class="text" /></li>
            <li><input type="submit" value="搜索1" class="button" /></li>
        </ul>
        <ul style="margin-bottom: 40px; float: left ">
            <li><input type="text" id="location2" value="" class="text" /></li>
            <li><input type="submit" value="搜索2" class="button" /></li>
        </ul>
    </form>
</div>

<script>

    window.onload = function() {
        var locate1 = new Array();
        var locate2 = new Array();
        var locate3;
        var locate4;
        var result = [{title:'北京市'},{title:'天津市'},{title:'石家庄市'},{title:'唐山市'},{title:'秦皇岛市'},{title:'邯郸市'},{title:'邢台市'},{title:'保定市'},{title:'张家口市'},{title:'承德市'},{title:'沧州市'},{title:'廊坊市'},{title:'衡水市'},{title:'太原市'},{title:'大同市'},{title:'阳泉市'},{title:'长治市'},{title:'晋城市'},{title:'朔州市'},{title:'晋中市'},{title:'运城市'},{title:'忻州市'},{title:'临汾市'},{title:'吕梁市'},{title:'呼和浩特市'},{title:'包头市'},{title:'乌海市'},{title:'赤峰市'},{title:'通辽市'},{title:'鄂尔多斯市'},{title:'呼伦贝尔市'},{title:'巴彦淖尔市'},{title:'兴安盟'},{title:'锡林郭勒盟'},{title:'阿拉善盟'},{title:'沈阳市'},{title:'大连市'},{title:'鞍山市'},{title:'抚顺市'},{title:'本溪市'},{title:'丹东市'},{title:'锦州市'},{title:'营口市'},{title:'阜新市'},{title:'辽阳市'},{title:'盘锦市'},{title:'铁岭市'},{title:'朝阳市'},{title:'葫芦岛市'},{title:'长春市'},{title:'吉林市'},{title:'四平市'},{title:'辽源市'},{title:'通化市'},{title:'白山市'},{title:'松原市'},{title:'白城市'},{title:'延边朝鲜族自治州'},{title:'哈尔滨市'},{title:'齐齐哈尔市'},{title:'鸡西市'},{title:'鹤岗市'},{title:'双鸭山市'},{title:'大庆市'},{title:'伊春市'},{title:'佳木斯市'},{title:'七台河市'},{title:'牡丹江市'},{title:'黑河市'},{title:'绥化市'},{title:'大兴安岭地区'},{title:'上海市'},{title:'南京市'},{title:'无锡市'},{title:'徐州市'},{title:'苏州市'},{title:'南通市'},{title:'连云港市'},{title:'淮安市'},{title:'盐城市'},{title:'扬州市'},{title:'镇江市'},{title:'泰州市'},{title:'宿迁市'},{title:'杭州市'},{title:'宁波市'},{title:'温州市'},{title:'嘉兴市'},{title:'湖州市'},{title:'绍兴市'},{title:'金华市'},{title:'衢州市'},{title:'舟山市'},{title:'台州市'},{title:'丽水市'},{title:'合肥市'},{title:'芜湖市'},{title:'蚌埠市'},{title:'淮南市'},{title:'马鞍山市'},{title:'淮北市'},{title:'铜陵市'},{title:'安庆市'},{title:'黄山市'},{title:'滁州市'},{title:'阜阳市'},{title:'宿州市'},{title:'六安市'},{title:'亳州市'},{title:'池州市'},{title:'宣城市'},{title:'福州市'},{title:'厦门市'},{title:'莆田市'},{title:'三明市'},{title:'泉州市'},{title:'漳州市'},{title:'南平市'},{title:'龙岩市'},{title:'宁德市'},{title:'南昌市'},{title:'景德镇市'},{title:'萍乡市'},{title:'九江市'},{title:'鹰潭市'},{title:'赣州市'},{title:'吉安市'},{title:'宜春市'},{title:'抚州市'},{title:'上饶市'},{title:'济南市'},{title:'青岛市'},{title:'淄博市'},{title:'枣庄市'},{title:'东营市'},{title:'烟台市'},{title:'潍坊市'},{title:'济宁市'},{title:'泰安市'},{title:'威海市'},{title:'日照市'},{title:'临沂市'},{title:'德州市'},{title:'聊城市'},{title:'滨州市'},{title:'菏泽市'},{title:'郑州市'},{title:'开封市'},{title:'洛阳市'},{title:'平顶山市'},{title:'安阳市'},{title:'鹤壁市'},{title:'新乡市'},{title:'焦作市'},{title:'濮阳市'},{title:'许昌市'},{title:'漯河市'},{title:'三门峡市'},{title:'南阳市'},{title:'商丘市'},{title:'信阳市'},{title:'周口市'},{title:'驻马店市'},{title:'省直辖县级行政区划'},{title:'武汉市'},{title:'黄石市'},{title:'十堰市'},{title:'宜昌市'},{title:'襄阳市'},{title:'鄂州市'},{title:'荆门市'},{title:'孝感市'},{title:'荆州市'},{title:'黄冈市'},{title:'咸宁市'},{title:'随州市'},{title:'恩施土家族苗族自治州'},{title:'省直辖县级行政区划'},{title:'长沙市'},{title:'株洲市'},{title:'湘潭市'},{title:'衡阳市'},{title:'邵阳市'},{title:'岳阳市'},{title:'常德市'},{title:'张家界市'},{title:'益阳市'},{title:'郴州市'},{title:'永州市'},{title:'怀化市'},{title:'娄底市'},{title:'湘西土家族苗族自治州'},{title:'广州市'},{title:'韶关市'},{title:'深圳市'},{title:'珠海市'},{title:'汕头市'},{title:'佛山市'},{title:'江门市'},{title:'湛江市'},{title:'茂名市'},{title:'肇庆市'},{title:'惠州市'},{title:'梅州市'},{title:'汕尾市'},{title:'河源市'},{title:'阳江市'},{title:'清远市'},{title:'东莞市'},{title:'中山市'},{title:'潮州市'},{title:'云浮市'},{title:'南宁市'},{title:'柳州市'},{title:'桂林市'},{title:'梧州市'},{title:'北海市'},{title:'防城港市'},{title:'钦州市'},{title:'贵港市'},{title:'玉林市'},{title:'百色市'},{title:'贺州市'},{title:'河池市'},{title:'来宾市'},{title:'崇左市'},{title:'海口市'},{title:'三亚市'},{title:'三沙市'},{title:'儋州市'},{title:'海南省'},{title:'重庆市'},{title:'成都市'},{title:'自贡市'},{title:'攀枝花市'},{title:'泸州市'},{title:'德阳市'},{title:'广元市'},{title:'遂宁市'},{title:'内江市'},{title:'乐山市'},{title:'南充市'},{title:'眉山市'},{title:'宜宾市'},{title:'广安市'},{title:'达州市'},{title:'雅安市'},{title:'巴中市'},{title:'资阳市'},{title:'阿坝藏族羌族自治州'},{title:'甘孜藏族自治州'},{title:'凉山彝族自治州'},{title:'贵阳市'},{title:'六盘水市'},{title:'遵义市'},{title:'安顺市'},{title:'毕节市'},{title:'铜仁市'},{title:'黔西南布依族苗族自治州'},{title:'黔东南苗族侗族自治州'},{title:'黔南布依族苗族自治州'},{title:'昆明市'},{title:'曲靖市'},{title:'玉溪市'},{title:'保山市'},{title:'昭通市'},{title:'丽江市'},{title:'普洱市'},{title:'临沧市'},{title:'楚雄彝族自治州'},{title:'红河哈尼族彝族自治州'},{title:'文山壮族苗族自治州'},{title:'西双版纳傣族自治州'},{title:'大理白族自治州'},{title:'德宏傣族景颇族自治州'},{title:'迪庆藏族自治州'},{title:'拉萨市'},{title:'日喀则市'},{title:'昌都市'},{title:'林芝市'},{title:'山南市'},{title:'那曲市'},{title:'阿里地区'},{title:'西安市'},{title:'铜川市'},{title:'宝鸡市'},{title:'咸阳市'},{title:'渭南市'},{title:'延安市'},{title:'汉中市'},{title:'榆林市'},{title:'安康市'},{title:'商洛市'},{title:'兰州市'},{title:'嘉峪关市'},{title:'金昌市'},{title:'白银市'},{title:'天水市'},{title:'武威市'},{title:'张掖市'},{title:'平凉市'},{title:'酒泉市'},{title:'庆阳市'},{title:'定西市'},{title:'陇南市'},{title:'临夏回族自治州'},{title:'甘南藏族自治州'},{title:'西宁市'},{title:'海东市'},{title:'海北藏族自治州'},{title:'黄南藏族自治州'},{title:'海南藏族自治州'},{title:'果洛藏族自治州'},{title:'玉树藏族自治州'},{title:'海西蒙古族藏族自治州'},{title:'银川市'},{title:'石嘴山市'},{title:'吴忠市'},{title:'固原市'},{title:'中卫市'},{title:'乌鲁木齐市'},{title:'克拉玛依市'},{title:'吐鲁番市'},{title:'哈密市'},{title:'昌吉回族自治州'},{title:'博尔塔拉蒙古自治州'},{title:'巴音郭楞蒙古自治州'},{title:'阿克苏地区'},{title:'克孜勒苏柯尔克孜自治州'},{title:'喀什地区'},{title:'和田地区'},{title:'伊犁哈萨克自治州'},{title:'塔城地区'},{title:'阿勒泰地区'},{title:'自治区直辖县级行政区划'},{title:'石河子市'},{title:'阿拉尔市'},{title:'图木舒克市'},{title:'五家渠市'},{title:'铁门关市'},{title:'西藏自治区'},{title:'河北省'},{title:'山西省'},{title:'内蒙古自治区'},{title:'辽宁省'},{title:'黑龙江省'},{title:'江苏省'},{title:'浙江省'},{title:'安徽省'},{title:'福建省'},{title:'江西省'},{title:'山东省'},{title:'河南省'},{title:'湖北省'},{title:'湖南省'},{title:'广东省'},{title:'广西壮族自治区'},{title:'四川省'},{title:'贵州省'},{title:'云南省'},{title:'陕西省'},{title:'甘肃省'},{title:'青海省'},{title:'宁夏回族自治区'},{title:'新疆维吾尔自治区'},{title:'捷克'},{title:'西双版纳'}];
        $.post("/travelnote/getLocate", function (data) {

            locate2 = eval(data);
            locate3 = JSON.stringify(data);// 转成JSON格式
            locate4 = $.parseJSON(locate3);// 转成JSON对象
            // console.log(eval(data));
            // console.log(eval(JSON.stringify(data)));
            if ($.isArray(locate2)) {
                console.log("2.前台获取地址信息: ");
                console.log(locate2);
            }
            if ($.isArray(locate3)) {
                console.log("3.前台获取地址信息: ");
                console.log(locate3);
            }
            if ($.isArray(locate4)) {
                console.log("4.前台获取地址信息: ");
                console.log(locate4);
            }
            if ($.isArray(result)) {
                console.log("5.前台获取地址信息: ");
                console.log(result);
            }
        });
        $("#location1").bigAutocomplete({
            width:543,
            data:locate2
        });
        $("#location2").bigAutocomplete({
            width:543,
            data: result
        });
    }
</script>

</body>
</html>
