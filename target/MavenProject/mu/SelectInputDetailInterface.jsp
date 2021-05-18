<%@ page import="java.util.List" %>
<%@ page import="domain.HotelInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.LocateInfo" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/20
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <title>Freego自驾游</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <style>
        body{text-align:center}
        /*最上面三个输入框*/
        #alignCenterOne{
            margin:0 auto;
            border:1px solid #FFFFFF;
            margin-top: 10px;
            height: 100px;
        }
        #divCenter{
            margin:0 auto;
            border:1px solid #FFFFFF;
            margin-top: 5px;
            text-align:left;
            height: 80px;
        }
    </style>
</head>
<body>
    <%List<HotelInfo> hotelInfoList = (List<HotelInfo>)session.getAttribute("hotelList");
        List<ScenicInfo> scenicInfoList = (List<ScenicInfo>)session.getAttribute("scenicList");
        List<LocateInfo> locateInfoList = (List<LocateInfo>)session.getAttribute("locateList");%>
    <!--第一部分  输入框部分-->
    <form class="form-inline" id = "alignCenterOne" method="post" action="/LocationServlet" >
        <!--出行目的地-->
        <div class="form-group" style="margin-left: 5px;">
            <input id="distination" name="mudidi"  type="text" class="form-control"  placeholder="出行目的地">
        </div>
        <!--入住日期-->
        <input type="text" name="ruzhu" class="demo-input" placeholder="请选择日期" id="inTime" style=" border-radius: 4px;height: 35px;">
        <script src="laydate/laydate.js"></script> <!-- 改成你的路径 -->
        <script>
            lay('#version').html('-v'+ laydate.v);

            //执行一个laydate实例
            laydate.render({
                elem: '#inTime' //指定元素
            });
        </script>
        <!--离店日期-->
        <input type="text" name="likai" class="demo-input" placeholder="请选择日期" id="outTime" style="border-radius: 4px;height: 35px">
        <script src="laydate/laydate.js"></script> <!-- 改成你的路径 -->
        <script>
            lay('#version').html('-v'+ laydate.v);
            //执行一个laydate实例
            laydate.render({
                elem: '#outTime' //指定元素
            });
        </script>
        <!--人数-->
        <div class="form-group" style="margin-left: 5px;">
            <h4>人数</h4>
        </div>
        <div class="form-group" style="margin-left: 5px;">
            <select class="form-control" name="renshu">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
        <input type="hidden" id="methods" name="methods" value="queryLocation">
        <input type="submit" class="btn btn-warning" value="查询">
    </form>
    <%--第二部分--%>
    <%--目的地--%>
    <%if(locateInfoList.size() != 0){%>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
           <%for(int i = 0;i < locateInfoList.size();i++){%>
                <div id="divCenter">
                    <h4>【目的地】<%=locateInfoList.get(i).getLocateName()%></h4>
                    <h5><%=locateInfoList.get(i).getIntroduce()%></h5>
                </div>
            <%}%>
        </div>
        <div class="col-md-3"></div>
    </div>
    <%}%>

    <%--景点--%>
    <%if(locateInfoList.size() != 0){%>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <%for(int i = 0;i < scenicInfoList.size();i++){%>
            <div id="divCenter">
                <h4>【目的地】<%=locateInfoList.get(i).getLocateName()%></h4>
                <h5><%=locateInfoList.get(i).getIntroduce()%></h5>
            </div>
            <%}%>
        </div>
        <div class="col-md-3"></div>
    </div>
    <%}%>
</body>
</html>
