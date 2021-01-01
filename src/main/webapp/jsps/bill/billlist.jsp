<%--
  Created by IntelliJ IDEA.
  User: Kangjh
  Date: 2020/10/19
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/jsps/common/header.jsp" %>
<div class="layui-body">
    <div style="margin-top: 20px;position: relative">
        <div class="demoTable">
            <div class="layui-form-item  layui-input-inline">
                <label class="layui-form-label" style="width: 56px;padding:9px 5px">用户名称</label>
                <div class="layui-input-inline" style="width: 130px">
                    <input type="text" name="userName" autocomplete="off" id="demoReload" placeholder="请输入用户名称"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-input-inline layui-form">
                <label class="layui-form-label" style="width: 56px;padding:9px 5px">是否付款</label>
                <div class="layui-input-inline" style="width: 100px">
                    <select name="isPayment" id="demoReload1">
                        <option value=""></option>
                        <option value="0">未付款</option>
                        <option value="1">已付款</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-input-inline ">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 56px;padding:9px 5px">开始时间</label>
                    <div class="layui-input-inline" style="width: 170px">
                        <input type="text" name="date1" id="date1" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-input-inline ">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 56px;padding:9px 5px">结束时间</label>
                    <div class="layui-input-inline" style="width: 170px">
                        <input type="text" name="date2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-input-inline layui-form">
                <label class="layui-form-label" style="width: 56px;padding:9px 5px">是否有效</label>
                <div class="layui-input-inline" style="width: 100px">
                    <select name="flag" id="flag">
                        <option value=""></option>
                        <option value="0">无效</option>
                        <option value="1">有效</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form" id="area-picker" style="position: relative;left: 110px">
                <div class="layui-form-label" style="width: 126px">用户地址:省/市/区</div>
                <div class="layui-input-inline" style="width: 200px;"><!--data-value="" 设定初始值-->
                    <select name="province" class="province-selector" data-value=" " lay-filter="province-1" id="province">
                        <option value="">请选择省</option>
                    </select>
                </div>
                <div class="layui-input-inline" style="width: 200px;">
                    <select name="city" class="city-selector" data-value=" " lay-filter="city-1" id="city">
                        <option value="">请选择市</option>
                    </select>
                </div>
                <div class="layui-input-inline" style="width: 200px;">
                    <select name="county" class="county-selector" data-value=" " lay-filter="county-1" id="district">
                        <option value="">请选择区</option>
                    </select>
                </div>
            </div>
            <div style="position: absolute;top: 30px;left:1120px">
                <button type="submit" class="layui-btn layui-btn-radius layui-btn-normal" data-type="reload">查询</button>
            </div>

        </div>
        <%-- <div style="position: absolute;top: 0;right: 30px">
             <button class="layui-btn layui-btn-radius layui-btn-normal" data-method="product" id="add">添加商品</button>
         </div>--%>
    </div>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="getCheckData">批量删除选中行数据</button>
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        </div>
    </script>
    <%--定义layui数据表格--%>
    <table class="layui-hide" id="demo" lay-filter="demo"></table>
</div>
<input type="hidden" id="handle_status">
<script type="text/html" id="barDemo">
    <%--data-method 为了触发弹出层--%>
    <a class="layui-btn layui-btn-edit layui-btn-xs" lay-event="detail" data-method="bill">查看订单详情</a>
    <%--<a class="layui-btn layui-btn-xs" lay-event="edit" data-method="product">编辑</a>--%>
    <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" data-method="product">删除</a>--%>
</script>
<script>
    //配置插件目录
    layui.config({
        base: '${pageContext.request.contextPath}/static/layui/mods/'
        , version: '1.0'
    });
    //一般直接写在一个js文件中
    layui.use(['layer', 'form', 'layarea'], function () {
        var layer = layui.layer
            , form = layui.form
            , layarea = layui.layarea;

        layarea.render({
            elem: '#area-picker',
            change: function (res) {
                //选择结果
                console.log(res);
            }
        });
    });
