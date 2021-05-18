<%@ page import="domain.HotelInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.RoomInfo" %>
<%@ page import="domain.RoomDateInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%HotelInfo hotel= (HotelInfo) session.getAttribute("hotelInfo");%>
    <link rel="stylesheet" type="text/css" href="https://webapi.amap.com/theme/v1.3/style1536672475627.css?v=2">
    <style type="text/css">.amap-logo{display:block!important;pointer-events:none;}</style><style type="text/css">.amap-indoor-map .label-canvas{position:absolute;top:0;left:0}.amap-indoor-map .highlight-image-con *{pointer-events:none}.amap-indoormap-floorbar-control{position:absolute;margin:auto 0;bottom:165px;right:12px;width:35px;text-align:center;line-height:1.3em;overflow:hidden;padding:0 2px}.amap-indoormap-floorbar-control .panel-box{background-color:rgba(255,255,255,.9);border-radius:3px;border:1px solid #ccc}.amap-indoormap-floorbar-control .select-dock{position:absolute;top:0;left:0;width:100%;box-sizing:border-box;height:30px;border:solid #4196ff;border-width:0 2px;border-radius:2px;pointer-events:none;background:linear-gradient(to bottom,#f6f8f9 0,#e5ebee 50%,#d7dee3 51%,#f5f7f9 100%)}.amap-indoor-map .transition{transition:opacity .2s},.amap-indoormap-floorbar-control .transition{transition:top .2s,margin-top .2s}.amap-indoormap-floorbar-control .select-dock:after,.amap-indoormap-floorbar-control .select-dock:before{content:"";position:absolute;width:0;height:0;left:0;top:10px;border:solid transparent;border-width:4px;border-left-color:#4196ff}.amap-indoormap-floorbar-control .select-dock:after{right:0;left:auto;border-left-color:transparent;border-right-color:#4196ff}.amap-indoormap-floorbar-control.is-mobile{width:37px}.amap-indoormap-floorbar-control.is-mobile .floor-btn{height:35px;line-height:35px}.amap-indoormap-floorbar-control.is-mobile .select-dock{height:35px;top:36px}.amap-indoormap-floorbar-control.is-mobile .select-dock:after,.amap-indoormap-floorbar-control.is-mobile .select-dock:before{top:13px}.amap-indoormap-floorbar-control.is-mobile .floor-list-box{height:105px}.amap-indoormap-floorbar-control .floor-list-item .floor-btn{color:#555;font-family:"Times New Roman",sans-serif,"Microsoft Yahei";font-size:16px}.amap-indoormap-floorbar-control .floor-list-item.selected .floor-btn{color:#000}.amap-indoormap-floorbar-control .floor-btn{height:28px;line-height:28px;overflow:hidden;cursor:pointer;position:relative;-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.amap-indoormap-floorbar-control .floor-btn:hover{background-color:rgba(221,221,221,.4)}.amap-indoormap-floorbar-control .floor-minus,.amap-indoormap-floorbar-control .floor-plus{position:relative;text-indent:-1000em}.amap-indoormap-floorbar-control .floor-minus:after,.amap-indoormap-floorbar-control .floor-plus:after{content:"";position:absolute;margin:auto;top:9px;left:0;right:0;width:0;height:0;border:solid transparent;border-width:10px 8px;border-top-color:#777}.amap-indoormap-floorbar-control .floor-minus.disabled,.amap-indoormap-floorbar-control .floor-plus.disabled{opacity:.3}.amap-indoormap-floorbar-control .floor-plus:after{border-bottom-color:#777;border-top-color:transparent;top:-3px}.amap-indoormap-floorbar-control .floor-list-box{max-height:153px;position:relative;overflow-y:hidden}.amap-indoormap-floorbar-control .floor-list{margin:0;padding:0;list-style:none}.amap-indoormap-floorbar-control .floor-list-item{position:relative}.amap-indoormap-floorbar-control .floor-btn.disabled,.amap-indoormap-floorbar-control .floor-btn.disabled *,.amap-indoormap-floorbar-control.with-indrm-loader *{-webkit-pointer-events:none!important;pointer-events:none!important}.amap-indoormap-floorbar-control .with-indrm-loader .floor-nonas{opacity:.5}.amap-indoor-map-moverf-marker{color:#555;background-color:#FFFEEF;border:1px solid #7E7E7E;padding:3px 6px;font-size:12px;white-space:nowrap;display:inline-block;position:absolute;top:1em;left:1.2em}.amap-indoormap-floorbar-control .amap-indrm-loader{-moz-animation:amap-indrm-loader 1.25s infinite linear;-webkit-animation:amap-indrm-loader 1.25s infinite linear;animation:amap-indrm-loader 1.25s infinite linear;border:2px solid #91A3D8;border-right-color:transparent;box-sizing:border-box;display:inline-block;overflow:hidden;text-indent:-9999px;width:13px;height:13px;border-radius:7px;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0}@-moz-keyframes amap-indrm-loader{0%{-moz-transform:rotate(0);transform:rotate(0)}100%{-moz-transform:rotate(360deg);transform:rotate(360deg)}}@-webkit-keyframes amap-indrm-loader{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes amap-indrm-loader{0%{-moz-transform:rotate(0);-ms-transform:rotate(0);-webkit-transform:rotate(0);transform:rotate(0)}100%{-moz-transform:rotate(360deg);-ms-transform:rotate(360deg);-webkit-transform:rotate(360deg);transform:rotate(360deg)}}</style><script type="text/javascript" async="" charset="utf-8" src="https://c.cnzz.com/core.php?web_id=30065558&amp;t=q"></script><script type="text/javascript" async="" charset="utf-8" src="https://w.cnzz.com/c.php?id=30065558&amp;async=1"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=hotel.getHotelName()%>预订</title>
    <link href="${pageContext.request.contextPath}/mu/css/viewRoomInfo/viewRoomInfo.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/mu/js/viewRoomInfo/viewRoomInfoOne.js" rel="stylesheet" type="text/css">
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
        .toolbar-item-top, .toolbar-item-feedback, .toolbar-item-code {
            padding-left: 40px;
        }
        .time {
            vertical-align: middle;
        }
    </style>
    <script language="javascript" src="${pageContext.request.contextPath}/mu/js/viewRoomInfo/viewRoomInfoTwo.js" type="text/javascript" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/mu/js/viewRoomInfo/viewRoomInfoThree.js" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/mu/js/viewRoomInfo/viewRoomInfoFour.js" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/mu/js/viewRoomInfo/viewRoomInfoFive.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mu/css/viewRoomInfo/viewRoomInfoTwo.css">
    <script async="" src="${pageContext.request.contextPath}/mu/js/viewRoomInfo/viewRoomInfoSix.js" crossorigin="anonymous"></script></head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mu/layui/css/layui.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/mu/layui/layui.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/index.css">
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <style type="text/css">
    #allmap {overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=MKmjSL6aurGZbHsmH7QZbHmU60ahLKsW"></script>
    <body style="position: relative;">

<%  int userId = (int) session.getAttribute("userId");
    //List<RoomInfo> roomList = new ArrayList<RoomInfo>();
    List<String> hotelInPictureList = (List<String>)session.getAttribute("hotelPicture");
    List<RoomInfo> roomList = (List<RoomInfo>)session.getAttribute("roomList");
    List<Integer> roomNumList = (List<Integer>) session.getAttribute("roomNumList");
%>

<div class="container">
    <div class="top-info clearfix" id="_j_crumb">
        <div class="crumb">
            <span class="tit">您在这里：</span>
            <div class="item">
                <div class="drop">
                    <span class="hd">酒店<i></i></span>
                    <div class="bd" style="width:auto">
                        <i class="arrow"><b></b></i>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="drop">
                    <span class="hd"><%=hotel.getCounty()%><i></i></span>
                    <div class="bd" style="width:auto">
                        <i class="arrow"><b></b></i>
                    </div>
                </div>
                <em></em>
            </div>
            <div class="item"><a target="_blank" title="深圳酒店查询"><%=hotel.getDowntown()%></a><em>&gt;</em></div>
            <div class="item cur"><strong title="深圳皇庭V酒店预订"><%=hotel.getHotelName()%>预订</strong></div>
        </div>
        <div class="weather-wrapper">
            <link href="https://css.mafengwo.net/weather/littleWeather.css?1530619858" rel="stylesheet" type="text/css">
            <div class="littleWeather">
                    <img src="http://images.mafengwo.net/images/mdd_weather/icon/icon25.png" width="25" height="25">
                    <span>小雨 21℃~28℃</span>
                </a>
            </div>
        </div>
    </div>
    <div class="hotel-intro">

    <div class="intro-hd">
        <div class="intro-extra">
            <span class="score"><em>8.6</em>分</span>
            <span class="divide"></span>
        </div>
        <div class="main-title">
            <h1><%=hotel.getHotelName()%></h1>
        </div>
        <div class="location"><span>地址：<%=hotel.getHotelAddress()%></span></div>
    </div>

    <div class="intro-bd clearfix" data-cs-t="酒店详情页">
        <div class="img-big _j_album_trigger clickstat " data-id="862053914" data-is-top-album="1" data-cs-p="图片" data-cs-l="大图" data-cs-d="大图">
            <img src="${pageContext.request.contextPath}/FreegoImg/mu/hotelPicture/overPicture/<%=hotel.getOverPicture()%>.jpeg">
            <span class="num"></span>
        </div>
        <ul class="img-small" style="float: left">
            <%for(int hipl = 0;hipl < hotelInPictureList.size();hipl++){%>
            <li><img class="_j_album_trigger clickstat"
                     src="${pageContext.request.contextPath}/FreegoImg/mu/hotelPicture/inPicture/<%=hotelInPictureList.get(hipl)%>" data-id="16108332" data-cs-p="图片" data-cs-l="小图" data-cs-d="小图"></li>
            <%}%>
        </ul>
    </div>
</div>
</div>
</div>

<div class="hotel-navbar" id="_j_navbar" data-cs-t="酒店详情页" style="transform: translateY(0px);"></div>
<div class="container">
  <div class="hotel-booking" >
      <div class="hotel-searchbar clearfix">
            <form class="form-inline" name="myForm" id = "alignCenterOne" method="post" action="/LocationServlet?methods=queryLocation&userId=<%=userId%>" >
                <!--入住日期-->
                <div class="form-group" style="margin-left: 5px;">
                    <input type="text" name="ruzhu"  class="layui-input" placeholder="请选择日期" id="oneInTime" style=" border-radius: 4px;height: 35px;width: 230px;">
                </div>
                <script>
                    layui.use('laydate', function(){
                        var laydate = layui.laydate;
                        //执行一个laydate实例
                        laydate.render({
                            elem: '#oneInTime' //指定元素
                        });
                    });
                </script>
                <!--离店日期-->
                <div class="form-group" style="margin-left: 5px;">
                    <input type="text" name="likai"  class="layui-input" placeholder="请选择日期" id="oneOutTime" style="width:230px;border-radius: 4px;height: 35px">
                </div>
                <script>
                    layui.use('laydate', function(){
                        var laydate = layui.laydate;
                        //执行一个laydate实例
                        laydate.render({
                            elem: '#oneOutTime' //指定元素
                        });
                    });
                </script>

                <input type="submit" class="btn btn-warning" value="查询" onclick="return CheckPost();">
            </form>
            <script>
                function CheckPost()
                {
                    var mudidi = document.getElementById("distination");
                    var ruzhuTime = document.getElementById("oneInTime");
                    var likaiTime = document.getElementById("oneOutTime");

                    if(mudidi.value.length == 0){
                        alert("请输入目的地");
                        return false;
                    }else{
                        if (ruzhuTime.value.length == 0 || likaiTime.value.length == 0){
                            if(ruzhuTime.value.length == 0 && likaiTime.value.length == 0){
                                return true;
                            }else{
                                alert("请将入住与离开时间输入完整");
                                return false;
                            }
                        }else{
                            var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
                            var regExp = new RegExp(reg);
                            //alert("进来了");
                            if(!regExp.test(ruzhuTime.value) || !regExp.test(likaiTime.value)){
                                alert("日期格式不正确，正确格式为：2014-01-01");
                                return false;
                            }else{
                                var nowDate = new Date();
                                var d1 = string2date(ruzhuTime.value);
                                var d2 = string2date(likaiTime.value)
                                var ruzhuyear = d1.getFullYear();
                                var ruzhumonth = d1.getMonth();
                                var ruzhudate = d1.getDate();
                                var likaiyear = d2.getFullYear();
                                var likaimonth = d2.getMonth();
                                var likaidate = d2.getDate();
                                if(likaiyear >= nowDate.getFullYear()
                                    && likaimonth >= nowDate.getMonth()
                                    && likaidate >= nowDate.getDate()
                                    && ruzhuyear >= nowDate.getFullYear()
                                    && ruzhumonth >= nowDate.getMonth()
                                    && ruzhudate >= nowDate.getDate()){

                                    if(ruzhuyear <= likaiyear
                                        && ruzhumonth <= likaimonth
                                        && ruzhudate <= likaidate){
                                        return true;
                                    }
                                    else{
                                        alert("请输入的入住日期小于等于离开日期");
                                        return false;
                                    }
                                }else{
                                    alert("请输入的日期大于当前时间")
                                    return false;
                                }

                            }
                        }
                    }
                    function string2date(str){
                        return new Date(Date.parse(str.replace(/-/g,  "/")));
                    }
                }
            </script>
        </div>
      <div class="hotel-booking" id="_j_booking_date">
          <div class="room-table" id="_j_booking_info" style="width: 1000px;">
              <ul class="thd" style="transform: translateY(0px);">
                  <li class="td-room" style="width: 250px;">房型</li>
                  <li class="td-person">人数上限</li>
                  <li class="td-policy">相关政策</li>
                  <li class="td-price">价格
                      <span class="not-tax" id="lbTaxInfo"></span>
                  </li>
                  <li class="td-action">预订房间数</li>
              </ul>

              <%--for--%>
              <%for(int i = 0;i < roomList.size();i++){%>
              <div id="box_room_list" class="ota_room_box" data-ota="" style="display: block;">
                  <div class="row-item clearfix" data-type_name="雅致大床房" data-type_id="0002">
                      <div class="td-room" style="width: 250px;">
                          <div class="room-name"><%=roomList.get(i).getRoomName()%></div>
                          <div class="room-img" style="overflow:hidden;width:220px;height:132px;">
                              <img class="_j_room_image" data-src="http://pavo.elongstatic.com/i/Hotel120_120/LOA7XlgFtC.jpg" style="position: relative; top: -49px; left: 0px; width: 220px;" src="http://pavo.elongstatic.com/i/Hotel120_120/LOA7XlgFtC.jpg">
                          </div>
                          <p>
                      </div>
                      <div class="sub-group clearfix" data-room_type="0002" data-room_id="20710625" data-maxguest="2">
                          <div class="td-person">
                          <div>
                              <i class="icon-bg icon-person icon-p2"></i> <%=roomList.get(i).getPeopleLimite()%>住客
                          </div>
                          </div>
                          <ul class="td-policy">
                              <li class="c-red">不可取消和变更</li>
                              <li>在线付款</li>
                              <li>二次确认</li>
                          </ul>
                          <div class="td-price">
                              <strong>￥<%=roomList.get(i).getRoomPrice()%></strong>
                              <strong style="font-size: 12px; font-style: normal;font-weight: normal; display: inline-block; margin-left: 5px; vertical-align: 1px;">(已含税)</strong>
                          </div>
                          <div class="td-action">
                              <a class="btn-action btn_booking" data-ota="" data-type_id="0002" data-price="1122" data-type_name="雅致大床房" data-room_id="20710625" data-remain_num="8" data-max_p_num="2" data-max_c_num="-1" data-ext_info="{&quot;customer_type&quot;:&quot;All&quot;,&quot;CurrencyCode&quot;:&quot;RMB&quot;,&quot;TotalRate&quot;:1122,&quot;room_type_id&quot;:&quot;0549&quot;,&quot;detail_cancel&quot;:&quot;预付规则：在21.05.06 到00.01.01期间入住，需要提供信用卡预付全额房费。一经预订成功不可变更/取消。&quot;,&quot;youyu_search_key&quot;:&quot;aef986513d22e6c7cd15bf6d4af52880.1620191461&quot;,&quot;hotel_code&quot;:&quot;91022091&quot;,&quot;RoomId&quot;:&quot;0002&quot;,&quot;Littlemajiaid&quot;:&quot;0_0_0_00#00_a5b653b80a47ef19573e5f5d447dc175&amp;13:11:01&quot;,&quot;GoodsUniqId&quot;:&quot;91022091A549A20710625A0A5abc21cdaab3aaf36e1cc07e416f246f&quot;,&quot;IsPromotion&quot;:false,&quot;confirm_type&quot;:2,&quot;invoice_type&quot;:3,&quot;o_breakfast&quot;:&quot;不含早&quot;}" data-activity="" data-extdata="" href="javascript:void(0);">预订</a>
                          </div>
                          <div class="surplus" style="float: right">剩余<%=roomNumList.get(i)%>间</div>
                      </div>
                  </div>
                  <div class="hotel-loading" id="room_loading" style="display: none;">
                      <i class="loading-m"></i>
                  </div>
              </div>
              <%}%>
          </div>
      </div>
  </div>
  <div class="hotel-maps clearfix" id="_j_map_wrapper" data-cs-t="酒店详情页">
        <div class="maps-cont" id="_j_map">
            <div class="map-container amap-container" id="_j_map_container_32F506F6" style="position: relative; background: rgb(252, 249, 242) none repeat scroll 0%">
                <object style="display: block; position: absolute; top: 0; left: 0; height: 100%; width: 100%; overflow: hidden; pointer-events: none; z-index: -1;" type="text/html" data="about:blank"></object>
                <div class="amap-maps">
                    <div class="amap-drags" style=""><div class="amap-layers" style="transform: translateZ(0px);">
                        <div id="allmap" style="width:680px;height:380px;position: absolute; z-index: 0; top: 0px; left: 0px;"></div>
                        <script type="text/javascript">
                            // 百度地图API功能
                            var map = new BMap.Map("allmap");    // 创建Map实例
                            map.centerAndZoom(new BMap.Point(<%=hotel.getLng()%>, <%=hotel.getLat()%>), 11);  // 初始化地图,设置中心点坐标和地图级别
                            //添加地图类型控件
                            map.addControl(new BMap.MapTypeControl({
                                mapTypes:[
                                    BMAP_NORMAL_MAP,
                                    BMAP_HYBRID_MAP
                                ]}));
                            map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
                            map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
                        </script>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <div class="hotel-info" id="_j_hotel_info">
        <div class="info-section">
            <dl class="clearfix">
                <dt>基本信息</dt>
                <dd class="clearfix">
                    <div class="cell" style="width: 200px;">
                        <span class="label">入住时间: </span>
                        <span class="content" style="width: 200px;"><strong>14:00 - 12:00</strong></span>
                    </div>
                    <div class="cell">
                        <span class="label">离店时间: </span>
                        <span class="content"><strong>12:00</strong>之前</span>
                    </div>
                    <div class="cell">
                        <span class="label">建成于: </span>
                        <span class="content"><strong>2011</strong>年</span>
                    </div>
                    <div class="cell">
                        <span class="label">翻修于: </span>
                        <span class="content"><strong>2012</strong>年</span>
                    </div>
                    <div class="cell">
                        <span class="label">酒店规模: </span>
                        <span class="content"><strong>235</strong>间客房</span>
                    </div>
                </dd>
            </dl>
        </div>
        <div class="info-section">
            <div class="expand-wrap" id="_j_facility_info" style="height: 72px;">
                <dl class="clearfix">
                    <dt>主要设施</dt>
                    <dd>
                        <ul class="facility-item clearfix">
                            <li><i class="icon-bg icon-wifi"></i>wifi服务</li>
                            <li><i class="icon-bg icon-park"></i>免费停车场</li>
                            <li><i class="icon-bg icon-elevator"></i>电梯</li>
                            <li class="off"><i class="icon-bg icon-restaurant"></i>餐厅</li>
                            <li><i class="icon-bg icon-consign"></i>行李寄存</li>
                            <li><i class="icon-bg icon-24hours"></i>24小时服务</li>
                            <li><i class="icon-bg icon-thermos"></i>热水壶</li>
                            <li><i class="icon-bg icon-blower"></i>吹风机</li>
                        </ul>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>酒店服务</dt>
                    <dd>
                        <ul class="facility-item clearfix">
                            <li><i class="icon-bg icon-ok"></i>接机服务</li>
                            <li><i class="icon-bg icon-ok"></i>外币兑换服务</li>
                            <li><i class="icon-bg icon-ok"></i>邮政服务</li>
                            <li><i class="icon-bg icon-ok"></i>SPA</li>
                            <li><i class="icon-bg icon-ok"></i>旅游服务</li>
                            <li><i class="icon-bg icon-ok"></i>客房服务</li>
                            <li><i class="icon-bg icon-ok"></i>婚宴服务</li>
                            <li><i class="icon-bg icon-ok"></i>租车服务</li>
                            <li><i class="icon-bg icon-ok"></i>快速入住服务</li>
                            <li><i class="icon-bg icon-ok"></i>叫车服务</li>
                            <li><i class="icon-bg icon-ok"></i>接站服务</li>
                            <li><i class="icon-bg icon-ok"></i>礼宾服务</li>
                            <li><i class="icon-bg icon-ok"></i>酒店禁烟</li>
                            <li><i class="icon-bg icon-ok"></i>多国语言工作人员</li>
                            <li><i class="icon-bg icon-ok"></i>一次性账单结算</li>
                            <li><i class="icon-bg icon-ok"></i>信用卡结算</li>
                            <li><i class="icon-bg icon-ok"></i>24小时大堂经理</li>
                        </ul>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>酒店设施</dt>
                    <dd>
                        <ul class="facility-item clearfix">
                            <li><i class="icon-bg icon-ok"></i>商务中心</li>
                            <li><i class="icon-bg icon-ok"></i>中餐厅</li>
                            <li><i class="icon-bg icon-ok"></i>健身房</li>
                            <li><i class="icon-bg icon-ok"></i>室外游泳池</li>
                            <li><i class="icon-bg icon-ok"></i>会议设施</li>
                            <li><i class="icon-bg icon-ok"></i>无障碍客房</li>
                            <li><i class="icon-bg icon-ok"></i>西餐厅</li>
                            <li><i class="icon-bg icon-ok"></i>休息区</li>
                            <li><i class="icon-bg icon-ok"></i>茶室</li>
                            <li><i class="icon-bg icon-ok"></i>大堂吧</li>
                            <li><i class="icon-bg icon-ok"></i>公共区域监控</li>
                            <li><i class="icon-bg icon-ok"></i>多功能厅</li>
                            <li><i class="icon-bg icon-ok"></i>多媒体演示系统</li>
                        </ul>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>房间设施</dt>
                    <dd>
                        <ul class="facility-item clearfix">
                            <li><i class="icon-bg icon-ok"></i>叫醒服务</li>
                            <li><i class="icon-bg icon-ok"></i>国内长途电话</li>
                            <li><i class="icon-bg icon-ok"></i>24小时热水</li>
                            <li><i class="icon-bg icon-ok"></i>保险箱</li>
                            <li><i class="icon-bg icon-ok"></i>浴衣</li>
                            <li><i class="icon-bg icon-ok"></i>浴缸</li>
                            <li><i class="icon-bg icon-ok"></i>雨伞租借服务</li>
                            <li><i class="icon-bg icon-ok"></i>熨衣设备</li>
                            <li><i class="icon-bg icon-ok"></i>多种规格电源插座</li>
                            <li><i class="icon-bg icon-ok"></i>小冰箱／迷你吧</li>
                            <li><i class="icon-bg icon-ok"></i>无烟房</li>
                            <li><i class="icon-bg icon-ok"></i>宽带上网</li>
                            <li><i class="icon-bg icon-ok"></i>国际长途电话</li>
                            <li><i class="icon-bg icon-ok"></i>空调</li>
                            <li><i class="icon-bg icon-ok"></i>电视</li>
                            <li><i class="icon-bg icon-ok"></i>淋浴设施</li>
                            <li><i class="icon-bg icon-ok"></i>沙发</li>
                            <li><i class="icon-bg icon-ok"></i>拖鞋</li>
                            <li><i class="icon-bg icon-ok"></i>衣柜/衣橱</li>
                            <li><i class="icon-bg icon-ok"></i>110V电压插座</li>
                            <li><i class="icon-bg icon-ok"></i>220V电压插座</li>
                            <li><i class="icon-bg icon-ok"></i>免费洗漱用品</li>
                            <li><i class="icon-bg icon-ok"></i>遮光窗帘</li>
                            <li><i class="icon-bg icon-ok"></i>鸭绒被</li>
                            <li><i class="icon-bg icon-ok"></i>毯子或被子</li>
                            <li><i class="icon-bg icon-ok"></i>备用床具</li>
                            <li><i class="icon-bg icon-ok"></i>自动窗帘</li>
                            <li><i class="icon-bg icon-ok"></i>智能门锁</li>
                            <li><i class="icon-bg icon-ok"></i>针线包</li>
                            <li><i class="icon-bg icon-ok"></i>书桌</li>
                            <li><i class="icon-bg icon-ok"></i>闹钟</li>
                            <li><i class="icon-bg icon-ok"></i>体重称</li>
                            <li><i class="icon-bg icon-ok"></i>电话</li>
                            <li><i class="icon-bg icon-ok"></i>桑拿浴室</li>
                            <li><i class="icon-bg icon-ok"></i>洗浴间电视</li>
                            <li><i class="icon-bg icon-ok"></i>洗浴间电话</li>
                            <li><i class="icon-bg icon-ok"></i>化妆镜</li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <a class="expand-more" id="_j_facility_info_expand_trigger" href="javascript:;" data-is-expand="0"><i class="icon-bg icon-more"></i><span>展开全部</span></a>
        </div>
        <div class="info-section">
            <a style="color: #666;font-weight: bold;text-decoration: none;cursor: default;" target="_blank" href="/hotel/license?hotel_id=97816">马蜂窝酒店平台合作伙伴</a>
        </div>
        <div class="info-section">
            <div class="expand-wrap" id="_j_description" style="height: auto;">
                <dl class="clearfix">
                    <dt>酒店攻略</dt>
                    <dd>深圳皇庭V酒店位于福田区金田路皇岗商务中心，临近深圳会展中心、市民中心、地铁站，是一家设计时尚、客房温馨的高星级酒店。深圳皇庭V酒店的客房设计融自然与时尚于一体，拥有时尚客房及设计独特的豪华套房，24小时白金管家为宾客提供个性化的尊崇服务，让您尽享宾至如归的感觉。深圳皇庭V酒店另拥有各类时尚餐厅、酒吧及休闲场所，是您与亲朋好友共享美味佳肴的完美之地。近千平米无柱式宴会厅和6个大小不同的会议室，为您提供视听设备和资深专业的会议服务团队。酒店还配有先进一流的健身设备及SPA、俱乐部等休闲娱乐设施，在这里您可重焕身心活力，体验品味时尚。</dd>
                </dl>
            </div>
            <a class="expand-more" id="_j_description_expand_trigger" href="javascript:;" style="display:none;" data-is-expand="0"><i class="icon-bg icon-more"></i><span>展开全部</span></a>
        </div>
    </div>


    <div class="hotel-comment" id="_j_comment" data-cs-t="酒店详情页">

    </div>




    <div class="hotel-recommend" id="_j_nearby_hotels" style="" data-cs-t="酒店详情页">
        <h3>周边酒店推荐</h3>
        <ul class="clearfix"><li><a href="/hotel/9126029.html" target="_blank" data-cs-p="周边酒店" data-cs-l="周边酒店" data-cs-d="周边酒店"><div class="pic"><img src="https://b1-q.mafengwo.net/s16/M00/DE/9B/CoUBUmAPcSOAPe-HAA2-ElbyyEM88.jpeg?imageMogr2%2Fthumbnail%2F%21480x480r%2Fgravity%2FCenter%2Fcrop%2F%21480x480%2Fquality%2F90"></div><div class="bag-opa"></div><div class="fraction">8.1分</div><div class="info"><div class="prize"><span>¥<b>462</b></span></div><p>维也纳酒店(深圳会展中心岗厦地铁站店)</p><p class="eng">Vienna Hotel (Shenzhen Conference and Exhibition Center Gangxia subway station store)</p></div></a></li><li><a href="/hotel/98218.html" target="_blank" data-cs-p="周边酒店" data-cs-l="周边酒店" data-cs-d="周边酒店"><div class="pic"><img src="https://p1-q.mafengwo.net/s16/M00/A4/66/CoUBUl7ptlGAe-IAAT-rVtG3Nyo39.jpeg?imageMogr2%2Fthumbnail%2F%21480x480r%2Fgravity%2FCenter%2Fcrop%2F%21480x480%2Fquality%2F90"></div><div class="bag-opa"></div><div class="fraction">8.7分</div><div class="info"><div class="prize"><span>¥<b>2500</b></span></div><p>深圳星河丽思卡尔顿酒店</p><p class="eng">The Ritz-Carlton Shenzhen</p></div></a></li><li><a href="/hotel/98125.html" target="_blank" data-cs-p="周边酒店" data-cs-l="周边酒店" data-cs-d="周边酒店"><div class="pic"><img src="https://p1-q.mafengwo.net/s11/M00/7D/B5/wKgBEFtZsouAaIphAAMNw0hi5Gc37.jpeg?imageMogr2%2Fthumbnail%2F%21480x480r%2Fgravity%2FCenter%2Fcrop%2F%21480x480%2Fquality%2F90"></div><div class="bag-opa"></div><div class="fraction">8.3分</div><div class="info"><div class="prize"><span>¥<b>1173</b></span></div><p>深圳大中华喜来登酒店</p><p class="eng">Sheraton Shenzhen Futian Hotel</p></div></a></li><li><a href="/hotel/9023841.html" target="_blank" data-cs-p="周边酒店" data-cs-l="周边酒店" data-cs-d="周边酒店"><div class="pic"><img src="https://p1-q.mafengwo.net/s10/M00/E5/59/wKgBZ1nfC0KAYxkJAA7kvcIVa7k88.jpeg?imageMogr2%2Fthumbnail%2F%21480x480r%2Fgravity%2FCenter%2Fcrop%2F%21480x480%2Fquality%2F90"></div><div class="bag-opa"></div><div class="fraction">8.8分</div><div class="info"><div class="prize"><span>¥<b>820</b></span></div><p>深圳温德姆至尊酒店</p><p class="eng">Wyndham Grand Shenzhen</p></div></a></li></ul>
    </div>

</div>

<div id="footer"></div>


















<script>
    $(function () {
        var floatBottomBoxPannelDom = $("#float-pannel-gloable");
        var floatBottomBoxBannerConDom = $("#banner-con-gloable");
        // 过滤的URL规则，匹配不展示的页面
        // var flag = location.href.match(/www\.(mafengwo|\S+)\.(cn|ab)\/(hotel|wenda)/g) ||
        //     location.href.match(/passport\.(mafengwo|\S+)\.(cn|ab)\/setting/g) ||
        //     location.href.match(/gonglve\/ziyouxing\/(modify|home|comment)/g) ||
        //     location.href.match(/(note|ginfo)\/(create|create_index)\.php/g);
        // if(!flag){
        //     // 如果当前页面URL不在过滤列表之内，判断是否展示
        // }

        var bottomAdStatus = getCookie('bottom_ad_status');
        if (bottomAdStatus === '0') {
            closeBanner();
        } else {
            showBanner();
        }

        function scrollFn() {
            window.removeEventListener("scroll", scrollFn);
            closeBanner(true);
        }

        // 浮标非关闭按钮部分点击
        $('#float-pannel-gloable .float-image').click(function (){
            // 浮标点击上报
            reportFloatClick();
            showBanner(true);
        });

        // banner关闭按钮点击
        $('#banner-con-gloable .close-btn').click(function () {
            closeBanner(true);
        });

        // 浮标关闭按钮点击
        // $("#float-pannel-gloable .float-btn").click(function () {
        //     floatBottomBoxBannerConDom.animate({ left:-window.innerWidth,},1000,'swing');
        //     setTimeout(function () {
        //         floatBottomBoxPannelDom.animate({ left:-230,},800,'swing');
        //         floatBottomBoxBannerConDom.hide();
        //     }, 1000);
        // });

        // value 1为显示，0为收起
        function setCookie(name, value) {
            var time = 24 * 60 * 60 * 1000;
            var exp = new Date().setHours(0, 0, 0, 0);
            var expires = new Date(exp + time);
            document.cookie=name+'=' + escape(value) + ';expires='+expires.toGMTString()+';path=/';
        }

        function getCookie(name) {
            var arr = null;
            var reg = new RegExp("(^| )"+name+"=([^;]*)(;|$)");
            var arr=document.cookie.match(reg);
            if(arr) {
                return unescape(arr[2]);
            } else {
                return null;
            }
        }

        function showBanner(useAnimation) {
            // 显示banner
            floatBottomBoxPannelDom.animate({ left:-230,}, useAnimation ? 500 : 0,'swing');
            setTimeout(function () {
                floatBottomBoxBannerConDom.show();
                floatBottomBoxBannerConDom.css('width','100%');
                floatBottomBoxBannerConDom.animate({ left:0,}, useAnimation ? 1000 : 0,'swing');
                window.addEventListener("scroll", scrollFn);
            }, 800);
            setCookie('bottom_ad_status', 1);
        }
        function closeBanner(useAnimation) {
            floatBottomBoxBannerConDom.animate({ left:-window.innerWidth,}, useAnimation ? 1000 : 0,'swing');
            setTimeout(function () {
                floatBottomBoxPannelDom.animate({ left:0,}, useAnimation ? 800 : 0,'swing');
                // 浮标曝光
                reportFloatExposure();
                floatBottomBoxBannerConDom.hide();
            }, 1000);
            setCookie('bottom_ad_status', 0);
        }

        // banner曝光事件上报
        function reportBannerExposure() {
            if (window.mfwPageEvent) {
                // banner曝光
                mfwPageEvent('sales', 'show_index_index', {
                    pos_id: 'index.index.floatbanner.x',
                    module_name: '浮标大广告位',
                    item_source: 'float',
                    item_uri: window.location.href,
                })
            }
        }

        // 浮标点击事件上报
        function reportFloatClick() {
            if (window.mfwPageEvent) {
                // 浮标点击事件上报
                mfwPageEvent('sales', 'click_index_index', {
                    pos_id: 'index.index.floaticon.x',
                    module_name: '浮标广告位',
                    item_source: 'float',
                    item_uri: window.location.href,
                })
            }
        }

        // 浮标曝光事件上报
        function reportFloatExposure() {
            if (window.mfwPageEvent) {
                mfwPageEvent('sales', 'show_index_index', {
                    pos_id: 'index.index.floaticon.x',
                    module_name: '浮标广告位',
                    item_source: 'float',
                    item_uri: window.location.href,
                })
            }
        }
    });
</script>
<link href="https://css.mafengwo.net/css/mfw-toolbar.css?1537192876" rel="stylesheet" type="text/css">
<div id="_j_layer_0" class="layer _j_layer" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 5000; display: none;">
    <div class="layer_mask _j_mask" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; background: rgb(0, 0, 0) none repeat scroll 0% 0%; opacity: 0.8; z-index: -1;"></div>
    <div class="layer_content _j_content" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 0; overflow: hidden;"><div class="_j_dialog" style="position: absolute; opacity: 0; display: none; background: rgb(255, 255, 255) none repeat scroll 0% 0%; z-index: 0;">
        <div class="_j_content"><div class="pop-box _j_album_box"><div class="h-close _j_album_close">
        </div><div class="photo-gallery _j_album_image">
            <img style="display:none;" width="680" height="470"><div class="aload">
            <div class="aload1"></div><div class="aload2">
        </div>
        </div>
            <a class="btn-left" href="javascript:;">
                <i></i>
            </a>
            <a class="btn-right" href="javascript:;">
                <i></i>
            </a>
            <div class="hotel-about" style="display:none;">

            </div>
        </div>
            <div class="small-image _j_album_thumb">
                <ul style="overflow-y: scroll;width: 132px;">

                </ul><div class="btn-up"><a href="javascript:;"></a></div><div class="btn-down"><a href="javascript:;"></a></div></div><p class="tips _j_album_tips" style="display:none;">※该图片由用户上传，仅供参考</p></div></div></div><div class="_j_dialog" style="position: absolute; opacity: 0; display: none; background: rgb(255, 255, 255) none repeat scroll 0% 0%; z-index: 0;"><div class="_j_content"><div class="pop-box _j_album_box"><div class="h-close _j_album_close"></div><div class="nav-tab _j_album_class_tag"><p class="flt1 nav-left" style="display:none;"><a href="javascript:;"></a></p><div class="flt1 nav-wd"><div class="nav-wx"><a href="javascript:;" data-class-tag-index="0" class="on">全部(84)</a><a href="javascript:;" data-class-tag-index="1">外观(9)</a><a href="javascript:;" data-class-tag-index="2">内景(26)</a><a href="javascript:;" data-class-tag-index="3">房间(37)</a><a href="javascript:;" data-class-tag-index="4">餐厅(5)</a></div></div><p class="flt1 nav-right" style="display:none;"><a href="javascript:;"></a></p></div><div class="photo-gallery _j_album_image"><img style="" src="https://b1-q.mafengwo.net/s11/M00/B8/AE/wKgBEFz1pQ2APfwSABnSVXcUqEo72.jpeg?imageMogr2%2Fthumbnail%2F%211360x940r%2Fgravity%2FCenter%2Fcrop%2F%211360x940%2Fquality%2F90" width="680" height="470"><div class="aload"><div class="aload1"></div><div class="aload2"></div></div><a class="btn-left" href="javascript:;"><i></i></a><a class="btn-right" href="javascript:;"><i></i></a><div class="hotel-about" style="display:none;"></div></div><div class="small-image _j_album_thumb"><ul><li class="on" data-album-id="862053914" data-album-index="0"><img src="https://b1-q.mafengwo.net/s11/M00/B8/AE/wKgBEFz1pQ2APfwSABnSVXcUqEo72.jpeg?imageMogr2%2Fthumbnail%2F%21240x170r%2Fgravity%2FCenter%2Fcrop%2F%21240x170%2Fquality%2F90" width="120" height="85"></li><li class="" data-album-id="16108332" data-album-index="1"><img src="https://p1-q.mafengwo.net/s7/M00/EB/A9/wKgB6lPNiziAeUMeAAOQIkZ8o6c04.jpeg?imageMogr2%2Fthumbnail%2F%21240x170r%2Fgravity%2FCenter%2Fcrop%2F%21240x170%2Fquality%2F90" width="120" height="85"></li><li class="" data-album-id="290830412" data-album-index="2"><img src="https://p1-q.mafengwo.net/s12/M00/EE/D0/wKgED1vAWZ-AKajQAAXhzZqT3zQ43.jpeg?imageMogr2%2Fthumbnail%2F%21240x170r%2Fgravity%2FCenter%2Fcrop%2F%21240x170%2Fquality%2F90" width="120" height="85"></li><li class="" data-album-id="290830408" data-album-index="3"><img src="https://n1-q.mafengwo.net/s12/M00/EE/CD/wKgED1vAWZ6AHSpnAAXXnWUqB3443.jpeg?imageMogr2%2Fthumbnail%2F%21240x170r%2Fgravity%2FCenter%2Fcrop%2F%21240x170%2Fquality%2F90" width="120" height="85"></li><li class="" data-album-id="168940692" data-album-index="4"><img src="https://b1-q.mafengwo.net/s10/M00/4F/51/wKgBZ1mIgOuAUgeIAAJBt8YAiW898.jpeg?imageMogr2%2Fthumbnail%2F%21240x170r%2Fgravity%2FCenter%2Fcrop%2F%21240x170%2Fquality%2F90" width="120" height="85"></li></ul><div class="btn-up"><a href="javascript:;"></a></div><div class="btn-down"><a href="javascript:;"></a></div></div><p class="tips _j_album_tips" style="display:none;">※该图片由用户上传，仅供参考</p></div></div></div></div>                            </div><div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-datepicker-multi ui-datepicker-multi-2" style="width: 34em;"><div class="ui-datepicker-group ui-datepicker-group-first"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-left"><a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="Prev"><span class="ui-icon ui-icon-circle-triangle-w">Prev</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-month">六月</span>&nbsp;<span class="ui-datepicker-year">2021</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th scope="col"><span title="星期一">一</span></th><th scope="col"><span title="星期二">二</span></th><th scope="col"><span title="星期三">三</span></th><th scope="col"><span title="星期四">四</span></th><th scope="col"><span title="星期五">五</span></th><th scope="col" class="ui-datepicker-week-end"><span title="星期六">六</span></th><th scope="col" class="ui-datepicker-week-end"><span title="星期日">日</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="31">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-date="1" data-month="5" data-year="2021"><a class="ui-state-default" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="2" data-month="5" data-year="2021"><a class="ui-state-default" href="#">2</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="3" data-month="5" data-year="2021"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="4" data-month="5" data-year="2021"><a class="ui-state-default" href="#">4</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="5" data-month="5" data-year="2021"><a class="ui-state-default" href="#">5</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="6" data-month="5" data-year="2021"><a class="ui-state-default" href="#">6</a></td></tr><tr><td class=" " data-handler="selectDay" data-event="click" data-date="7" data-month="5" data-year="2021"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="8" data-month="5" data-year="2021"><a class="ui-state-default" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="9" data-month="5" data-year="2021"><a class="ui-state-default" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="10" data-month="5" data-year="2021"><a class="ui-state-default" href="#">10</a></td><td class=" start_day" data-handler="selectDay" data-event="click" data-date="11" data-month="5" data-year="2021"><a class="ui-state-default" href="#">11</a></td><td class=" ui-datepicker-week-end end_day ui-datepicker-current-day" data-handler="selectDay" data-event="click" data-date="12" data-month="5" data-year="2021"><a class="ui-state-default ui-state-active" href="#">12</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="13" data-month="5" data-year="2021"><a class="ui-state-default" href="#">13</a></td></tr><tr><td class=" " data-handler="selectDay" data-event="click" data-date="14" data-month="5" data-year="2021"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="15" data-month="5" data-year="2021"><a class="ui-state-default" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="16" data-month="5" data-year="2021"><a class="ui-state-default" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="17" data-month="5" data-year="2021"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="18" data-month="5" data-year="2021"><a class="ui-state-default" href="#">18</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="19" data-month="5" data-year="2021"><a class="ui-state-default" href="#">19</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="20" data-month="5" data-year="2021"><a class="ui-state-default" href="#">20</a></td></tr><tr><td class=" " data-handler="selectDay" data-event="click" data-date="21" data-month="5" data-year="2021"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="22" data-month="5" data-year="2021"><a class="ui-state-default" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="23" data-month="5" data-year="2021"><a class="ui-state-default" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="24" data-month="5" data-year="2021"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="25" data-month="5" data-year="2021"><a class="ui-state-default" href="#">25</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="26" data-month="5" data-year="2021"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="27" data-month="5" data-year="2021"><a class="ui-state-default" href="#">27</a></td></tr><tr><td class=" " data-handler="selectDay" data-event="click" data-date="28" data-month="5" data-year="2021"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="29" data-month="5" data-year="2021"><a class="ui-state-default" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="30" data-month="5" data-year="2021"><a class="ui-state-default" href="#">30</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="1">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="2">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="3">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="4">&nbsp;</td></tr></tbody></table></div><div class="ui-datepicker-group ui-datepicker-group-last"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-right"><a class="ui-datepicker-next ui-corner-all ui-state-disabled" title="Next"><span class="ui-icon ui-icon-circle-triangle-e">Next</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-month">七月</span>&nbsp;<span class="ui-datepicker-year">2021</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th scope="col"><span title="星期一">一</span></th><th scope="col"><span title="星期二">二</span></th><th scope="col"><span title="星期三">三</span></th><th scope="col"><span title="星期四">四</span></th><th scope="col"><span title="星期五">五</span></th><th scope="col" class="ui-datepicker-week-end"><span title="星期六">六</span></th><th scope="col" class="ui-datepicker-week-end"><span title="星期日">日</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="28">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="29">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="30">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-date="1" data-month="6" data-year="2021"><a class="ui-state-default" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="2" data-month="6" data-year="2021"><a class="ui-state-default" href="#">2</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="3" data-month="6" data-year="2021"><a class="ui-state-default" href="#">3</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="4" data-month="6" data-year="2021"><a class="ui-state-default" href="#">4</a></td></tr><tr><td class=" " data-handler="selectDay" data-event="click" data-date="5" data-month="6" data-year="2021"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="6" data-month="6" data-year="2021"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="7" data-month="6" data-year="2021"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="8" data-month="6" data-year="2021"><a class="ui-state-default" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-date="9" data-month="6" data-year="2021"><a class="ui-state-default" href="#">9</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="10" data-month="6" data-year="2021"><a class="ui-state-default" href="#">10</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-date="11" data-month="6" data-year="2021"><a class="ui-state-default" href="#">11</a></td></tr><tr><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="12"><span class="ui-state-default">12</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="13"><span class="ui-state-default">13</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="14"><span class="ui-state-default">14</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="15"><span class="ui-state-default">15</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="16"><span class="ui-state-default">16</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled " data-date="17"><span class="ui-state-default">17</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled " data-date="18"><span class="ui-state-default">18</span></td></tr><tr><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="19"><span class="ui-state-default">19</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="20"><span class="ui-state-default">20</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="21"><span class="ui-state-default">21</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="22"><span class="ui-state-default">22</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="23"><span class="ui-state-default">23</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled " data-date="24"><span class="ui-state-default">24</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled " data-date="25"><span class="ui-state-default">25</span></td></tr><tr><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="26"><span class="ui-state-default">26</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="27"><span class="ui-state-default">27</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="28"><span class="ui-state-default">28</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="29"><span class="ui-state-default">29</span></td><td class=" ui-datepicker-unselectable ui-state-disabled " data-date="30"><span class="ui-state-default">30</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled " data-date="31"><span class="ui-state-default">31</span></td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled" data-date="1">&nbsp;</td></tr></tbody></table></div><div class="ui-datepicker-row-break"></div></div><div id="_j_pc_app_guide" style="position: fixed; right: 20px; bottom: 20px; z-index: 10; display: none;"><i id="_j_pc_app_guide_close_btn" style="width: 20px;height: 20px;border-radius: 20px;color:#fff;background: rgba(0,0,0,0.4);position: absolute;top:10px;right: 10px;font-size: 20px;font-style: normal;text-align: center;line-height: 20px;cursor: pointer;">×</i><img src="https://images.mafengwo.net/images/hotel/pc_app_guide/qrcode_new_user_coupon.png" style="width: 150px;height: 175px;"></div><script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&amp;key=b2cf7b957c24323add8c497ed3512e15&amp;callback=initAMap"></script><p class="rec-tips-nowrap" style="left: 570px; top: 1062px; display: none;">可用微信支付</p><div id="_j_layer_1" class="layer _j_layer" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 10000; display: none;">                                <div class="layer_mask _j_mask" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; background: rgb(0, 0, 0) none repeat scroll 0% 0%; opacity: 0.7; z-index: -1;"></div>                                <div class="layer_content _j_content" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 0; overflow: hidden;"><div class="popup-box hotel-fav-dialog pop_no_margin" style="position: absolute; opacity: 0; background: rgb(255, 255, 255) none repeat scroll 0% 0%; z-index: 0; width: 350px; left: 776.5px; top: 225.778px; display: none;"><div class="popup-title"><h2>将酒店收藏到</h2><a href="javascript:;" class="close-btn _j_close"><i></i></a></div><div class="packet-list"><ul></ul></div><div class="popup-packet"><div class="cre-group"><a href="javascript:;"><i></i>创建个性分组</a><button type="button" style="display:none;">完成</button></div><div class="int-name" style="display:none;"><input type="text" placeholder="分组名称"><a href="javascript:;">确定</a></div></div></div></div>                            </div>    <style>
    .pop-reviews {
        width: 850px;
        top: 5%;
        margin: 0 0 0 -465px;
        padding: 35px 40px 40px;
        background-color: #fff;
    }
</style>
<script type="text/x-jquery-tmpl" id="_j_wengdialog">
<div class="_j_weng_form_cnt"></div>

    </script>


<div id="_j_layer_2" class="layer _j_layer" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 1000; display: none;">                                <div class="layer_mask _j_mask" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; background: rgb(0, 0, 0) none repeat scroll 0% 0%; opacity: 0.7; z-index: -1;"></div>                                <div class="layer_content _j_content" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 0; overflow: hidden;"></div>                            </div></body></html>