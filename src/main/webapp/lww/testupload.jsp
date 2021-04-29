<%--
  Created by IntelliJ IDEA.
  User: 李旺旺
  DateTime: 2021/4/28 16:24
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>

    <script>
        var imgdata = '';
        //选择文件
        function selectImage(obj){
            var f=$(obj).val();
            if(f == null || f ==undefined || f == ''){
                document.getElementById('image').src = "";
                $("#image").show();
                return false;
            }
            if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f)){
                alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
                $(obj).val('');
                return false;
            }
            imgdata = new FormData();
            $.each($(obj)[0].files,function(i,file){
                imgdata.append('file', file);
            });
            if(!file.files || !file.files[0]){
                return;
            }
            //将上传的图片显示到页面
            var reader = new FileReader();
            reader.onload = function(evt){
                $("#image").show();
                document.getElementById('image').src = evt.target.result;
                uploadfile = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        }
        var imageurl = "";
        //点击上传
        function importWeldingMachine() {
            var file = $("#file").val();
            $.ajax({
                type : "post",
                async : false,
                url : "/uploadFile",
                data : imgdata,
                cache : false,
                contentType : false, //不可缺
                processData : false, //不可缺,设置为true的时候,ajax提交的时候不会序列化 data，而是直接使用data
                dataType : "json", //返回数据形式为json
                success : function(result) {
                    result=JSON.parse(result);
                    if (result) {
                        if (!result.success) {
                            imageurl = "";
                            $.messager.show({title : 'Error',msg : result.errorMsg});
                        } else {
                            imageurl = result.imgurl;
                            //上传图片后，进行保存入库图片信息操作
                        }
                    }
                },
                error : function(errorMsg) {
                    alert("数据请求失败，请联系系统管理员!");
                }
            });
        }

    </script>

</head>
<body>
    <tr>
        <td class="tdstyle">上传图片：</td>
        <td>
            <img id="image" src=""  style="width: 300px; height: 200px;display: block;"/>
            <span><input type="file" name="file" id="file" onchange="selectImage(this);"></span>
            <button onclick="importWeldingMachine()">保存</button>
        </td>
    </tr>

</body>
</html>
