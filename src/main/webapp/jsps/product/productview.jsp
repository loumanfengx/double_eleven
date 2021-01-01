<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/20
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</head>
<body>
<!-- 内容主体区域 -->
<form class="layui-form layui-form-pane" style="margin-left: 50px">
    <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-inline">
            <input type="text" name="productCode" autocomplete="off" placeholder="" class="layui-input" readonly
                   value="${product.productCode}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-inline">
            <input type="text" name="productName" autocomplete="off" placeholder="" class="layui-input" readonly
                   value="${product.productName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品单价</label>
        <div class="layui-input-inline">
            <input type="text" name="productPrice" lay-verify="required" placeholder="" autocomplete="off" readonly
                   class="layui-input" value="${product.productPrice}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品单位</label>
        <div class="layui-input-inline">
            <input type="text" name="productUnit" lay-verify="required" placeholder="" autocomplete="off" readonly
                   class="layui-input" value="${product.productUnit}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品库存</label>
        <div class="layui-input-inline">
            <input type="text" name="inventory" lay-verify="required" placeholder="" autocomplete="off" readonly
                   class="layui-input" value="${product.inventory}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品类别</label>
        <div class="layui-input-inline">
            <input type="text" name="categorys" lay-verify="required" placeholder="" autocomplete="off" readonly
                   class="layui-input" value="${product.categorys.category}">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label ">商品描述</label>
        <div class="layui-input-block">
            <textarea name="description" placeholder="请输入内容" readonly class="layui-textarea">${product.description}</textarea>
        </div>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
    });
</script>
