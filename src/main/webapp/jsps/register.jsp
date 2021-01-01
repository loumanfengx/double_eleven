<!DOCTYPE html>
<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" language="java" isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商户注册页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/index.css">

    <script src="${pageContext.request.contextPath}/static/layui/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/ban.js"></script>
</head>
<body>
<canvas class="cavs" width="1575" height="1337"></canvas>
<div class="loginmain">
    <div class="login-title">
        <span>商户注册</span>
        <div class="info" style="color: red"></div>
    </div>
    <form action="${pageContext.request.contextPath}/shops/s/addShops" method="post" id="loginForm">
        <div class="login-con">

            <div class="login-user">
                <div class="icon">
                    <img src="${pageContext.request.contextPath}/static/layui/images/cd-icon-username.png" alt="">
                </div>
                <input type="text" name="shopsCode" id="shopsCode" placeholder="商户名" autocomplete="off" value="">
            </div>
            <div class="login-pwd">
                <div class="icon">
                    <img src="${pageContext.request.contextPath}/static/layui/images/cd-icon-password.png" alt="">
                </div>
                <input type="password" id="shopsPassword" name="shopsPassword" placeholder="请设置密码" autocomplete="off" value="">
            </div>
            <div class="login-pwd">
                <div class="icon">
                    <img src="${pageContext.request.contextPath}/static/layui/images/cd-icon-password.png" alt="">
                </div>
                <input type="password" id="verifyShopsPassword" name="verifyShopsPassword" placeholder="请确认密码" autocomplete="off" value="">
            </div>

            <div class="login-btn ">
                <input type="button" class="login" value="注册" id="btn">
<%--                <input class="register" type="submit" value="注册">--%>
<%--                <a href="www.baidu.com" class="register">注册</a>--%>
                <a href="${pageContext.request.contextPath}/jsps/login.jsp" class="register">取消</a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<script src="${pageContext.request.contextPath}/js/shops/register.js"></script>