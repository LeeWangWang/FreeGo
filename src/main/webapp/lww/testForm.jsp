<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/29 15:46
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lww/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/lww/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/lww/js/jquery-3.3.1.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->

    <style>
        .layui-form{
            width: 620px;
            height: 200px;
            margin: auto;
        }
        .form-confirm{
            text-align: center;
        }
        .layui-form-pane .layui-form-label{
            width: 135px;
        }
        .layui-form-pane .layui-input-block{
            margin-left: 135px;
        }
        .layui-form-item .layui-inline{
            width: 280px;
            margin: 10px;
        }
    </style>

</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>最终效果</legend>
</fieldset>

<form class="layui-form layui-form-pane" action="">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">出发时间</label>
            <div class="layui-input-block">
                <input type="text" name="date" lay-verify="date" id="input_date" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">人物</label>
            <div class="layui-input-block">
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
            <label class="layui-form-label">出行天数</label>
            <div class="layui-input-block">
                <input type="text" name="day" lay-verify="day" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">人均花费/RMB</label>
            <div class="layui-input-block">
                <input type="text" name="cost" lay-verify="cost" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item form-confirm">
        <button class="layui-btn submit-btn" lay-submit="" lay-filter="add">确定</button>
    </div>
</form>

<div class="layerBtn-b display-flex-right position-f">
    <button class="cursor layui-layer-btn0">确定</button>
    <button class="cursor layui-layer-btn1">取消</button>
</div>

<script>
    $('.layui-layer-btn0').on('click',function(){
        /*form.on('submit(add)',function(data){
            console.log(data);
        });*/
        $('.submit-btn').trigger('click');
    });

</script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#input_date'
        });

        //自定义验证规则
        form.verify({
            data: function (value) {
                if (value == ""){
                    return '请选择出发时间'
                }
            }
            ,day: function (value) {
                var reg_test = /^[0-9]*$/;
                var flag = reg_test.test(value);
                if (!flag || value == "") {
                    return '出行天数必须是数字'
                }
            }
            ,cost: function (value) {
                var reg_test = /^[0-9]*$/;
                var flag = reg_test.test(value);
                if (!flag || value == "") {
                    return '人均花费必须是数字'
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>

</body>
</html>