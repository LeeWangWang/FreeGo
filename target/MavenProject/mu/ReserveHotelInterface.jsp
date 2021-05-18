<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/5/5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <title>订酒店</title>
    <style type="text/css">
        .mod-title {
            margin-bottom: 0px;
        }
        .hotel-panel .extra,
        .room-item .sub {
            cursor: context-menu;
        }
        .room-item .sub {
            position: relative;
            z-index: 1;
            padding-top: 10px;
            font-size: 13px;
            display: inline-block;
        }
        .extra-tips {
            position: fixed;
            top: 0;
            left: 0;
            width: 150px;
            padding: 20px;
            color: #fff;
            background-color: rgba(0, 0, 0, 0.8);
            opacity: 0;
            text-align: left;
            -webkit-transition: opacity ease-in .3s;
            -moz-transition: opacity ease-in .3s;
            transition: opacity ease-in .3s;
            webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }
        .extra-tips.show {
            opacity: 1;
            z-index: 31;
        }
        .ui-input input,
        .special-panel textarea {
            box-sizing: content-box;
        }
        .room-item .ui-input {
            width: 167px;
        }
        .room-item .ui-input input{
            padding-right: 25px;
        }
        .ui-input.ui-input-long {
            width: 343px;
        }
        .ui-input.ui-input-long input {
            width: 326px;
        }
        .ui-hide{
            display: none!important;
        }
        .sub .text {
            padding-left: 10px;
        }
        .tips-question {
            vertical-align: 2px;
        }
        .special-panel .ui-input {
            width: 390px;
            height: auto;
        }
        .special-panel textarea {
            resize: none;
        }
        .ui-input.ui-input-error textarea {
            border-color: #ff584b;
        }
        .ui-input.ui-input-focus textarea {
            border-color: #ff9d00;
        }
        .ui-input.ui-input-success textarea {
            border-color: #666;
        }
        .line {
            margin: 10px 0;
        }
        .f-row {
            margin: 0;
        }
        .ui-select {
            width: 343px;
            margin-top: 10px;
        }
        .ui-select .trigger {
            padding: 0 10px;
        }
        .ui-select em.name {
            font-size: 12px;
            letter-spacing: 1px;
            font-style: normal;
            color: #999;
        }
        .ui-select .sel-bd {
            display: block;
            opacity: 0;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            -webket-transform: translateY(15px);
            -moz-transform: translateY(15px);
            transform: translateY(15px);
            -webket-transition: all .3s ease-in-out 0s;
            -moz-transition: all .3s ease-in-out 0s;
            transition: all .3s ease-in-out 0s;
        }
        .ui-select.ui-select-long{
            width: 390px;
            margin-top: 0px;
            border-color: #666;
        }
        .name-list-container .f-row {
            padding-bottom: 10px;
        }
        .name-list-container,
        .room-item .tips {
            position: relative;
            z-index: 1;
        }
        .room-item .tips {
            margin: 0;
            padding-top: 5px;
        }

        .coupon-container,
        .insure-container,
        .honey-container {
            display: none;
        }
        .coupon-num,
        .insure-num,
        .honey-num,
        .total-rate {
            font-style: normal;
        }
        .ui-plain {
            padding-right: 10px;
        }
        .ui-plain em {
            font-size: 13px;
            font-style: normal;
            color: #333;
        }
        /* .order-side, */
        .plain-container,
        .select-container {
            opacity: 0;
            -webkit-transition: opacity ease-in .5s;
            -moz-transition: opacity ease-in .5s;
            transition: opacity ease-in .5s;
        }
        /* .order-side.show, */
        .plain-container.show,
        .select-container.show {
            opacity: 1;
        }
        .select-container {
            margin: 0;
        }
        .order-side .state {
            padding: 10px;
        }

        .coupon-panel li {
            height: 80px;
        }
        .coupon-panel .value {
            height: 81px;
            background-position: 0 -180px;
        }

        .hotel-panel .subtitle {
            margin-bottom: 10px;
        }
        .hotel-panel .rate {
            vertical-align: -2px;
        }

        /* 取消险相关 */
        .price_pp {
            font-style: normal;
        }
        .cancel-panel .icon-checkbox {
            border:  1px solid #ff4638;
        }
        .cancel-panel .icon-checkbox.checked:after {
            border-bottom: 2px solid #ff4638;
            border-left: 2px solid #ff4638;
        }
        ._j_cancel-price {
            color: #ff4638;
        }
        ._j_cancel-price .k-spinner,
        .price .k-spinner,
        ._j_honey-num .k-spinner {
            left: 0;
            width: 10px;
            height: 10px;
        }
        ._j_cancel-price .k-bubble-1,
        ._j_cancel-price .k-bubble-2,
        .price .k-bubble-1,
        .price .k-bubble-2,
        ._j_honey-num .k-bubble-1,
        ._j_honey-num .k-bubble-2 {
            width: 5px;
            height: 5px;
            background-color: #f95555;
        }
        .honey-panel,
        .limit-panel {
            margin-bottom: 20px;
            border: 1px solid #d9d9d9;
            padding: 15px 25px;
            background-color: #fefdfd;
            border-radius: 4px;
            color: #333;
            line-height: 24px;
        }
        .honey-panel::after,
        .limit-panel::after {
            content: '';
            display: table;
            clear: both;
            height: 0;
            overflow: hidden;
        }
        .limit-panel {
            display: none;
        }
        .invoice-panel .icon-checkbox,
        .honey-panel .icon-checkbox {
            display: inline-block;
            float: left;
            margin-top: 3px;
            margin-right: 8px;
            width: 15px;
            height: 15px;
            border: 1px solid #333;
            border-radius: 3px;
            position: relative;
        }
        .invoice-panel .icon-checkbox.checked::after,
        .honey-panel .icon-checkbox.checked::after {
            content: '';
            position: absolute;
            width: 8px;
            height: 5px;
            border-bottom: 2px solid #333;
            border-left: 2px solid #333;
            transform: rotate(-45deg);
            left: 3px;
            top: 2px;
        }

        .invoice-panel {
            position: relative;
        }
        .invoice-switch-btn-container {
            position: absolute;
            top: 18px;
            right: 25px;
        }
        .invoice-switch-btn {
            display: none;
        }
        .invoice-switch-btn-label {
            display: inline-block;
            overflow: hidden;
            position: relative;
            width: 40px;
            height: 20px;
            border-radius: 20px;
            box-shadow: #d7d7d7 0px 0px 0px 1px;
            background-color: #d7d7d7;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
            -ms-transition: all 0.5s;
            transition: all 0.5s;
        }
        .invoice-switch-btn-label::before {
            content: '';
            position: absolute;
            left: 0;
            width: 20px;
            height: 20px;
            display: inline-block;
            border-radius: 20px;
            background-color: #fff;
            z-index: 1;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
            -ms-transition: all 0.5s;
            transition: all 0.5s;
        }
        label.invoice-switch-btn-label.invoice-switch-btn-label-checked::before {
            left: 20px;
        }
        label.invoice-switch-btn-label.invoice-switch-btn-label-checked {
            background-color: #ff9d00;
        }
        .invoice-panel .f-row {
            margin-top: 15px;
            margin-bottom: 5px;
        }
        .invoice-panel .frequent {
            margin-top: -10px;
            margin-bottom: 20px;
        }
        .invoice-panel .radio {
            padding: 0 25px;
        }

        .inactive-coupon {
            position: relative;
            margin: 5px;
            font-size: 14px;
            color: #333;
            line-height: 24px;
        }
        .coupon-inactive-list li{
            float: none;
            display: block;
            border: none;
            width: auto;
            height: 110px;
        }
        .coupon-inactive-list li:hover{
            border-color: #d9d9d9;
        }
        .coupon-inactive-list .coupon-desc {
            float: left;
            font-size: 12px;
            margin-top: 5px;
        }
        .coupon-inactive-card {
            float: left;
            display: inline;
            margin: 0 348px 0 0;
            height: 80px;
            width: 250px;
            border: 1px solid #d9d9d9;
            border-radius: 2px;
            position: relative;
            cursor: pointer;
        }
        .coupon-inactive-card .value {
            background-color: #d9d9d9;
        }
        .coupon-panel em{
            font-style: normal;
        }


        .phone-ex-container {
            float: left;
            display: inline-block;
            margin-right: 5px;
            border: 1px solid #666;
            width: 50px;
            height: 31px;
            line-height: 31px;
            text-align: center;
            font-size: 12px;
            color: #333;
            border-radius: 2px;
            cursor: pointer;
        }
        .popup-container .pop-bd.pop-bank .bank-box {
            margin-left: 0;
        }
        .popup-container .pop-bd.pop-bank .bank-nav,
        .popup-container .pop-bd.pop-bank .bank-box {
            height: 300px;
        }

        /* 有房保障 */
        .expense-detail .bd li.hotel-insure-tit-wrap {
            line-height: 18px;
            border-bottom: none;
        }
        .expense-detail .bd li.hotel-insure-tit-wrap .hotel-insure-tit {
            position: relative;
            width:259px;
            height:21px;
            line-height: 22px;
            padding-left: 12px;
            color:#333333;
        }
        .expense-detail .bd li.hotel-insure-tit-wrap .hotel-insure-tit:after {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translate(0,-50%);
            width: 6px;
            height: 6px;
            border-radius: 3px;
            background: #FF8A00;
        }
        .expense-detail .bd li.hotel-insure-tit-wrap .hotel-insure-desc {
            color: #999999;
        }
        .hotel-insure-explain {
            padding: 0 15px;
            margin: 15px 0;
            color: #FF8A00;
            cursor: pointer;
        }

        .order-side-wrap {
            float: right;
            opacity: 0;
            -webkit-transition: opacity ease-in .5s;
            -moz-transition: opacity ease-in .5s;
            transition: opacity ease-in .5s;
        }
        .order-side-wrap.show {
            opacity: 1;
        }
        .order-side-wrap.fixed {
            position: fixed;
            left: 50%;
            top: 0;
            z-index: 30;
            margin-left: 170px;
        }
    </style>
    <link href="${pageContext.request.contextPath}/mu/css/reserveHotelCss/reserveHotelCssOne.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/mu/css/reserveHotelCss/reserveHotelCssTwo.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/mu/js/reserveHotelJs/reserveHotelJsOne.js" type="text/javascript" crossorigin="anonymous"></script>

    <script type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/mu/css/recommendCss/recommendOne.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/mu/css/recommendCss/recommendTwo.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/mu/js/recommendJs/tuijianOne.js" type="text/javascript" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/mu/js/recommendJs/tuijianTwo.js" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/mu/js/recommendJs/tuijianThree.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mu/layui/css/layui.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/mu/layui/layui.js"></script>
