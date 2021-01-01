<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/20
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/jquery-3.2.1.js"></script>
</head>
<body>
<!-- 内容主体区域 -->
<form class="layui-form layui-form-pane" style="margin-left: 50px">
    <div class="layui-form-item" style="display: inline-block">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-inline">
            <input type="text" id="productCode" name="productCode" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
        </div>
        <span id="info" style="position: relative;top: 10px;color: red"></span>
    </div>
    <div class="layui-form-item" style="display: inline-block;margin-left: 180px">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-inline">
            <input type="text" id="productName" name="productName" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
        </div>

    </div>
    <div class="layui-form-item" style="display: inline-block">
        <label class="layui-form-label">商品单价</label>
        <div class="layui-input-inline" >
            <input type="text" name="productPrice" lay-verify="required|number" placeholder="请输入商品单价" autocomplete="off"
                   class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" style="display: inline-block;margin-left: 180px">
        <label class="layui-form-label">商品单位</label>
        <div class="layui-input-inline">
            <input type="text" name="productUnit" lay-verify="required" placeholder="请输入商品单位" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: inline-block">
        <label class="layui-form-label" >商品库存</label>
        <div class="layui-input-inline">
            <input type="text" name="inventory" lay-verify="required|number" placeholder="请输入商品库存" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: inline-block;margin-left: 180px">
        <label class="layui-form-label">选择商品类型</label>
        <div class="layui-input-inline">
            <select name="category">
                <c:forEach items="${cates}" var="cate">
                    <option value="${cate.id}">${cate.category}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item" style="display: inline-block">
        <label class="layui-form-label">选择商家</label>
        <div class="layui-input-inline">
            <select name="sid">
                <c:forEach items="${shops}" var="shop">
                    <option value="${shop.id}">${shop.shopsName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-upload" style="display: inline-block;margin-left: 180px">
        <button type="button" class="layui-btn" id="test1">上传图片</button>
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="demo1" style="height: 100px;width: 100px">

            <p id="demoText"></p>
        </div>
        <input type="hidden" name="pic" id="pic">
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label ">商品描述</label>
        <div class="layui-input-block">
            <textarea name="description" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-btn-container" style="margin-left: 90px;margin-top: 40px">
        <button lay-submit lay-filter="save" class="layui-btn">添加</button>
        <button type="button" class="layui-btn" id="cancel" style="margin-left: 430px">取消</button>
    </div>

</form>
</body>
</html>
<%--验证商品编号是否存在--%>
<script type="text/javascript">
    $("#productCode").blur(function () {
        var productCode = $(this).val();
        $.ajax({
            url: '${pageContext.request.contextPath}/product/findAll',
            type:'post',
            data:{productCode:productCode.trim()},
            dataType: "json",
            async: true,
            success:function (data) {
                if (data.msg == 1) {
                    $("#info").html("该商品编号已存在！");
                    $("#productCode").select();
                } else {
                    $("#info").html("");
                }
            }
        })
    })
</script>
<script type="text/javascript">
    //laui部分
    var pageUrl = "${pageContext.request.contextPath}"
    layui.use(['form', 'layedit','upload'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , $ = layui.jquery
            ,upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: pageUrl + '/test' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                } else {
                    $("#pic").val(res.fileName);
                }
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        //得到当前iframe层的索引
        var index = parent.layer.getFrameIndex(window.name);
        //form表单监听提交
        form.on('submit(save)', function (data) {
            $.ajax({
                url: pageUrl + '/product/addProduct',
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
