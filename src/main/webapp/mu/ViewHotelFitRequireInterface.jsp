<%@ page import="domain.HotelInfo" %>
<%@ page import="domain.LocateInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.RoomInfo" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.security.SecureRandom" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/17
  Time: 13:36
  查看酒店列表
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/index.css">
    <%--导入jQuery--%>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <%--导入布局js--%>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mu/layui/css/layui.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/mu/layui/layui.js"></script>

    <style>
        body{text-align:center}
        /*最上面三个输入框*/
        #alignCenterOne {
            margin: 0 auto;
            border: 1px solid #FFFFFF;
            margin-top: 10px;
            height: 100px;
        }
        /*订酒店标题*/
        #headline{
            margin-top:5%;
        }
    </style>
    <style>
        body{text-align:center}
        /*最上面三个输入框*/
        #alignCenterOne {
            margin: 0 auto;
            border: 1px solid #FFFFFF;
            margin-top: 10px;
            height: 100px;
        }
        div.room{

        }
        div.ota{
            float: left;
            width: 180px;
            display: inline;
        }
        div.roomBtn{
            position: relative;
            float: right;
            width: 300px;
        }
        /*订酒店标题*/
        #headline{
            margin-top:5%;
        }
    </style>
</head>
<body>
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
                <a href="../lww/login.jsp">登录</a>
                <a href="../lww/register.jsp">注册</a>
            </div>
        </div>
    </div>
