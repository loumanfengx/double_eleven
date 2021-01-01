<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/17
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
</head>
<body>
<!-- 内容主体区域 -->
<form class="layui-form layui-form-pane" style="margin-left: 50px">
    <div class="layui-form-item">
        <label class="layui-form-label">商户名称</label>
        <div class="layui-input-inline">
            <input type="text" name="shopsName" autocomplete="off" placeholder="请输入标题" class="layui-input"
                   value="${session.shopsName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商户账号</label>
        <div class="layui-input-inline">
            <input type="text" name="shopsCode" lay-verify="required" placeholder="请输入" autocomplete="off" readonly
                   class="layui-input" value="${session.shopsCode}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商户电话</label>
        <div class="layui-input-inline">
            <input type="text" name="phone" lay-verify="required|phone" placeholder="" autocomplete="off"
                   class="layui-input" value="${session.phone}">
        </div>
    </div>
    <input type="hidden" name="id" value="${session.id}">
    <div class="layui-btn-container" style="margin-left: 80px;margin-top: 50px">
        <button lay-submit lay-filter="save" class="layui-btn">修改</button>
        <button lay-type="button" class="layui-btn" id="cancel" style="margin-left: 70px">取消</button>
    </div>
</form>
</body>

</html>


<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    var pageUrl = "${pageContext.request.contextPath}"
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , $ = layui.jquery;
        //得到当前iframe层的索引
        var index = parent.layer.getFrameIndex(window.name);
        //日期控件样式设置
        laydate.render({
            elem: '#birthday'
            , trigger: 'click'
            , showBottom: false
        });

        //form表单监听提交
        form.on('submit(save)', function (data) {
            //获取输入框中的值并转为json格式
            //alert(JSON.stringify(data.field))
            $.ajax({
                url: pageUrl + '/shops/s/editShopsInfo',
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
       /* $("#cancel").click(function () {
            parent.layer.close(index);
        })*/
        $("#cancel").on('click',function () {
            parent.layer.close(index);
        })
    });

</script>

