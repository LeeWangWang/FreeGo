<%@ page import="domain.HotelInfo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/29
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/mu/css/viewHotelCss.css"></script>
    <link href="https://css.mafengwo.net/css/cv/css+base:css+jquery.suggest:css+plugins:css+plugins+jquery.jgrowl:css+other+popup:css+mfw-header.2015^YlVS^1578479974.css" rel="stylesheet" type="text/css">
    <link href="https://css.mafengwo.net/css/cv/css+hotel+detail:css+hotel+datepicker-range:css+hotel+number_guests_picker:css+hotel_pop:css+mdd+hotel_fav:css+mdd+map-mark.v2:css+jquery-ui-1.9.1.custom.min:css+hotel+sign+index^YlJb^1552035728.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        window.Env = {"poi_info":{"id":97816,"mddid":10198,"name":"\u6df1\u5733\u7687\u5eadV\u9152\u5e97 Wongtee V Hotel","zh_name":"\u6df1\u5733\u7687\u5eadV\u9152\u5e97","foreign_name":"Wongtee V Hotel","lat":22.53132,"lng":114.06396,"zoom":15,"num_comment":200,"num_inn_comment":null,"user_last_comment_id":0,"album_count":84,"has_ota":1,"price":931,"phone":"+86-755-88911111","url":""},"user_info":{"uid":37689243,"name":"\u4e09\u4e03","logo_w16":"https:\/\/n1-q.mafengwo.net\/s12\/M00\/35\/2C\/wKgED1uqImOAAxCCAAAeJTVWYJU680.png?imageMogr2%2Fthumbnail%2F%2132x32r%2Fgravity%2FCenter%2Fcrop%2F%2132x32%2Fquality%2F90"},"ota_conf":{"youyu":{"ota":"youyu","name":"\u6709\u9c7c\u8ba2\u623f","homepage":"http:\/\/www.youyudf.com","tel":"400 634 5678","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/youyu_w100h20_2x.png"},"youyu_pkg":{"ota":"youyu_pkg","name":"\u9a6c\u8702\u7a9d\u4f18\u9009","homepage":"http:\/\/www.mafengwo.cn\/hotel_zx\/order\/search.php","tel":"400 634 5678","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/newlogo\/mafengwo_2018@2x.png"},"youyu_booking":{"ota":"youyu_booking","name":"\u9a6c\u8702\u7a9d\u4f18\u9009","homepage":"http:\/\/www.mafengwo.cn\/hotel_zx\/order\/search.php","tel":"400 634 5678","slogan":"","is_show_logo":true,"img_w100h20":"http:\/\/images.mafengwo.net\/images\/hotel\/ota\/booking_w100h20_2x_2.png"},"mafengwo":{"ota":"mafengwo","name":"\u9a6c\u8702\u7a9d\u4f18\u9009","homepage":"","tel":"400 634 5678","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/newlogo\/mafengwo_2018@2x.png"},"hotelzd":{"ota":"hotelzd","name":"\u9a6c\u8702\u7a9d\u76f4\u8ba2","homepage":"http:\/\/www.mafengwo.cn\/hotel\/","tel":"400 634 5678","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/hotelzd_w100h20_2x_2.png"},"booking":{"ota":"booking","name":"Booking.com","homepage":"http:\/\/www.booking.com\/index.zh-cn.html?aid=391337","tel":"400 882 2810","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/booking_w100h20_2x_2.png"},"agoda":{"ota":"agoda","name":"agoda","homepage":"http:\/\/www.agoda.com\/zh-cn?cid=1610250","tel":"400 630 2838","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/agoda_w100h20_2x_2.png"},"ctrip":{"ota":"ctrip","name":"\u643a\u7a0b","homepage":"http:\/\/hotels.ctrip.com\/?sid=449929","tel":"10106666","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/ctrip_w100h20_2x_2.png"},"ppctrip":{"ota":"ctrip","name":"\u643a\u7a0b","homepage":"http:\/\/hotels.ctrip.com\/?sid=449929","tel":"10106666","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/ctrip_w100h20_2x_2.png"},"elong":{"ota":"elong","name":"\u827a\u9f99","homepage":"http:\/\/www.elong.com\/?banid=pcmafengwo&fparam=21","tel":"400 933 3333","slogan":"","is_show_logo":false,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/elong_w100h20_2x.png"},"airbnb":{"ota":"airbnb","name":"Airbnb","homepage":"","tel":"","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/airbnb_w100h20_2x_3.png"},"jtb":{"ota":"jtb","name":"JAPANICAN","homepage":"","tel":"","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/jtb_w100h20_2x.png"},"hotels":{"ota":"hotels","name":"Hotels.com","homepage":"","tel":"","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/hotels_w100h20_2x_2.png"},"zizaike":{"ota":"zizaike","name":"\u81ea\u5728\u5ba2","homepage":"","tel":"","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/zizaike_w100h20_2x.png"},"dujiake":{"ota":"dujiake","name":"\u5ea6\u5047\u5ba2","homepage":"","tel":"","slogan":"","is_show_logo":false,"img_w100h20":""},"onyx":{"ota":"onyx","name":"\u9152\u5e97\u5b98\u7f51","homepage":"","tel":"","slogan":"\u5b98\u7f51\u9884\u8ba2\uff0c\u6700\u4f4e\u4ef7\u4fdd\u8bc1\uff01","is_show_logo":false,"img_w100h20":""},"mbk":{"ota":"mbk","name":"\u9152\u5e97\u5b98\u7f51","homepage":"","tel":"","slogan":"","is_show_logo":true,"img_w100h20":"https:\/\/images.mafengwo.net\/images\/hotel\/ota\/mbk_w100h20_2x_2.png"},"geae":{"ota":"geae","name":"\u9152\u5e97\u4ee3\u7406","homepage":"","tel":"","slogan":"","is_show_logo":false,"img_w100h20":""}},"mddid":10198,"booking_flag":"hotel_new","country_mddid":21536,"is_cnmain":true,"is_test":0,"hotel_activity_type":0,"WWW_HOST":"www.mafengwo.cn","IMG_HOST":"images.mafengwo.net","W_HTTP":"https:\/\/w.mafengwo.cn","P_HOST":"passport.mafengwo.cn","P_HTTP":"https:\/\/passport.mafengwo.cn","PAGELET_HTTP":"https:\/\/pagelet.mafengwo.cn","JS_HOST":"js.mafengwo.net","TONGJI_HOST":"tongji.mafengwo.cn","UID":37689243,"CSTK":"ea7e6e221dce3942701215336bec1705_b3b26ce13a17b6d0b2becda2515f29ef","GOOGLE_MAP_KEY":"AIzaSyD-Su0x_rPy1xehlMBcMyTqWkU49Bk53nQ","MOBILE_BINDED":true};
    </script>
    <style>
        .hotel-new-icon .close {
            position: absolute;
            display: block;
            width: 25px;
            height: 25px;
            right: 0;
            bottom: 83px;
            border-radius: 50%;
        }
    </style>
    <script language="javascript" src="https://js.mafengwo.net/js/cv/js+jquery-1.8.1.min:js+global+json2:js+M+Module:js+M+M:miniapp+js+sdk:js+M+Log:js+m.statistics:js+advert+inspector^YlRX^1619608995.js" type="text/javascript" crossorigin="anonymous"></script>
    <script async="" src="https://js.mafengwo.net/js/cv/js+Dropdown:js+pageletcommon+pageHeadUserInfoWWWNormal:js+jquery.tmpl:js+M+module+InputListener:js+M+module+SuggestionXHR:js+M+module+DropList:js+M+module+Suggestion:js+M+module+MesSearchEvent:js+SiteSearch:js+AHeader:js+M+module+PageAdmin:js+M+module+Storage:js+M+module+Cookie:js+M+module+ResourceKeeper:js+jquery.jgrowl.min:js+AMessage:js+M+module+dialog+Layer:js+M+module+dialog+DialogBase:js+M+module+dialog+Dialog:js+M+module+dialog+alert:js+M+module+FrequencyVerifyControl:js+M+module+FrequencySystemVerify:js+ALogin:js+M+module+ScrollObserver:js+M+module+QRCode:js+AToolbar:js+ACnzzGaLog:js+ARecruit:js+ALazyLoad:js+jquery.scrollTo:js+MouseTip:js+hotel+module+Hash:js+hotel+module+ModuleProvider:js+hotel+module+ImageLoader:js+hotel+module+Album:js+hotel+module+AlbumComment:js+hotel+module+Log:js+hotel+module+FavDialog:js+hotel+mfwmap+mfwmap-util:js+hotel+mfwmap+mfwmap-event:js+hotel+mfwmap+mfwmap-runtime-google:js+hotel+mfwmap+mfwmap-runtime-amap:js+hotel+mfwmap+mfwmap-runtime-leaflet:js+hotel+mfwmap+mfwmap:js+hotel+mfwmap+mfwmap-overlays:js+hotel+module+ListTips:js+xdate:js+hotel+module+BookingDate:js+hotel+info:js+hotel+module+FestivalDateConfig:js+jquery-ui-core:js+jquery-ui-datepicker:js+hotel+module+DateRangePicker:js+hotel+module+BookingGuests:js+hotel+module+NumberGuestsPicker:js+hotel+module+BookingInfo:js+hotel+info_booking:js+M+module+Pagination:js+M+module+TopTip:js+hotel+module+ReportDialog:js+hotel+info_comment:js+hotel+pc_app_guide^YlFVSg^1584071349.js" crossorigin="anonymous"></script>
    <script async="" src="https://js.mafengwo.net/js/BrowserState.js?1542357400" crossorigin="anonymous"></script>