</head>
<body>
<%
    System.out.println("daole");
    int hotelId = (int)session.getAttribute("hotelId");
    String hotelName = (String) session.getAttribute("hotelName");
    int userId = (int) session.getAttribute("userId");
    int roomId = (int)session.getAttribute("roomId");
    float roomPrice = (float)session.getAttribute("roomPrice");
    String ruzhu = (String)session.getAttribute("ruzhu");
    String likai = (String) session.getAttribute("likai");
    String roomName = (String)session.getAttribute("roomName");
    int peopleNum = (int)session.getAttribute("peopleNum");
    String address = (String)session.getAttribute("address");
    int tian = (int)session.getAttribute("tian");
    String hotelPicture = (String) session.getAttribute("hotelPicture");

    List<String> cunName = new ArrayList<String>();
    Boolean fapiaoFlag = false;
    Boolean isNotTime = false;
%>
<div class="container">
    <div class="wrapper" id="_j_wrapper">
        <div class="process">
            <ul class="clearfix">
                <li class="visited"><i></i>1. 选择房间 </li>
                <li class="on"><i></i>2. 填写入住详情</li>
                <li><i></i>3. 确认支付信息</li>
                <li><i></i>4. 预订完成</li>
            </ul>
        </div>
        <form action="${pageContext.request.contextPath}/HotelServlet?methods=ReserveHotel&isNotTime=<%=isNotTime%>&userId=<%=userId%>&hotelId=<%=hotelId%>&moveIntoTime=<%=ruzhu%>&departureTime=<%=likai%>&people=<%=peopleNum%>&roomId=<%=roomId%>" method="post">
            <div class="order-main">
            <!-- 酒店信息 S -->
            <div class="hotel-panel">
                <div class="img">
                    <img src="${pageContext.request.contextPath}/FreegoImg/mu/hotelPicture/overPicture/<%=hotelPicture%>"></div>
                <div class="info">
                    <a>
                        <h2><%=hotelName%></h2>
                    </a>
                    <p class="address"><%=address%></p>
                </div>
                <div class="extra">
                    <div class="item" name="date-check-in" data-val="2021-06-13">
                        <div class="t"><%=ruzhu.substring(0,4)%>年<%=ruzhu.substring(5,7)%>月</div>
                        <div class="m"><%=ruzhu.substring(8,10)%></div>
                        <div class="b">入住</div>
                    </div>
                    <div class="item" name="date-check-out" data-val="2021-06-14">
                        <div class="t"><%=likai.substring(0,4)%>年<%=likai.substring(5,7)%>月</div>
                        <div class="m"><%=likai.substring(8,10)%></div>
                        <div class="b">离开</div>
                    </div>
                    <div class="item">
                        <div class="t">客房数</div>
                        <div class="m">1</div>
                        <div class="b">间</div>
                    </div>
                    <div class="extra-tips" style="top: 388px; left: 806px;">如需要更改日期或房间数，请在房型选择页修改。</div>
                </div>
            </div>
            <!-- 酒店信息 E -->
            <!-- 预订限制 S -->
            <div class="limit-panel mod-wrap" id="_j_limit_container" name="limit">
                <div class="mod-title">订前阅读<i class="i-arrow"></i></div>
                <div class="mod-bd"></div>
            </div>
            <!-- 预订限制 E -->

            <!-- 填写表单 S -->
            <div class="form-panel">
                <!-- 房间信息 S -->
                <div class="form-block form-room" id="_j_form_room_container"><div class="room-item"><div class="mod-title">房间<em class="room-index">1</em> - <em class="room-name"><%=roomName%></em> (必填)</div><p class="sub">入住信息：<span class="text"><%=peopleNum%>成人</span><span class="text plain-container _j_plain_select_container show"><span class="ui-plain"><em>床1.2米宽</em><input type="hidden" name="select" data-id="66502"></span></span></p><div class="extra-tips">此入住人数为查询价格时设置的人数,如变更请在前一页日期旁修改并重新查询价格</div>
                    <div class="f-row select-container _j_select_container"></div>
                    <div class="line"></div>
                    <div class="name-list-container _j_name_list_container">
                        <%for(int i = 0;i < peopleNum;i++){%>
                        <div class="f-row">
                            <div class="ui-input">
                                <input placeholder="姓" type="text" id="xing<%=i%>" name="xing<%=i%>" class="last-name input-name">
                                <i class="icon-success"></i>
                            </div>
                            <div class="ui-input">
                            <input placeholder="名" type="text" id="ming<%=i%>" name="ming<%=i%>" class="first-name input-name">
                            <i class="icon-success"></i>
                            </div>
                            <span class="tips-err" style="display: none;">
                            <i></i>
                            <em class="tips-err-text"></em>
                        </span>
                                <i class="i-add"></i>第<%=i+1%>位入住人
                        </div>
                        <%}%>
                        <div class="tips" style="padding-top: 0; padding-bottom: 10px;">*请按相应证件准确填写入住人信息，订单提交后将无法变更或收费变更。</div>
                    </div>
                    <div class="tips">*<span class="tips-language">与证件姓名一致</span>，填写1人与2人都可。
                        <div class="tips-question"><i></i>
                            <div class="tips-cont">第二位住客姓名仅用于办理签证等手续，办理入住时，请出示第一位住客的护照。预订多间客房时，每间第一位住客请务必填写不同的入住人。<br>*若购买酒店取消险，请填写全部入住人。</div></div></div></div></div>
                <!-- 房间信息 E -->

                <div class="form-block form-contact" id="_j_contact_information_container">
                    <div class="mod-title">联系人信息 (必填)</div>
                    <div class="f-row">
                        <div class="ui-input ui-input-long">
                            <input placeholder="姓名" type="text" class="name input-name" input-name="name" name="xingming" id="xingming">
                            <i class="icon-success"></i>
                        </div>
                        <span class="tips-err" style="display: none;"><i></i><em class="tips-err-text"></em></span>
                    </div>
                    <div class="f-row">
                        <div class="phone-ex-container" id="_j_phone-ex-container">+<span class="phone-ex">86</span></div>
                        <div class="ui-input ui-input-long" style="width: 286px;">
                            <input type="text" placeholder="手机" class="phone input-name" input-name="phone" id="shouji" style="width: 269px;" name="shouji">
                            <i class="icon-success"></i>
                        </div>
                        <span class="tips-err" style="display: none;"><i></i><em class="tips-err-text"></em></span>
                    </div>
                    <div class="f-row">
                        <div class="ui-input ui-input-long">
                            <input type="text" placeholder="电子邮箱" class="email input-name" id="youxiang" input-name="email" name="youxiang">
                            <i class="icon-success"></i>
                        </div>
                        <span class="tips-err" style="display: none;"><i></i><em class="tips-err-text"></em></span>
                    </div>
                </div>

            </div>
            <!-- 填写表单 E -->
            <!-- 特殊要求 S -->
            <div class="form-panel" name="special" style="height: 240px;">
                <div class="mod-title special" style="margin-left: 10px;">特殊要求<i class="i-arrow"></i></div>
                <div class="mod-bd" style="margin-left: 10px;">
                    <div class="f-row" id="_j_special_panel_list">
