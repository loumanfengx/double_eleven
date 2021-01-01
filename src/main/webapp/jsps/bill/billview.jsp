<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/20
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</head>
<body>
<!-- 内容主体区域 -->
<table class="layui-table"  lay-data="{width: 800, height:500, page:true,limit:5,limits:[5,10,15,20,25,30,35,40], id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{field:'id',align:'center', sort: true, fixed: true}">商品编号</th>
        <th lay-data="{field:'productName',align:'center', }">商品名称</th>
        <th lay-data="{field:'productPrice',align:'center',sort: true}">商品单价</th>
        <th lay-data="{field:'productCount',align:'center',  }">购买数量</th>
        <th lay-data="{field:'productUnit',align:'center',  }">商品单位</th>
        <th lay-data="{field:'category',align:'center',   sort: true}">商品类别</th>
        <th lay-data="{field:'description', align:'center',}">商品描述</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${product}" var="product">
            <tr>
                <td>${product.productCode}</td>
                <td>${product.productName}</td>
                <td>${product.productPrice}</td>
                <td>${product.productCount}</td>
                <td>${product.productUnit}</td>
                <td>${product.categorys.category}</td>
                <td>${product.description}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
<script>
    layui.use('table', function() {
        var table = layui.table;
        //监听表格复选框选择
        /*table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });*/
    });
</script>
</html>