</div>



    <%--接收从servlet中的数据--%>
    <%
    List<HotelInfo> hotelInfoList = (List<HotelInfo>)session.getAttribute("hotelList");
    List<LocateInfo> locateInfoList = (List<LocateInfo>)session.getAttribute("locateList");
    List<HotelInfo> hotelInfoListClass = new ArrayList<HotelInfo>();  //根据用户的点击确定的
    Map<Integer,List<RoomInfo>> MapRoomList = (Map<Integer,List<RoomInfo>>)session.getAttribute("MapRoomList");
    List<RoomInfo> roomList = new ArrayList<RoomInfo>();

    String mudidi = (String)session.getAttribute("mudidi");
    String likai = (String) session.getAttribute("likai");
    String ruzhu = (String) session.getAttribute("ruzhu");
    String userId = request.getParameter("userId");
    //System.out.println("keySet:"+MapRoomList.keySet());
    String yeChuan = request.getParameter("ye");
    String county = request.getParameter("county");
    //System.out.println("county:"+county);
    List<String> countyList = new ArrayList<String>();
    int ye = 1;
    if(yeChuan == null){
        ye = 1;
    }else{
        ye = Integer.parseInt(yeChuan);
    }
    //确实有这个地点  接收有多少个区
    if(locateInfoList.size() == 1){
        countyList = HotelInfo.queryCountyList(hotelInfoList);
    }
    if(county != null){
        if(county.equals("suoyou")){
            hotelInfoListClass = hotelInfoList;
        }else{
            hotelInfoListClass = new ArrayList<HotelInfo>();
            for (int i = 0;i < hotelInfoList.size();i++){
                if(hotelInfoList.get(i).getCounty().equals(county)){
                    hotelInfoListClass.add(hotelInfoList.get(i));
                }
            }
        }
    }else{
        hotelInfoListClass = hotelInfoList;
    }
    %>
    <%//确定分页的数量
        int limite = 15;
        int length = hotelInfoListClass.size() / 15;
        if(hotelInfoListClass.size() % 15 != 0){
            length++;
        }
        //System.out.println("总页数"+length);
    %>
    <%--layui--%>
    <!--第一部分  输入框部分-->
    <form class="form-inline" style="margin-top: 30px" name="myForm" id = "alignCenterOne" method="post" action="/LocationServlet?methods=queryLocation&userId=<%=userId%>" >
        <!--出行目的地-->

        <div class="form-group" style="margin-left: 5px;">
            <input id="distination" name="mudidi" value="<%=mudidi%>" style="width: 300px;" type="text" class="form-control"  placeholder="出行目的地">
        </div>
        <!--入住日期-->
        <div class="form-group" style="margin-left: 5px;">
            <%if(ruzhu.equals("")){%>
                <input type="text" name="ruzhu"  class="layui-input" placeholder="请选择日期" id="inTime" style=" border-radius: 4px;height: 35px;width: 230px;">
            <%}else{%>
                <input type="text" name="ruzhu"  class="layui-input" value="<%=ruzhu%>" placeholder="请选择日期" id="inTime" style=" border-radius: 4px;height: 35px;width: 230px;">
            <%}%>
        </div>
        <script>
            layui.use('laydate', function(){
                var laydate = layui.laydate;
                //执行一个laydate实例
                laydate.render({
                    elem: '#inTime' //指定元素
                });
            });
        </script>
        <!--离店日期-->
        <div class="form-group" style="margin-left: 5px;">
            <%if(ruzhu.equals("")){%>
                <input type="text" name="likai"  class="layui-input" placeholder="请选择日期" id="outTime" style="width:230px;border-radius: 4px;height: 35px">
            <%}else{%>
            <input type="text" name="likai"  class="layui-input" value="<%=likai%>" placeholder="请选择日期" id="outTime" style="width:230px;border-radius: 4px;height: 35px">
            <%}%>
        </div>
        <script>
            layui.use('laydate', function(){
                var laydate = layui.laydate;
                //执行一个laydate实例
                laydate.render({
                    elem: '#outTime' //指定元素
                });
            });
        </script>
        <!--人数-->
        <div class="form-group" style="margin-left: 5px;">
            <h4>人数</h4>
        </div>
        <div class="form-group" style="margin-left: 5px;">
            <select class="form-control" name="renshu"style="width: 100px;">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
        <%--<input type="hidden" id="methods" name="methods" value="queryLocation">--%>
        <input type="submit" class="btn btn-warning" value="查询">
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
    <%--地图模块    展开--%>
    <%if(locateInfoList.size() == 1){%>
        <%--信息&地图模块--%>
        <div id="mapDiv" style="height: 220px;">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div style="float: left;position: absolute;margin-top: 5px;width: 400px;">
                        <dl>
                            <div style="position: absolute;margin-top: 2px"><h5>区域:</h5></div>
                            <form class="form-inline" style="position: relative;float:left;margin-left: 45px;">
                                <%if(county == null || county.equals("suoyou")){%>
                                <div class="form-group" style="margin-left: 5px;">
                                    <a class="layui-font-orange" href="${pageContext.request.contextPath}/HotelServlet?methods=Class&county=suoyou&ye=1&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                                        <h5>全部</h5></a>
                                </div>
                                <%for (int i = 0;i < countyList.size();i++){%>
                                <div class="form-group" style="margin-left: 5px;">
                                    <a href="${pageContext.request.contextPath}/HotelServlet?methods=Class&county=<%=countyList.get(i)%>&ye=1&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                                        <h5><%=countyList.get(i)%></h5>
                                    </a>
                                </div>

                                <%}%>
                                <%}else{%>
                                <div class="form-group" style="margin-left: 5px;">
                                    <a href="${pageContext.request.contextPath}/HotelServlet?methods=Class&county=suoyou&ye=1&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                                    <h5>全部</h5></a>
                                </div>
                                <%for (int i = 0;i < countyList.size();i++){
                                    if(county.equals(countyList.get(i))){%>
                                <div class="form-group" style="margin-left: 5px;">
                                    <a class="layui-font-orange" href="${pageContext.request.contextPath}/HotelServlet?methods=Class&county=<%=countyList.get(i)%>&ye=1&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                                        <h5><%=countyList.get(i)%></h5>
                                    </a>
                                </div>
                                <%}else{%>
                                <div class="form-group" style="margin-left: 5px;">
                                    <a href="${pageContext.request.contextPath}/HotelServlet?methods=Class&county=<%=countyList.get(i)%>&ye=1&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                                        <h5><%=countyList.get(i)%></h5>
                                    </a>
                                </div>
                                <%}}}%>
                                </form>
                        </dl>
                        <dl>
                            <%--地方简介--%>
                            <div style="float: left;position: relative;margin-top: 40px;width: 400px;">
                                <div style="position: absolute;margin-top: 2px"><h5>简介:</h5></div>
                                <div style="position: relative;float:left;margin-left: 45px;">
                                    <h5><%=locateInfoList.get(0).getIntroduce()%></h5>
                                </div>
                            </div>
                        </dl>
                    </div>
                    <%--地图--%>
                    <div style="position: relative;margin-left: 420px;">
                    </div>

                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    <%}%>

    <%--酒店信息展示--%>
    <%--如果在景点表中查找到--%>
    <%if(locateInfoList.size() != 0){%>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
        <div style="width: 1200px; margin: 0 auto;">
            <%if(hotelInfoListClass != null){
                if(length != 1 && ye != length){
                    for(int i = 0;i < limite;i++){%>
            <div style="margin-top: 20px;height: 250px;width: 1000px;">
                <div  style="float: left;width: 300px;height: 216px;position: relative;margin-right: 20px;">
                    <a href="${pageContext.request.contextPath}/HotelServlet?methods=toViewHotel&hotelId=<%=hotelInfoListClass.get((ye-1)*15+i).getHotelId()%>&userId=<%=userId%>&overPicture=<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                        <img style="border-radius:10px;height: 200px;width: 280px;"
                             src="${pageContext.request.contextPath}/FreegoImg/mu/hotelPicture/overPicture/<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>.jpeg" alt="">
                        <%--<%System.out.println("图片"+hotelInfoListClass.get((ye-1)*15+i).getOverPicture());%>--%>
                    </a>
                </div>
                <div style="float: left;height: 250px;width: 300px;">
                    <dl><div style="float: left;position: absolute;">
                        <a href="${pageContext.request.contextPath}/HotelServlet?methods=toViewHotel&hotelId=<%=hotelInfoListClass.get((ye-1)*15+i).getHotelId()%>&userId=<%=userId%>&overPicture=<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                            <h3><%=hotelInfoListClass.get((ye-1)*15+i).getHotelName()%></h3></a></div></dl>
                    <dl><div style="float: left;position: relative;top:40px;left: 0px;">
                        <h6>电话:<%=hotelInfoListClass.get((ye-1)*15+i).getHotelTele()%></h6></div></dl>
                    <dl><div style="float: left;position: relative;top: 180px;">
                        <h6>地址:<%=hotelInfoListClass.get((ye-1)*15+i).getHotelAddress()%></h6></div></dl>
                </div>
                <div style="float: right;margin-top: 100px;">
                <%for(int k = 0;k < MapRoomList.get(hotelInfoListClass.get(i).getHotelId()).size();k++){
                roomList = MapRoomList.get(hotelInfoListClass.get(i).getHotelId());%>
                <div style="float: right;width: 300px;margin-top: 35px;">
                    <div style="float: left;position: absolute;">
                        <div class="layui-font-18"><%=roomList.get(k).getRoomName()%></div></div>
                    <div style="float: left;position: relative;margin-left: 60px;margin-top: 4px">
                        <div class="layui-font-orange layui-font-18"><%=roomList.get(k).getRoomPrice()%></div></div>
                </div>
                <hr style="width:150px;">
                <%}%>
                </div>
            </div>
            <hr class="layui-border-black"style="width: 950px;">
            <%}}else if(length != 1 && ye == length){
                for (int i = 0;i < hotelInfoListClass.size()-(ye-1)*limite;i++){%>
                <div style="margin-top: 20px;height: 250px;width: 1000px;">
                    <div style="float: left;width: 300px;height: 216px;position: relative;margin-right: 20px;">
                        <a href="${pageContext.request.contextPath}/HotelServlet?methods=toViewHotel&hotelId=<%=hotelInfoListClass.get((ye-1)*15+i).getHotelId()%>&userId=<%=userId%>&overPicture=<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                            <img style="border-radius:10px;height: 200px;width: 280px;"
                                 src="${pageContext.request.contextPath}/FreegoImg/mu/hotelPicture/overPicture/<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>.jpeg" alt="">
                        </a>
                    </div>
                    <div style="float: left;height: 250px;width: 300px;">
                        <dl><div style="float: left;position: absolute;">
                            <a href="${pageContext.request.contextPath}/HotelServlet?methods=toViewHotel&hotelId=<%=hotelInfoListClass.get((ye-1)*15+i).getHotelId()%>&userId=<%=userId%>&overPicture=<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                                <h3><%=hotelInfoListClass.get((ye-1)*15+i).getHotelName()%></h3></a></div></dl>
                        <dl><div style="float: left;position: relative;top:40px;left: 0px;">
                            <h6>电话:<%=hotelInfoListClass.get((ye-1)*15+i).getHotelTele()%></h6></div></dl>
                        <dl><div style="float: left;position: relative;top: 180px;">
                            <h6>地址:<%=hotelInfoListClass.get((ye-1)*15+i).getHotelAddress()%></h6></div></dl>
                    </div>
                    <div style="float: right;margin-top: 100px;">
                        <%for(int k = 0;k < MapRoomList.get(hotelInfoListClass.get(i).getHotelId()).size();k++){
                            roomList = MapRoomList.get(hotelInfoListClass.get(i).getHotelId());%>
                        <div style="float: right;width: 300px;margin-top: 35px;">
                            <div style="float: left;position: absolute;">
                                <div class="layui-font-18"><%=roomList.get(k).getRoomName()%></div></div>
                            <div style="float: left;position: relative;margin-left: 60px;margin-top: 4px">
                                <div class="layui-font-orange layui-font-18"><%=roomList.get(k).getRoomPrice()%></div></div>
                        </div>
                        <hr style="width:150px;">
                        <%}%>
                    </div>
                </div>
                <hr class="layui-border-black" style="width: 950px;">
            <%}}else if(length == 1){
                for (int i = 0;i < hotelInfoListClass.size();i++){
            %>
            <div style="margin-top: 20px;height: 250px;width: 1000px;">
                <div  style="float: left;width: 300px;height: 216px;position: relative;margin-right: 20px;">
                    <a href="${pageContext.request.contextPath}/HotelServlet?methods=toViewHotel&hotelId=<%=hotelInfoListClass.get((ye-1)*15+i).getHotelId()%>&userId=<%=userId%>&overPicture=<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                        <img style="border-radius:10px;height: 200px;width: 280px;"
                         src="${pageContext.request.contextPath}/FreegoImg/mu/hotelPicture/overPicture/<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>.jpeg" alt="">
                    </a>
                </div>
                <div style="float: left;height: 250px;width: 300px;">
                    <dl><div style="float: left;position: absolute;">
                        <a href="${pageContext.request.contextPath}/HotelServlet?methods=toViewHotel&hotelId=<%=hotelInfoListClass.get((ye-1)*15+i).getHotelId()%>&userId=<%=userId%>&overPicture=<%=hotelInfoListClass.get((ye-1)*15+i).getOverPicture()%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>">
                            <h3><%=hotelInfoListClass.get((ye-1)*15+i).getHotelName()%></h3></a></div></dl>
                    <dl><div style="float: left;position: relative;top:40px;left: 0px;">
                        <h6>电话:<%=hotelInfoListClass.get((ye-1)*15+i).getHotelTele()%></h6></div></dl>
                    <dl><div style="float: left;position: relative;top: 180px;">
                        <h6>地址:<%=hotelInfoListClass.get((ye-1)*15+i).getHotelAddress()%></h6></div></dl>
                </div>
                <div style="float: right;margin-top: 100px;">
                    <%for(int k = 0;k < MapRoomList.get(hotelInfoListClass.get(i).getHotelId()).size();k++){
                        roomList = MapRoomList.get(hotelInfoListClass.get(i).getHotelId());%>
                    <div style="float: right;width: 300px;margin-top: 35px;">
                        <div style="float: left;position: absolute;">
                            <div class="layui-font-18"><%=roomList.get(k).getRoomName()%></div></div>
                        <div style="float: left;position: relative;margin-left: 60px;margin-top: 4px">
                            <div class="layui-font-orange layui-font-18"><%=roomList.get(k).getRoomPrice()%></div></div>
                    </div>
                    <hr style="width:150px;" style="width: 950px;">
                    <%}%>
                </div>
            </div>
            <hr class="layui-border-black">
            <%}}else{%>
            <option value="空">空</option>
            <%}%>
        </div>
        </div>
        <div class="col-md-3"></div>
        <%}}%>
    </div>
    <%--页码--%>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <%
                //System.out.println("页："+ye);%>
            <%if(ye <= 3 && length <5){/*System.out.println("输出123-limite");*/
                for(int i = 1;i <= length;i++){%>
            <li><a href="${pageContext.request.contextPath}/LocationServlet?methods=updateFitInterface&ye=<%=i%>&county=<%=county%>&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>&mudidi=<%=mudidi%>"><%=i%></a></li>
            <%}}else if(ye <=3 && length >5){/*System.out.println("输出12345");*/
                for(int i = 1;i <= 5;i++){%>
            <li><a href="${pageContext.request.contextPath}/LocationServlet?methods=updateFitInterface&ye=<%=i%>&county=<%=county%>&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>&mudidi=<%=mudidi%>"><%=i%></a></li>
            <%}}else if(ye >3 && ye+2<length){/*System.out.println("输出ye-1 y1-2 ye ye+1 ye+2");*/
                for(int i = ye-2;i <= ye+2;i++){%>
            <li><a href="${pageContext.request.contextPath}/LocationServlet?methods=updateFitInterface&ye=<%=i%>&county=<%=county%>&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>&mudidi=<%=mudidi%>"><%=i%></a></li>
            <%}}else if(ye > 3 && ye +2>length){/*System.out.println("limite -1-2-3-4-5");*/
                for(int i = length-4;i <= length;i++){%>
            <li><a href="${pageContext.request.contextPath}/LocationServlet?methods=updateFitInterface&ye=<%=i%>&county=<%=county%>&userId=<%=userId%>&ruzhu=<%=ruzhu%>&likai=<%=likai%>&mudidi=<%=mudidi%>"><%=i%></a></li>
            <%}}%>
        </ul>
    </nav>