<%--                        <span class="radio" data-value="quiet_room">安静的房间</span><span class="radio" data-value="higher_floor">高楼层</span><span class="radio" data-value="connected_room">相邻的房间</span>--%>
                    </div>
                <select name="daodianshijian" id="daodianshijian" lay-verify="" style="height: 33px;width: 310px;">
                    <option value="">预计到店时间</option>
                    <option value="00:00~01:00">00:00~01:00</option>
                    <option value="01:00~02:00">01:00~02:00</option>
                    <option value="02:00~03:00">02:00~03:00</option>
                    <option value="03:00~04:00">03:00~04:00</option>
                    <option value="04:00~05:00">04:00~05:00</option>
                    <option value="05:00~06:00">05:00~06:00</option>
                    <option value="06:00~07:00">06:00~07:00</option>
                    <option value="07:00~08:00">07:00~08:00</option>
                    <option value="08:00~09:00">08:00~09:00</option>
                    <option value="09:00~10:00">09:00~10:00</option>
                    <option value="11:00~12:00">11:00~12:00</option>
                    <option value="12:00~13:00">12:00~13:00</option>
                    <option value="13:00~14:00">13:00~14:00</option>
                    <option value="15:00~16:00">15:00~16:00</option>
                    <option value="16:00~17:00">16:00~17:00</option>
                    <option value="17:00~18:00">17:00~18:00</option>
                    <option value="18:00~19:00">18:00~19:00</option>
                    <option value="19:00~20:00">19:00~20:00</option>
                    <option value="20:00~21:00">20:00~21:00</option>
                    <option value="21:00~22:00">21:00~22:00</option>
                    <option value="22:00~23:00">22:00~23:00</option>
                    <option value="23:00~24:00">23:00~24:00</option>
                </select>
                <div class="f-row" id="_j_special_input_notice">
                    <div class="ui-input">
                        <textarea class="input-name" id="teshuyaoqiu" style="width: 310px;"placeholder="请填写特殊要求" name="teshuyaoqiu"></textarea>
                    </div>
                    <span class="tips-err" style="display: none;"><i></i><em class="tips-err-text"></em></span>
                </div>
                <div class="tips" id="_j_arrive_time">*酒店办理入住时间为14:00-12:00，请您做好出行安排。</div>
                <div class="tips" id="_j_special_tips">*酒店无法保证满足您的特殊要求，但会尽力安排</div>
            </div>
            </div>
            <!-- 特殊要求 E -->
            <!-- 报销凭证 S -->
            <div class="invoice-panel mod-wrap" id="_j_invoice_panel_container" name="invoice">
                <div class="mod-title">需要发票</div>
                <div class="invoice-switch-btn-container _j_invoice_switch_btn_container">
                    <input type="checkbox" id="fapiaoUse" name="fapiaoUse" id="fapiaoUse" value="false" lay-skin="switch" lay-text="开启|关闭" onclick="change_div()">
                </div>
                <script type="text/javascript">
                    function change_div(){
                        //alert("???")
                        //alert(obj.checked)

                        if (document.getElementById("fapiaoUse").checked == true)
                        {
                            //alert("选定了")
                            document.getElementById("fapiaoUse").value = "true";
                            document.getElementById("displayDiv").style.display = 'block';
                            //alert(document.getElementById("fapiaoUse").value);
                        }
                        else
                        {
                            //document.getElementById("distination").value = "false";
                            document.getElementById("fapiaoTime").value == "false";
                            document.getElementById("displayDiv").style.display = 'none' ;
                        }
                    }
                </script>
                <div id="displayDiv" style="display: none;margin-top: 20px;">
                    <div class="f-row frequent">
                        <select id="leixing" name="leixing" lay-verify="" style="height: 33px;width: 310px;">
                            <option value="">选择发票类型</option>
                            <option value="公司">公司</option>
                            <option value="个人">个人</option>
                            <option value="政府机关行政单位">政府机关行政单位</option>
                        </select>
                    </div>
                    <div class="f-row">
                        <div class="ui-input ui-input-long">
                            <input type="text" id="taitou" name="taitou" placeholder="抬头" class="input-name invoice-title">
                            <i class="icon-success"></i>
                        </div>
                        <span class="tips-err" style="display: none;"><i></i><em class="tips-err-text">请填写发票抬头</em></span>
                    </div>
                    <div class="f-row">
                        <div class="ui-input ui-input-long">
                            <input type="text" id="nasuirenshibiehao" class="input-name invoice-itin" name="nasuirenshibiehao" placeholder="纳税人识别号">
                            <i class="icon-success"></i>
                        </div>
                        <span class="tips-err" style="display: none;"><i></i><em class="tips-err-text">请填写纳税人识别号</em></span>
                    </div>
                    <div class="f-row">
                        <input id="fapiaoTime" type="checkbox" name="fapiaoTime" onclick="change_isNotTime()" lay-skin="switch" lay-text="开启|关闭" value="false">发票注明入住离店时间
                        <script type="text/javascript">
                            function change_isNotTime(){
                                var fapiaoTime = document.getElementById("fapiaoTime");
                                if (obj.checked == true)
                                {
                                    fapiaoTime.value = true;
                                }
                                else
                                {
                                    fapiaoTime.value = false;
                                }
                            }
                        </script>
                    </div>
                </div>

                <div class="tips">此订单由供应商开具增值税普通发票。电子发票将在入住完成后1周内发送至联系人的邮箱。成功入住后6个月内仍可以申请补开发票。</div>
            </div>
            <!-- 报销凭证 E -->
            <!-- 取消险 S -->
            <!-- 取消险 E -->
            <!-- 优惠券 S -->
            <div class="coupon-panel mod-wrap" id="_j_coupon_container" name="coupon" style="display: none;">
                <div class="mod-title coupon">使用优惠券<span class="thin">(<em></em>张可用，共<em></em>张)</span><i class="i-arrow"></i></div>
                <div class="mod-bd">
                    <ul class="clearfix" id="_j_coupon_list_wrap"></ul>
                </div>
                <div class="inactive-coupon">不可用优惠券<span class="thin">（共<em></em>张）</span></div>
                <div class="mod-bd">
                    <ul class="clearfix coupon-inactive-list" id="_j_coupon_inactive_list_wrap">
                    </ul>
                </div>
            </div>
            <!-- 蜂蜜抵现 E -->
            <!-- 信用卡类型 S -->
            <div class="crediCard-panel" id="_j_crediCard_container" style="display: none;">
                <em style="font-style: normal">现在仅需担保 到酒店前台付款即可</em>
            </div>
            <!-- 信用卡类型 E -->
            <input class="btn-action" type="submit" onclick="return CheckReserve()" style="width: 650px;">提交订单（¥<%=roomPrice*((float)tian)%>）</input>
        </div>
        </form>
        <script>
            function CheckReserve()
            {
                var i = 0;
                for(;i < <%=peopleNum%>;i++) {
                    var xing = document.getElementById("xing"+i+"");
                    var ming = document.getElementById("ming"+i+"");
                    if(xing.value.length == 0 || ming.value.length == 0){
                        alert("请把入住人姓名输入完全")
                        return false;
                    }
                }
                //alert("进来2")
                var xingming = document.getElementById("xingming");
                var shouji = document.getElementById("shouji");
                var youxiang = document.getElementById("youxiang");
                if(xingming.value.length == 0){
                    alert("请输入联系人信息中的姓名")
                    return false;
                }
                if(shouji.value.length == 0){
                    alert("请输入联系人信息中的手机号")
                    return false;
                }
                if(youxiang.value.length == 0){
                    alert("请输入联系人信息中的电子邮箱")
                    return false;
                }
                var fapiaoUse = document.getElementById("fapiaoUse");
                if(fapiaoUse.value.length == 4){
                    //alert("发票使用了")
                    var leixing = document.getElementById("leixing");
                    var taitou = document.getElementById("taitou");
                    var nasuirenshibiehao = document.getElementById("nasuirenshibiehao");
                    if(leixing.value.length == 6){
                        alert("请选择发票类型")
                        return false;
                    }else{
                        if(taitou.value.length == 0){
                            alert("请输入抬头")
                            return false;
                        }
                    }
                }else{
                    //alert(fapiaoUse.value)
                    return true;
                }
                return true;
            }
        </script>
        <div class="order-side-wrap show" id="_j_order_side">
            <!-- 全部费用明细 S -->
            <div class="order-side" id="_j_expense_container"><div class="expense-detail">
                <div class="hd">预订费用明细</div>
                <ul class="bd"><li>1间客房 x <%=tian%>晚<em style="font-style: normal; padding-left: 10px;">不含早餐</em><span class="price">￥<%=roomPrice*((float)tian)%></span></li><li class="insure-container">酒店取消险<span class="price"></span></li><li class="honey-container">蜂蜜抵现<span class="price price-minus"></span></li><li class="coupon-container">优惠券<span class="price price-minus">-￥<em class="coupon-num"></em></span></li><li class="total">总价 (含税)<span class="price price-minus">￥<%=roomPrice*tian%></span></li></ul>
            </div><div class="state ">入住前24小时 该订单可免费取消</div><div class="tips">执行方: Freego</div></div>
            <!-- 全部费用明细 E -->
            <!-- 有房保障 S -->
            <div class="order-side" id="_j_hotel_insure_container">
                <div class="expense-detail">
                    <div class="hd">有房保障</div>
                    <ul class="bd">
                        <li class="hotel-insure-tit-wrap">
                            <p class="hotel-insure-tit">有房保障 订单无忧</p>
                            <span class="hotel-insure-desc">为您的订单负责，确认订单后发生无房，Freego，仍无法安排原订单入住，最高承担原订单首晚房费。</span>
                        </li>
                        <li class="hotel-insure-tit-wrap">
                            <p class="hotel-insure-tit">专业服务 安心出行</p>
                            <span class="hotel-insure-desc">为您的出行负责，7 x 24小时海内外服务热线。</span>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- 有房保障弹窗 -->
