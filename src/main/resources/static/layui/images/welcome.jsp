<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/14
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--引入公共的头部部分--%>
<%@include file="/jsps/common/header.jsp" %>

<!--页面内容-->
<div class="layui-body"><fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>填充轮播元素 - 以图片为例</legend>
</fieldset>
    <div class="layui-carousel" id="test10" style="left: 100px">
        <div carousel-item="">
            <div><img src="${pageContext.request.contextPath}/static/layui/images/1.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/2.jpg" class="banner"></div>
            <div><img  src="${pageContext.request.contextPath}/static/layui/images/3.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/4.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/5.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/6.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/7.jpg" class="banner"></div>
        </div>
    </div>
    <!-- &lt;!&ndash; 内容主体区域 &ndash;&gt;
     <iframe src="https://www.baidu.com/" frameborder="0" height="100%" width="100%"></iframe>-->
</div>
<%--引入公共的底部部分--%>

<%@include file="/jsps/common/footer.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user/welcome.js"></script>
