$(function () {
    //获取项目名
    var path = $("#path").val();
    var info = $(".info");
    var shopsCode = $("#shopsCode");
    var shopsPassword = $("#shopsPassword");
    var verifyShopsPassword = $("#verifyShopsPassword");
    var flag= true;
   //ajax验证创建的用户编码在数据库是否已存在
    $("#shopsCode").blur(function () {
        $.ajax({
            url: path + "/shops/s/checkShopsCode",
            type: "post",
            data: {shopsCode: shopsCode.val().trim()},
            dataType: "json",
            async: true,
            success: function (data) {
                if (data == 1) {
                    info.html("该商户名已存在");
                    shopsCode.select();
                    flag = false;
                } else if (data == 0) {
                    info.html("");
                }
            }
        });
    });
    //提交验证
    $("#btn").click(function () {
        //判断用户名框是否为空
        if (shopsCode.val().trim() == "") {
            info.html("请输入用户名")
            shopsCode.select();
            return false;
        }
        //判断确认密码框是否为空
        if (shopsPassword.val().trim() == "") {
            info.html("请输入密码");
            shopsPassword.select();
            return false;
        } else {
            info.html("");
        }
        //判断确认密码框是否为空
        if (verifyShopsPassword.val().trim() == "") {
            info.html("请输入密码");
            verifyShopsPassword.select();
            return false;
        } else {
            info.html("");
        }
        //判断两次输入的密码是否一致
        if (shopsPassword.val().trim() != verifyShopsPassword.val().trim()) {
            info.html("两次密码输入不一致")
            verifyShopsPassword.select();
            return false;
        }
        //所有判断均符合条件，提交表单
        $("#loginForm").submit();
    });
});