</body>
</html>
<%--<nav aria-label="Page navigation">
        <ul class="pagination">
            <%if(ye-1<1){%>
            <li class="disabled"><a href="LocationServlet?methods=updateFitInterface&ye=<%=1%>" aria-label="Previous">
                    <span aria-hidden="true">&raquo;</span>
                </a></li>
            <%}else{%>
            <li><a href="LocationServlet?methods=updateFitInterface&ye=<%=ye-1%>" aria-label="Previous">
                <span aria-hidden="true">&raquo;</span>
            </a></li>
            <%}%>
            <%if(ye + 5 <= length){
                if(ye-2>=1){
                    for(int i = ye-2;i <= ye+2;i++)
                    {%>
            <li><a href="LocationServlet?methods=updateFitInterface&ye=<%=i%>" onclick=""><%=i%></a></li>
            <%}%>
            <%}else{%>
            <%for (int i = 1;i <= 5;i++){ %>
            <li><a href="LocationServlet?methods=updateFitInterface&ye=<%=i%>" onclick=""><%=i%></a></li>
            <%}
            }
            }
            else{%>
            <%for(int i = ye-2;i <= length;i++){%>
            <li><a href="LocationServlet?methods=updateFitInterface&ye=<%=i%>"><%=i%></a></li>
            <%}
            }%>
            <%if(ye+1>length){%>
            <li class="disabled">
                <a href="LocationServlet?methods=updateFitInterface&ye=<%=length%>" aria-label="Next">
                    <span aria-hidden="true">&raquo</span>
                </a></li>
            <%}else{%>
            <li class="pagination">
                <a href="LocationServlet?methods=updateFitInterface&ye=<%=ye+1%>" aria-label="Next">
                    <span aria-hidden="true">&raquo</span>
                </a></li>
            <%}%>
        </ul>
    </nav>--%>