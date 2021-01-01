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
<!--页面主题内容-->
<div class="layui-body ">
    <div class="layui-carousel" id="test10">
        <div carousel-item="">
            <div><img src="${pageContext.request.contextPath}/static/layui/images/1.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/2.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/3.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/4.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/5.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/6.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/7.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/8.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/9.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/10.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/11.jpg" class="banner"></div>
            <div><img src="${pageContext.request.contextPath}/static/layui/images/12.jpg" class="banner"></div>
        </div>
    </div>
    <!-- &lt;!&ndash; 内容主体区域 &ndash;&gt;
     <iframe src="https://www.baidu.com/" frameborder="0" height="100%" width="100%"></iframe>-->
</div>
<%--引入公共的底部部分--%>
<input type="hidden" id="handle_status">
<%@include file="/jsps/common/footer.jsp" %>
<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel
            , form = layui.form;

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            , interval: 1800
            , anim: 'fade'
            , height: '120px'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            , interval: 2000
            //, full: true
            , arrow: 'hover'
            ,width:'100%'
            ,height:"100%"
        });

        //监听开关
        form.on('switch(autoplay)', function () {
            ins3.reload({
                autoplay: this.checked
            });
        });
    });

</script>