</head>
<body style="position: relative;">
<%--酒店信息展示--%>
<div class="container">
    <div class="top-info clearfix" id="_j_crumb">
        <div class="crumb">
            <span class="tit">您在这里：</span>
            <div class="item">
                <div class="drop">
                    <span class="hd"><a href="/hotel/" target="_blank">酒店<i></i></a></span>
                    <div class="bd" style="width:auto">
                        <i class="arrow"><b></b></i>
                        <div class="col">
                            <h3>周边国家和地区</h3>
                            <ul class="clearfix">
                                <li><a href="/hotel/11780/" target="_blank" title="朝鲜酒店预订">朝鲜<span>North Korea</span></a></li>
                                <li><a href="/hotel/10184/" target="_blank" title="韩国酒店预订">韩国<span>Korea</span></a></li>
                                <li><a href="/hotel/14293/" target="_blank" title="蒙古酒店预订">蒙古<span>Mongolia</span></a></li>
                                <li><a href="/hotel/10183/" target="_blank" title="日本酒店预订">日本<span>Japan</span></a></li>
                                <li><a href="/hotel/10300/" target="_blank" title="俄罗斯酒店预订">俄罗斯<span>Russia</span></a></li>
                                <li><a href="/hotel/10820/" target="_blank" title="老挝酒店预订">老挝<span>Laos</span></a></li>
                            </ul>
                        </div>
                        <div class="more"><a href="/hotel/" target="_blank">&gt;&gt;更多国家和地区</a></div>                        </div>
                </div>
                <em>&gt;</em>                </div>
            <div class="item">
                <div class="drop">
                    <span class="hd"><a href="/hotel/21536/" target="_blank" title="中国酒店预订">中国<i></i></a></span>
                    <div class="bd" style="width:auto">
                        <i class="arrow"><b></b></i>
                        <div class="col">
                            <h3>中国其他城市</h3>
                            <ul class="clearfix">
                                <li><a href="/hotel/10065/" target="_blank" title="北京閰掑簵鎺ㄨ崘">北京<span>Beijing</span></a></li>
                                <li><a href="/hotel/10099/" target="_blank" title="上海閰掑簵鎺ㄨ崘">上海<span>Shanghai</span></a></li>
                                <li><a href="/hotel/10195/" target="_blank" title="西安閰掑簵鎺ㄨ崘">西安<span>Xi'an</span></a></li>
                                <li><a href="/hotel/10088/" target="_blank" title="广州閰掑簵鎺ㄨ崘">广州<span>guangzhou</span></a></li>
                                <li><a href="/hotel/10208/" target="_blank" title="重庆閰掑簵鎺ㄨ崘">重庆<span>ChongQing</span></a></li>
                                <li><a href="/hotel/10035/" target="_blank" title="成都閰掑簵鎺ㄨ崘">成都<span>Chengdu</span></a></li>
                            </ul>
                        </div>
                        <div class="more"><a href="/hotel/21536/" target="_blank">&gt;&gt;更多城市</a></div>                        </div>
                </div>
                <em>&gt;</em>                </div>
            <div class="item"><a href="/hotel/10198/" target="_blank" title="深圳酒店查询">深圳</a><em>&gt;</em></div>
            <div class="item cur"><strong title="深圳皇庭V酒店预订">深圳皇庭V酒店预订</strong></div>
        </div>
        <div class="weather-wrapper">


            <link href="https://css.mafengwo.net/weather/littleWeather.css?1530619858" rel="stylesheet" type="text/css">

            <div class="littleWeather">
                <a href="/weather/10198.html" target="_blank">
                    <img src="http://images.mafengwo.net/images/mdd_weather/icon/icon25.png" width="25" height="25">
                    <span>小雨 21℃~28℃</span>
                </a>
            </div>
        </div>
    </div>        <div class="hotel-intro">

    <div class="intro-hd">
        <div class="intro-extra">
            <span class="score"><em>8.6</em>分</span>
            <span class="divide"></span>
        </div>
        <div class="main-title">
            <h1>深圳皇庭V酒店</h1>
        </div>
        <div class="en-title"><span>Wongtee V Hotel</span></div>
        <div class="location"><span title="金田路2028号皇岗商务中心26楼办理入住">地址：金田路2028号皇岗商务中心26楼办理入住...</span><a class="a-maps" href="/hotel/list_map.php?poiid=97816"><i class="icon-bg"></i>查看地图</a></div>
    </div>

    <div class="intro-bd clearfix" data-cs-t="酒店详情页">
        <div class="img-big _j_album_trigger clickstat " data-id="862053914" data-is-top-album="1" data-cs-p="图片" data-cs-l="大图" data-cs-d="大图">
            <img src="https://b1-q.mafengwo.net/s11/M00/B8/AE/wKgBEFz1pQ2APfwSABnSVXcUqEo72.jpeg?imageMogr2%2Fthumbnail%2F%211360x760r%2Fgravity%2FCenter%2Fcrop%2F%211360x760%2Fquality%2F90">
            <span class="num"><em>84</em> 张图片</span>
        </div>
        <ul class="img-small">
            <li><img class="_j_album_trigger clickstat" src="https://p1-q.mafengwo.net/s7/M00/EB/A9/wKgB6lPNiziAeUMeAAOQIkZ8o6c04.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90" data-id="16108332" data-cs-p="图片" data-cs-l="小图" data-cs-d="小图"></li>
            <li><img class="_j_album_trigger clickstat" src="https://b1-q.mafengwo.net/s12/M00/EE/D4/wKgED1vAWaCATW8dACnRu7CnXu492.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90" data-id="290830420" data-cs-p="图片" data-cs-l="小图" data-cs-d="小图"></li>
            <li><img class="_j_album_trigger clickstat" src="https://p1-q.mafengwo.net/s10/M00/4F/24/wKgBZ1mIgOeASlT-ABOCntp6cfI87.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90" data-id="168939732" data-cs-p="图片" data-cs-l="小图" data-cs-d="小图"></li>
            <li><img class="_j_album_trigger clickstat" src="https://b1-q.mafengwo.net/s12/M00/EE/E3/wKgED1vAWaaAOhnRACq_JDs40RE51.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90" data-id="290830576" data-cs-p="图片" data-cs-l="小图" data-cs-d="小图"></li>
            <li><img class="_j_album_trigger clickstat" src="https://p1-q.mafengwo.net/s12/M00/EE/D0/wKgED1vAWZ-AKajQAAXhzZqT3zQ43.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90" data-id="290830412" data-cs-p="图片" data-cs-l="小图" data-cs-d="小图"></li>
            <li><img class="_j_album_trigger clickstat" src="https://n1-q.mafengwo.net/s12/M00/EE/D5/wKgED1vAWaCACIJAACvBwDA9OZU86.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90" data-id="290830424" data-cs-p="图片" data-cs-l="小图" data-cs-d="小图"></li>
        </ul>
    </div>
