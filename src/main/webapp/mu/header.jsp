<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/9 19:46
  Description: 头部
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="js/getParameter.js"></script>


<head>
    <script type="text/javascript">
        function change_div(id){
            if (id == 'gsywly' )
            {
                document.getElementById("gsgs").style.display = 'none' ;
                document.getElementById("gsywly").style.display = 'block' ;
            }
            else
            {
                document.getElementById("gsywly").style.display = 'none' ;
                document.getElementById("gsgs").style.display = 'block' ;
            }
        }
    </script>

    <style type="text/css">
        #gsywly {
            display:none;
        }
    </style>
</head>

<body>
<div id="button">
    <ul>
        <li id="a"><a href="#" onclick="change_div('gsgs')">公司概述</a></li>
        <li id="b"><a href="#" onclick="change_div('gsywly')">公司业务领域</a></li>
    </ul>
</div>
<div id="gsgs">
    <h2>公司概述</h2>
</div>
<div id="gsywly" >
    <h2>公司业务领域</h2>
</div>
</body>