<div class="popup-layer hide-popup" id="_j_hotel_insure_popup">
    <div class="popup-container">
        <div class="pop-hd insuer-pop-hd">Freego有房保障</div>
        <div class="pop-desc-wrap">
            <dl class="pop-desc">
                <dt>入住日期前被告知无房</dt>
                <dd>如您的已确认订单在入住日期前，酒店无法为您安排入住：</dd>
                <dd>1. Freego会第一时间通知您，与酒店协调争取为您安排原标准或以上级别的房间入住，承担由此产生的差价，差价金额上限为Freego原订单首晚的30% 房费。</dd>
                <dd>2. 若无法安排您入住原酒店任何房型，我们会建议您预订附近酒店，并承担由此产生的差价，差价金额上限为Freego原订单首晚的30% 房费。</dd>
                <dd>3. 经核查情况属实后，Freego会联系您履行保障承诺，请您保留好入住发票及水单。</dd>
            </dl>
            <dl class="pop-desc">
                <dt>入住当天被告知无房</dt>
                <dd>若订单已得到酒店方确认，您在约定时间到店发现无房：</dd>
                <dd>1. 请立即拨打24小时服务热线通知Freego。</dd>
                <dd>2. Freego会第一时间与酒店协调争取为您安排原标准或以上级别的房间入住，并承担由此产生的差价，差价金额上限为Freego原订单的首晚房费。</dd>
                <dd>3. 若无法安排您入住原酒店任何房型，我们会建议您预订附近酒店，并承担由此产生的差价，差价金额上限为Freego原订单的首晚房费。</dd>
                <dd>4. 经核查情况属实后，Freego会联系您履行保障承诺，请您保留好入住发票及=水单。</dd>
            </dl>
            <dl class="pop-desc">
                <dt>注意事项</dt>
                <dd>1. 请您注意，以下情况不包含在“有房保障”范畴：</dd>
                <dd>a. 当您的订单未被确认，酒店告知无房时，订单被取消的；</dd>
                <dd>b. 未实际入住或者您未能提供真实有效入住凭证(发票+水单)，或您的入住凭证中入住人、城市、日期与原订单不符的；</dd>
                <dd>c. 非Freego、酒店（代理商）原因造成的无法入住，包括由于您自身原因导致，或不可抗力等；</dd>
                <dd>d. 订单存在安全交易风险行为的，包括但不限于恶意购买行为的订单，以Freego核实结果为准；</dd>
                <dd>e. 在您预定入住其它酒店前，请务必与Freego联系确认，否则将被视为自动放弃了“有房保障”赔付的权利。</dd>
                <dd>2. 保障只针对实际经济损失，且保障金额不超过“有房保障”的相关标准；</dd>
                <dd>3. 为保障您的利益，对于已核实确认的保障申请，款项将汇款至原支付银行卡或入住人的银行卡，因此无法汇款至其它账户。</dd>
                <dd>4. 发生纠纷后，当您已取得保障金或已与供应商协商解决，如再向Freego及供应商以同一事由主张其他赔偿的，将不再予以受理。</dd>
            </dl>
        </div>
        <div class="pop-ft no-border">
            <a class="close" id="_j_close_hotel_insure_popup" href="javascript:void(0);">关闭</a>
        </div>
    </div>
</div>

</body>
</html>
