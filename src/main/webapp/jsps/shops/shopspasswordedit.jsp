<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/18
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>

</head>
<body>
<!-- 内容主体区域 -->
<form class="layui-form layui-form-pane" style="margin-left: 50px">

    <div class="layui-form-item">
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-inline">
            <input type="text" name="shopsPassword" id="shopsPassword" lay-verify="required" placeholder=""
                   autocomplete="off"
                   class="layui-input" value="">
        </div>
        <label class="" style="float: left;text-align: left;font-size: 12px;color: red;margin-top: 10px;" id="info"></label>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="text" name="newPassword" lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input" value="">
        </div>
        <label class="" style="float: left;text-align: left;margin-top: 10px;font-size: 12px;color: red" id="info1"></label>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input type="text" name="verifyPassword" lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input" value="">
        </div>
        <label class="" style="float: left;text-align: left;margin-top: 10px;font-size: 12px;color: red" id="info2"></label>
    </div>
    <input type="hidden" name="shopsCode" id="shopsCode" value="${session.shopsCode}">
    <div class="layui-btn-container" style="margin-left: 90px;margin-top: 40px">
        <button lay-submit lay-filter="save" class="layui-btn">修改</button>
        <button type="button" class="layui-btn" id="cancel" style="margin-left: 70px">取消</button>
    </div>
</form>
</body>
</html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/jquery-3.2.1.js"></script>

<%--修改密码时验证旧密码是否输入正确--%>
<script type="text/javascript">
    $(function () {
        var info = document.getElementById("info")
        var info1 = document.getElementById("info1")
        var info2 = document.getElementById("info2")
        var shopsCode = $("#shopsCode");
        var shopsPassword = $("#shopsPassword");
        var newPassword = $("#newPassword");
        var verifyPassword = $("#verifyPassword");
        var flag = true;
        //ajax验证用户修改密码时数据的旧密码是否正确
        $("#shopsPassword").blur(function () {
            $.ajax({
                url: pageUrl + "/shops/s/checkShopsPassword",
                type: "post",
                data: {shopsCode: shopsCode.val(), shopsPassword: shopsPassword.val(), newPassword: newPassword.val()},
                dataType: "json",
                async: true,
                success: function (data) {
                    if (data == 1) {
                        info.innerHTML = '';
                    } else if (data == 0 ) {
                        info.innerHTML = '旧密码不正确'
                        shopsPassword.select();
                        flag = false;
                    }
                }
            });
        });

        //laui部分
        var pageUrl = "${pageContext.request.contextPath}"
        layui.use(['form', 'layedit'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , $ = layui.jquery;
            //得到当前iframe层的索引
            var index = parent.layer.getFrameIndex(window.name);
            //form表单监听提交
            form.on('submit(save)', function (data) {
                if (data.field.newPassword != data.field.verifyPassword) {
                    info2.innerHTML = '两次输入密码不一致';
                    verifyPassword.select();
                    return false;
                } else {
                    info2.innerHTML = '';
                    //获取输入框中的值并转为json格式
                    //alert(JSON.stringify(data.field))
                    $.ajax({
                        url:  pageUrl+ '/shops/s/editShopsPassword',
                        data: data.field,//
                        dataType: "json",
                        async: true,
                        type: "post",
                        success: function (responstText) {
                            parent.$('#handle_status').val(responstText.success);
                            parent.layer.close(index);
                        }
                    });
                    return false;
                }

            });


            //点击取消按钮关闭弹层
            $("#cancel").click(function () {
                parent.layer.close(index);
            })
        });
    })


</script>





