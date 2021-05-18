<%@ page import="domain.HotelInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="static dao.impl.QueryLike.queryLike" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <title>查看酒店</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/mu/css/MainMFWCss.css"></script>

    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lww/css/index.css">
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/getParameter.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/mu/layui/css/layui.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/mu/layui/layui.js"></script>

    <script type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/mu/css/recommendCss/recommendOne.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/mu/css/recommendCss/recommendTwo.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/mu/js/recommendJs/tuijianOne.js" type="text/javascript" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/mu/js/recommendJs/tuijianTwo.js" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/mu/js/recommendJs/tuijianThree.js" crossorigin="anonymous"></script>
</head>
<body style="position: relative">
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
                <a href="${pageContext.request.contextPath}/lww/login.jsp">登录</a>
                <a href="${pageContext.request.contextPath}/lww/register.jsp">注册</a>
            </div>
        </div>
    </div>
</div>

<%Map<String,List<HotelInfo>> returnMap = (Map<String, List<HotelInfo>>)session.getAttribute("returnMap");
    Iterator<Map.Entry<String,List<HotelInfo>>> it = returnMap.entrySet().iterator();
    /*System.out.println(returnMap.size());*/
    String userId = (String)session.getAttribute("userId");
%>

<%--广告--%>
<div class="hotel-main">
    <div class="h-title">订酒店</div>

    <form class="form-inline" name="myForm" style="margin-top: 30px" id = "alignCenterOne" method="post" action="/LocationServlet?methods=queryLocation&userId=<%=userId%>" >
        <!--出行目的地-->
        <div class="form-group" style="margin-left: 5px;">
            <input id="distination" name="mudidi" style="width: 300px;" type="text" class="form-control"  placeholder="出行目的地">
        </div>
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
    <div class="h-notice clearfix" style="margin-top: 20px;">
        <ul>
            <li>
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                    <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
                </svg>
                <div class="flt1">
                    <h2>住宿攻略</h2>
                    <p>区域攻略到特色主题，应有尽有</p>
                </div>
            </li>
            <li>
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                </svg>
                <div class="flt1">
                    <h2>专享价格</h2>
                    <p>多平台价格对比，天天专享特惠</p>
                </div>
            </li>
            <li>
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px" width="40" height="40" fill="currentColor" class="bi bi-envelope-open" viewBox="0 0 16 16">
                    <path d="M8.47 1.318a1 1 0 0 0-.94 0l-6 3.2A1 1 0 0 0 1 5.4v.818l5.724 3.465L8 8.917l1.276.766L15 6.218V5.4a1 1 0 0 0-.53-.882l-6-3.2zM15 7.388l-4.754 2.877L15 13.117v-5.73zm-.035 6.874L8 10.083l-6.965 4.18A1 1 0 0 0 2 15h12a1 1 0 0 0 .965-.738zM1 13.117l4.754-2.852L1 7.387v5.73zM7.059.435a2 2 0 0 1 1.882 0l6 3.2A2 2 0 0 1 16 5.4V14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5.4a2 2 0 0 1 1.059-1.765l6-3.2z"/>
                </svg>
                <div class="flt1">
                    <h2>真实点评</h2>
                    <p>超过100万真实用户点评和游记</p>
                </div>
            </li>
        </ul>
    </div>



    <%--推荐酒店--%>
    <div class="h-theme" id="_j_features">
        <div class="h-title" style="margin-top: 50px;">主题住宿</div>
        <div class="tab-theme">
            <div class="themeList clearfix _j_tab_trigger">
                <%int tagNum = 0;
                    while(it.hasNext()){
                        tagNum++;
                        Map.Entry<String,List<HotelInfo>> entry = it.next();
                        String tag = entry.getKey();%>
                <%if(tagNum == 1){%>
                <a href="javascript:;" data-id="<%=tagNum-1%>" class="on"><%=tag%></a>
                <%}else{%>
                <a href="javascript:;" data-id="<%=tagNum-1%>"><%=tag%></a>
                <%}}%>
            </div>
            <div class="_j_tab_content">
                <%
                    //System.out.println("过来了1");
                    Iterator<Map.Entry<String,List<HotelInfo>>> itTwo = returnMap.entrySet().iterator();
                    int num = 0;
                    while(itTwo.hasNext()){
                        //System.out.println("!");
                        num++;
                        Map.Entry<String,List<HotelInfo>> entry = itTwo.next();
                        String tag = entry.getKey();
                        List<HotelInfo> value = entry.getValue();
                        System.out.println("key:"+entry.getKey()+"  key:"+entry.getValue());
                %>
                <ul class="clearfix" style="" data-id="<%=num-1%>">
                    <% //System.out.println("有"+value.size()+"张图片");
                        for(int i = 0;i < value.size();i++){%>
                    <li>
                        <div class="fc-item" style="transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);">
                            <a href="${pageContext.request.contextPath}/HotelServlet?methods=toViewHotel&hotelId=<%=value.get(i).getHotelId()%>&userId=<%=userId%>&overPicture=<%=value.get(i).getOverPicture()%>&ruzhu=&likai=" target="_blank" data-type="mdd">
                                <div class="pic">
                                    <img style="width:318px;height:240px;"
                                         src="${pageContext.request.contextPath}/FreegoImg/mu/hotelPicture/overPicture/<%=value.get(i).getOverPicture()%>.jpeg"
                                         class="img-show" width="318" height="240">
                                </div>
                                <div class="bag-opa"></div>
                                <span class="shadow" style="background-image: linear-gradient(45deg, rgba(0, 0, 0, 0.4), transparent 40%);"></span>
                                <div class="info">
                                    <h2><%=value.get(i).getHotelName()%></h2>
                                    <p class="caption"><%=value.get(i).getDowntown()%></p>
                                </div>
                            </a>
                        </div>
                    </li>
                    <%}%>
                </ul>
                <%}%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