</script>
<script>
    var pageUrl = "${pageContext.request.contextPath}";
    layui.use(['table', 'layer', 'form', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        laydate = layui.laydate;
        var $ = layui.jquery;
        var url, msg, size, urlnext;
        //日期
        laydate.render({
            elem: '#date1'
            , type: 'datetime'

        });
        laydate.render({
            elem: '#date2'
            , type: 'datetime'

        });

        //渲染数据表格
        table.render({
            elem: '#demo'
            , url: '${pageContext.request.contextPath}/bill/findAll'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter']
            , parseData: function (res) {
                return {
                    "code": res.status, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.bill.total, //解析数据长度
                    "data": res.bill.list //解析数据列表
                }
            }
            , title: '订单数据表'
            , page: true
            , id: 'testReload'
            , limit: 8
            , limits:[8,16,24,32,40]
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {
                    field: 'id', title: 'ID', align: 'center', hide: true
                }
                , {field: 'orderId', title: '订单号', align: 'center',sort:true}
                , {
                    field: 'userName',
                    title: '用户名称',
                    sort: true,
                    align: 'center',
                    templet: '<div>{{d.user.userName}}</div>'
                }
                , {
                    field: 'address',
                    title: '用户地址',
                    sort: true,
                    align: 'center',
                    templet: '<div>{{d.user.address}}</div>'
                }
                , {field: 'phone', title: '用户电话', sort: true, align: 'center', templet: '<div>{{d.user.phone}}</div>'}
                , {field: 'totalPrice', title: '订单总额', sort: true, align: 'center'}
                , {
                    field: 'isPayment', title: '是否付款', sort: true, align: 'center', templet: function (d) {
                        if (d.isPayment == 1) {
                            return "已付款";
                        } else if (d.isPayment == 0) {
                            return "未付款";
                        }
                    }
                }
                , {
                    field: 'createTime',
                    title: '创建时间',
                    sort: true,
                    align: 'center',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
                }
                , {
                    field: 'totalPrice', title: '是否有效', sort: true, align: 'center', templet: function (d) {
                        if (d.flag == 0) {
                            return '<span style="color:red;">' + "无效" + '</span>';
                        } else {
                            return "有效"
                        }
                    }
                }



                /*, {field: 'inventory', title: '商品库存'}
                , {
                    field: 'category', title: '商品类别', //templet: function (d) {
                    /!*if (d.category == 1) {
                        return '零食酒饮';
                    } else if (d.category == 2) {
                        return '优选蔬菜';
                    }else if (d.category == 3) {
                        return '超级U选';
                    }
                }*!/
                }
                , {field: 'desc', title: '商品描述'}*/
                , {fixed: 'right', align: 'center', title: '操作', toolbar: '#barDemo'}

                /*, {field: 'gender', title: '性别', sort: true,templet:function (d) {
                        return d.gender == '2' ? '男' : '女';
                    }}*/
            ]]
            /*,done:function (res) {
                var data = res.data;
                var allck = true;
               /!* for (var item in data) {
                    alert(JSON.stringify(data))
                    /!*if (data[item].flag == 0) { //关键点如果data中score包含57那么就不能全选
                        alert(data[item].flag);
                        allck = false;
                    }*!/
                    //break;
                }*!/
                for (var i = 0; i < data.length; i++) {
                    if (data[i].flag == 0) {
                        $(".layui-table-header").find("input[name = 'layTableCheckbox'][lay-filter='layTableAllChoose']").each(function() {
                            $(this).attr("disabled", 'disabled').next().removeClass("layui-form-checked");
                            form.render('checkbox');
                        });
                        $(".layui-table-body.layui-table-main").find("input[name='layTableCheckbox']").each(function() {
                            if (res.data[i].score == 57) { //关键点如果当前行数据中score包含57那么就不可选
                                $(this).attr("disabled", 'disabled').removeAttr("checked");
                                form.render('checkbox');
                            }
                        });
                    }
                }

            }*/

        });
        //模糊查询、搜索查询（表格的重载）
        var $ = layui.$, active1 = {
            reload: function () {
                var demoReload = $('#demoReload');
                var demoReload1 = $('#demoReload1');
                var date1 = $('#date1');
                var date2 = $('#date2');
                var province = $('#province');
                var city = $('#city');
                var district = $('#district');
                /*if (date1.val() == "") {
                    date1 = date1.val("1901-01-01 00:00:00.0")
                }
                if (date2.val() == "") {
                    date2 = date2.val("2099-01-01 00:00:00.0")
                }*/
                var flag = $('#flag');
                //执行重载
                table.reload('testReload', {
                    url: '${pageContext.request.contextPath}/bill/findAll'
                    ,
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        userName: demoReload.val(),
                        isPayment: demoReload1.val(),
                        startTime: date1.val(),
                        endTime: date2.val(),
                        flag: flag.val(),
                        province:province.val(),
                        city : city.val(),
                        district : district.val()
                    }
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active1[type] ? active1[type].call(this) : '';
        });

        /* //多选操作
         var $ = layui.$, active1 = {
             getCheckData: function(){ //获取选中数据
                 var checkStatus = table.checkStatus('demo')
                     ,checkData = checkStatus.data;
                 //获取选中数量
                 var selectCount = checkStatus.data.length;
                 if(selectCount == 0){
                     layer.msg('批量删除至少选中一项数据',function(){});
                     return false;
                 }
                 /!* var arr = [];
                  for (var i = 0; i < checkData.length ; i++) {
                      arr.push(checkData[i].id);
                  }
                  var arrJson = JSON.stringify(arr)
                  *!/

                 //将选中的需要删除的id值用字符拼接
                 var isStr = "";

                 for (var i = 0; i < checkData.length; i++) {
                     if (i < checkData.length - 1) {
                         isStr += checkData[i].id + ",";
                     } else {
                         isStr += checkData[i].id;
                     }

                 }
                 layer.confirm('真的删除行么', function (index) {
                     layer.close(index);
                     $.ajax({
                         url: pageUrl + '/delProduct',
                         data: {'ids': isStr},//
                         dataType: "json",
                         async: true,
                         type: "post",
                         success: function (responstText) {
                             $('#handle_status').val(responstText.success);
                             layer.close(index);
                             var handle_status = $("#handle_status").val();
                             if (handle_status == '1') {
                                 layer.msg('删除商品信息成功！', {
                                     icon: 1,
                                     time: 1000 //1秒关闭（如果不配置，默认是3秒）
                                 }, function () {
                                     history.go(0);
                                 });
                             } else if (handle_status == '0') {
                                 layer.msg('删除商品信息失败！', {
                                     icon: 2,
                                     time: 2000 //1秒关闭（如果不配置，默认是3秒）
                                 });
                             }
                         }
                     });
                     return false;
                 });

             }
             ,getCheckLength: function(){ //获取选中数目
                 var checkStatus = table.checkStatus('idTest')
                     ,data = checkStatus.data;
                 layer.msg('选中了：'+ data.length + ' 个');
             }
             ,isAll: function(){ //验证是否全选
                 var checkStatus = table.checkStatus('idTest');
                 layer.msg(checkStatus.isAll ? '全选': '未全选')
             }
         };*/

        //头工具栏事件
        table.on('toolbar(demo)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var checkData = checkStatus.data;
                    // layer.alert(JSON.stringify(checkData));
                    //获取选中数量
                    var selectCount = checkStatus.data.length;
                    if (selectCount == 0) {
                        layer.msg('批量删除至少选中一项数据', function () {
                        });
                        return false;
                    }

                    //将选中的需要删除的id值用字符拼接
                    var isStr = "";

                    for (var i = 0; i < checkData.length; i++) {
                        if (i < checkData.length - 1) {
                            isStr += checkData[i].id + ",";
                        } else {
                            isStr += checkData[i].id;
                        }

                    }
                    layer.confirm('真的删除行么', function (index) {
                        layer.close(index);
                        $.ajax({
                            url: pageUrl + '/bill/delBill',
                            data: {'ids': isStr},//
                            dataType: "json",
                            async: true,
                            type: "post",
                            success: function (responstText) {
                                $('#handle_status').val(responstText.success);
                                layer.close(index);
                                var handle_status = $("#handle_status").val();
                                if (handle_status == '1') {
                                    layer.msg('删除商品信息成功！', {
                                        icon: 1,
                                        time: 1000 //1秒关闭（如果不配置，默认是3秒）
                                    }, function () {
                                        history.go(0);
                                    });
                                } else if (handle_status == '0') {
                                    layer.msg('删除商品信息失败！', {
                                        icon: 2,
                                        time: 2000 //1秒关闭（如果不配置，默认是3秒）
                                    });
                                }
                            }
                        });
                        return false;
                    });
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;

            }
            ;
        });
        //定义一个弹出层触发函数
        var active = {
            //'product:'为了触发弹出层
            bill: function () {
                layer.open({
                    type: 2
                    , area: size
                    , title: msg
                    , content: [url, 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    , shade: 0.8
                    , end: function () {
                        var handle_status = $("#handle_status").val();
                        if (handle_status == '1') {
                            layer.msg(msg + '成功！', {
                                icon: 1,
                                time: 1000 //1秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                history.go(0);
                            });
                        } else if (handle_status == '0') {
                            layer.msg(msg + '失败！', {
                                icon: 2,
                                time: 2000 //1秒关闭（如果不配置，默认是3秒）
                            });
                        }
                    }
                });

            }
        };
        /* //监听表格复选框选择
         table.on('checkbox(demo)', function (obj) {
             console.log(obj)
         });*/
        //监听工具条，执行查询，修改，删除操作
        table.on('tool(demo)', function (obj) {

            var data = obj.data;
            if (obj.event === 'detail') {
                url = pageUrl + '/bill/findBillInfo?bid=' + data.id;
                size = ['800px', '600px'];
                msg = '订单详情';
                //需要在点击按钮处添加data-method="product"属性，才会由此触发弹出层
                var othis = $(this), method = $(this).data('method');
                active[method] ? active[method].call(this) : '';
                // layer.msg('ID：' + data.id + ' 的查看操作');
            } else if (obj.event === 'edit') {
                //layer.alert('编辑行：<br>' + JSON.stringify(data));
                url = pageUrl + '/bill/updateBillInit?id=' + data.id;
                size = ['520px', '600px'];
                msg = '商品信息修改';
                var othis = $(this), method = $(this).data('method');
                active[method] ? active[method].call(this) : '';
            }
        });

        $("#add").on('click', function () {
            url = pageUrl + '/bill/addBillInit';
            size = ['500px', '590px'];
            msg = '添加商品';
            //需要在点击按钮处添加data-method="product"属性，才会由此触发弹出层
            var othis = $(this), method = $(this).data('method');
            active[method] ? active[method].call(this) : '';
        });

    });

</script>

<%@include file="/jsps/common/footer.jsp" %>
