<!DOCTYPE html>
<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商户登录页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/index.css">
</head>
<body>
<canvas class="cavs" width="1575" height="1337"></canvas>

<div class="loginmain">
    <div class="login-title">
        <span>商户登录</span>
        <div class="info" style="color: red">${msg}</div>
    </div>
    <form action="${pageContext.request.contextPath}/shops/login" method="post">
        <div class="login-con">

            <div class="login-user">
                <div class="icon">
                    <img src="${pageContext.request.contextPath}/static/layui/images/cd-icon-username.png" alt="">
                </div>
                <input type="text" name="shopsCode" placeholder="商户名" required autocomplete="off" value="${shopsCode}">
            </div>
            <div class="login-pwd">
                <div class="icon">
                    <img src="${pageContext.request.contextPath}/static/layui/images/cd-icon-password.png" alt="">
                </div>
                <input type="password" name="shopsPassword" placeholder="密码" required autocomplete="off" value="">
            </div>

            <div class="login-btn ">
                <input class="login" type="submit" value="登录">
<%--                <input class="register" type="submit" value="注册">--%>

                <a href="${pageContext.request.contextPath}/jsps/register.jsp" class="register">注册</a>
            </div>
        </div>
    </form>
</div>

</body>
</html>

<script src="${pageContext.request.contextPath}/static/layui/jquery.min.js"></script>·
<script src="${pageContext.request.contextPath}/static/layui/ban.js"></script>