</div>
</div>

<%--房间价格--%>
<div class="container">
    <div class="hotel-booking" id="_j_booking_date">
        <div class="hotel-searchbar clearfix">
            <div class="hs-item hs-item-date" id="_j_check_in_date">
                <span>入住日期</span>
                <input type="text" placeholder="入住日期" readonly="" id="dp1619694518550" class="hasDatepicker">

            </div>
            <div class="hs-item hs-item-date" id="_j_check_out_date">
                <span>离店日期</span>
                <input type="text" placeholder="离店日期" readonly="" id="dp1619694518551" class="hasDatepicker">

            </div>
            <div class="hs-item hs-item-people number-guests-picker" id="_j_booking_number_guests">
                <span>人数未定</span>
                <div class="ngp-dropdown _j_ngp_dropdown" style="display:none;"><div class="item _j_ngp_room_item"><div class="row-guests clearfix _j_ngp_row_guests"><span class="label">每间</span><div class="ngp-select"><div class="select-trigger _j_ngp_select_trigger"><span>2 成人</span><div class="caret"><i></i></div></div><ul style="display:none;"><li data-value="1">1</li><li data-value="2">2</li><li data-value="3">3</li><li data-value="4">4</li><li data-value="5">5</li><li data-value="6">6</li><li data-value="7">7</li></ul></div><div class="ngp-select"><div class="select-trigger _j_ngp_select_trigger"><span>0 儿童</span><div class="caret"><i></i></div></div><ul style="display:none;"><li data-value="0">0</li><li data-value="1">1</li><li data-value="2">2</li><li data-value="3">3</li><li data-value="4">4</li></ul></div></div><div class="row-children clearfix _j_ngp_row_children" style="display:none;"><span class="label">儿童年龄</span></div></div><div class="item item-action clearfix _j_ngp_action_item"><span class="tips">请优先选择日期，以便查询实时价格。</span><a class="btn-action disabled" href="javascript:;">确 认</a></div></div></div>
            <div class="hs-item hs-item-action">
                <a class="hs-btn" id="_j_price_btn" href="javascript:;">查看价格</a>
            </div>

        </div>
        <div class="hotel-loading" id="_j_booking_info_loading" style="display: none;"><i class="loading-m"></i></div>
        <div class="not-found" id="_j_booking_info_not_found" style="display:none;">您选择的日期或人数无空房，请修改后再尝试。</div>
        <div class="book-list" id="_j_booking_info" style="">
            <div class="caption">
                <div class="title">价格来源</div>

                <div class="low-room" style="margin-left:150px;width:400px;">最低价房型</div>
                <div class="price">最低价格/每晚</div>
            </div>
            <a class="item _j_booking_item" href="javascript:;" target="_blank" data-ota="booking" data-url="/hotel/booking/go2booking.php?from=hotel_new&amp;mddid=10198&amp;poi_id=97816&amp;to=booking&amp;j=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fcn%2Fshenzhen-huangtin.zh-cn.html%3Fno_rooms%3D1%26group_adults%3D2%26group_children%3D0%26label%3Dhotel-340184_nrm-01_gstadt-02_gstkid-00_logid-%7Bbooking_log_id%7D" data-price="931" data-is-cache-price="1" data-is-sold-out="1" data-pay-type="">
                <div class="title">
                    <img src="https://images.mafengwo.net/images/hotel/ota/booking_w100h20_2x_2.png" width="100" height="20">
                </div>
                <div class="low-room _j_booking_room" style="margin-left:150px;width:400px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">雅致双床房 - 免费取消</div>
                <div class="price _j_booking_price_wrapper" style="width:120px;">
                    <span class="total" style="width:115px;">
                        <strong class="_j_booking_price">￥1030</strong>
                        <strong class="_j_booking_price_text" style="font-size: 12px;color: #666;padding-left: 2px;vertical-align: 1px;">起</strong>
                        <span style="margin-left:5px;font-size:14px;color:#999;text-decoration:line-through;"></span>
                    </span>
                    <i class="icon-bg icon-arrow"></i>
                </div>
                <div class="loading _j_booking_loading" style="display:none;">
                    <img class="loading_price" src="http://css.mafengwo.net/images/home/loading3.gif">
                </div>
            </a>
            <a class="item _j_booking_item" href="javascript:;" target="_blank" data-ota="youyu_pkg" data-url="/hotel/booking/go2booking.php?from=hotel_new&amp;mddid=10198&amp;poi_id=97816&amp;to=youyu_pkg&amp;j=http%3A%2F%2Fwww.mafengwo.cn%2Fhotel_zx%2Fhotel%2Findex.php%3FiId%3D48996%26sRoom%3D2" data-price="1120" data-is-cache-price="0" data-is-sold-out="0" data-pay-type="0" data-ota-id="16">
                <div class="title">
                    <img src="https://images.mafengwo.net/images/hotel/newlogo/mafengwo_2018@2x.png" width="100" height="20">
                    <i class="icon-bg icon-alipay" style=""></i>
                    <i class="icon-bg icon-wxpay" style=""></i>
                </div>
                <div class="low-room _j_booking_room" style="margin-left:150px;width:400px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">雅致大床房</div>
                <div class="price _j_booking_price_wrapper" style="width:120px;">
                    <span class="total" style="width:115px;">
                        <strong class="_j_booking_price">￥1120</strong>
                        <strong class="_j_booking_price_text" style="font-size: 12px;color: #666;padding-left: 2px;vertical-align: 1px;">起</strong>
                        <span style="margin-left:5px;font-size:14px;color:#999;text-decoration:line-through;"></span>
                    </span>
                    <i class="icon-bg icon-arrow"></i>
                </div>
                <div class="loading _j_booking_loading" style="display:none;">
                    <img class="loading_price" src="http://css.mafengwo.net/images/home/loading3.gif">
                </div>
            </a>
            <a class="item _j_booking_item" href="javascript:;" target="_blank" data-ota="ctrip" data-url="/hotel/booking/go2booking.php?from=hotel_new&amp;mddid=10198&amp;poi_id=97816&amp;to=ctrip&amp;j=http://hotels.ctrip.com/hotel/385210.html" data-price="1106" data-is-cache-price="1" data-is-sold-out="0" data-pay-type="">
                <div class="title">
                    携程
                </div>
                <div class="low-room _j_booking_room" style="margin-left:150px;width:400px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">雅致大床房</div>
                <div class="price _j_booking_price_wrapper" style="width:120px;">
                    <span class="total" style="width:115px;">
                        <strong class="_j_booking_price">￥1106</strong>
                        <strong class="_j_booking_price_text" style="font-size: 12px;color: #666;padding-left: 2px;vertical-align: 1px;">起</strong>
                        <span style="margin-left:5px;font-size:14px;color:#999;text-decoration:line-through;"></span>
                    </span>
                    <i class="icon-bg icon-arrow"></i>
                </div>
                <div class="loading _j_booking_loading" style="display:none;">
                    <img class="loading_price" src="http://css.mafengwo.net/images/home/loading3.gif">
                </div>
            </a>
        </div>
    </div>
</div>

<%--地图--%>
<div style=";margin-left: 420px;">
    <%--<iframe name="my-iframe" id="baiduMap" src="${pageContext.request.contextPath}/HotelServlet?lng=<%=hotelList.get(0).getLng()%>&lag=<%=locateInfoList.get(0).getLag()%>" frameborder="0" width="400px" height="200px" scrolling="no"></iframe>--%>
</div>

<%--评论--%>

</body>
</html>
