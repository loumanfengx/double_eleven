<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/16
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>商品交易系统</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/time.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

    <style>
        .banner {
            display: block;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

    </style>
</head>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">电商后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
       <%-- <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" id="systemTime"></li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/static/layui/images/7.jpg" class="layui-nav-img">
                    ${session.shopsName}
                </a>
                <dl class="layui-nav-child" style="text-align: center">
                    <dd><a href="javascript:;" id="shopsInfo">基本资料</a></dd>
                    <dd><a href="javascript:;" id="editPassword">密码修改</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/shops/logout">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">下拉菜单</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/jsps/product/productlist.jsp">商品管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/jsps/bill/billlist.jsp">订单管理</a></dd>
                       <%-- <dd><a href="javascript:;">商品采购</a></dd>--%>
                        <%--<dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <%--<li class="layui-nav-item">
                    <a href="javascript:;">订单模块</a>
                    <dl class="layui-nav-child">

                        &lt;%&ndash;<dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>&ndash;%&gt;
                    </dl>
                </li>--%>

            </ul>
        </div>
    </div>
    <%--点击查看资料执行出现弹出层--%>
    <script>
        var pageUrl = "${pageContext.request.contextPath}"
        layui.use(['layer', 'form'], function () {
            var layer = layui.layer;
            var form = layui.form;
            var $ = layui.jquery;
            var url, msg, size,urlnext;
            //定义一个弹出层触发函数
            function tanchuceng() {
                layer.open({
                    type: 2
                    , area: size
                    , title: msg
                    , content: [url, 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    , shade: 0.8
                    , end: function () {
                        var handle_status = $("#handle_status").val();
                        if (handle_status == '1') {
                            layer.msg(msg+'成功！', {
                                icon: 1,
                                time: 1000 //1秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                history.go(0);
                            });
                        } else if (handle_status == '0') {
                            layer.msg(msg+'失败！', {
                                icon: 2,
                                time: 2000 //1秒关闭（如果不配置，默认是3秒）
                            });
                        }
                    }
                });
            };
            //商户信息修改
            $('#shopsInfo').on('click', function () {
                url = pageUrl + '/jsps/shops/shopsinfo.jsp';
                msg = '商户信息修改';
                size = ['460px', '325px'];
                tanchuceng();
            });
            //商户密码修改
            $('#editPassword').on('click', function () {
                url = pageUrl + '/jsps/shops/shopspasswordedit.jsp';
                msg = '密码修改';
                size = ['480px', '310px'];
                layer.open({
                    type: 2
                    , area: size
                    , title: msg
                    , content: [url, 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    , shade: 0.8
                    , end: function () {
                        var handle_status = $("#handle_status").val();
                        if (handle_status == '1') {
                            layer.msg(msg+'成功！', {
                                icon: 1,
                                time: 1000 //1秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                window.location.href=pageUrl+"/jsps/login.jsp";
                            });
                        } else if (handle_status == '0') {
                            layer.msg(msg+'失败！', {
                                icon: 2,
                                time: 2000 //1秒关闭（如果不配置，默认是3秒）
                            });
                        }
                    }
                });

            });


        });
    </script>