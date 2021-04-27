<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/27 14:56
  Description:
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <style>
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;min-height: 400px;

        }
    </style>

</head>
<body>
    <p>container 和 toolbar 分开</p>
    <div>
        <div id="toolbar-container" class="toolbar"></div>
        <p>------ 我是分割线 ------</p>
        <div id="text-container" class="text"></div>
    </div>

    <%--引入 wangEditor.min.js --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lww/package/dist/wangEditor.min.js"></script>
    <script type="text/javascript">
        const E = window.wangEditor
        const editor = new E('#toolbar-container', '#text-container') // 传入两个元素
        // 配置菜单栏，设置不需要的菜单
        editor.config.excludeMenus = [
            'fontName',
            'italic',
            'strikeThrough',
            'indent',
            'lineHeight',
            'todo',
            'justify',
            'quote',
            'video',
            'code'
        ]
        editor.config.height = 400
        editor.config.placeholder = '请输入游记内容'
        // 设置 headers（举例）
        editor.config.uploadHeaders = {
            'Accept' : 'text/x-json'
        };
        editor.config.onchange = function (newHtml) {
            console.log('change 之后最新的 html', newHtml)
        }
        editor.config.uploadImgServer = 'http://localhost:8080/upload'          // 配置 server 接口地址
        editor.config.showLinkImg = false                                       //即可隐藏插入网络图片的功能
        editor.config.uploadImgAccept = ['jpg', 'jpeg', 'png']                  //限制图片类型
        editor.create()
    </script>

</body>
</html>