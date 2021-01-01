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
<form class="layui-form layui-form-pane" style="margin-left: 50px">
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-inline">
            <input type="text" name="productName" autocomplete="off" placeholder="请输入商品名称" class="layui-input"
                value="${product.productName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品单价</label>
        <div class="layui-input-inline">
            <input type="text" name="productPrice" lay-verify="required" placeholder="请输入商品单价" autocomplete="off"
                   class="layui-input" value="${product.productPrice}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品单位</label>
        <div class="layui-input-inline">
            <input type="text" name="productUnit" lay-verify="required" placeholder="请输入商品单位" autocomplete="off"
                   class="layui-input" value="${product.productUnit}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品库存</label>
        <div class="layui-input-inline">
            <input type="text" name="inventory" lay-verify="required" placeholder="请输入商品库存" autocomplete="off"
                   class="layui-input" value="${product.inventory}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择商品类型</label>
        <div class="layui-input-inline">
            <select name="category">
                <c:forEach items="${cates}" var="cate">
                    <c:if test="${product.category == cate.id}">
                        <option value="${cate.id}" selected>${cate.category}</option>
                    </c:if>
                    <c:if test="${product.category != cate.id}">
                        <option value="${cate.id}">${cate.category}</option>
                    </c:if>

                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择商家</label>
        <div class="layui-input-inline">
            <select name="sid">
                <c:forEach items="${shops}" var="shop">
                    <option value="${shop.id}">${shop.shopsName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label ">商品描述</label>
        <div class="layui-input-block">
            <textarea name="description" placeholder="请输入内容" class="layui-textarea">${product.description}</textarea>
        </div>
    </div>
    <div class="layui-btn-container" style="margin-left: 90px;margin-top: 40px">
        <button lay-submit lay-filter="save" class="layui-btn">修改</button>
        <button type="button" class="layui-btn" id="cancel" style="margin-left: 70px">取消</button>
    </div>
    <input type="hidden" name="id" value="${product.id}">
</form>
</body>
</html>
<script type="text/javascript">
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
            $.ajax({
                url: pageUrl + '/product/updateProduct',
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

        });


        //点击取消按钮关闭弹层
        $("#cancel").click(function () {
            parent.layer.close(index);
        })
    });
</script>
