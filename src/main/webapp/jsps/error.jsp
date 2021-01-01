<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>错误提示</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <style>
        .layui-icon-face-cry a {
            color: darkorange;
        }
        .layui-icon-face-cry span a:hover {
            color: purple;
        }

    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"> 后台管理布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->


    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

        </div>
    </div>

    <div class="layui-body ">
        <i class="layui-icon layui-icon-face-cry" style="font-size: 130px;position: absolute;top: 200px;left: 280px;"><span style="font-size: 30px">登录信息已失效 &nbsp&nbsp&nbsp&nbsp<a href="${pageContext.request.contextPath}/jsps/login.jsp">重新登录</a></span></i>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <div class="layui-footer " style="text-align: center">
            后台管理系统
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>