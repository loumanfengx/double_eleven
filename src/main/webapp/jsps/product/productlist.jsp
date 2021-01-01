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
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="productName" autocomplete="off" id="demoReload" placeholder="请输入商品名称"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-input-inline layui-form">
                <label class="layui-form-label">商品类型</label>
                <div class="layui-input-inline">
                    <select name="category" id="demoReload1">
                        <option value=""></option>
                        <option value="1">零食酒饮</option>
                        <option value="2">优选蔬菜</option>
                        <option value="3">超级U选</option>
                        <option value="4">海鲜肉禽</option>
                        <option value="5">乳饮果汁</option>
                        <option value="6">居家优品</option>
                        <option value="7">超值套餐</option>
                        <option value="8">潮玩礼品</option>
                        <option value="9">冷冻速食</option>
                        <option value="10">海鲜冻品</option>
                        <option value="11">粮油干货</option>
                        <option value="12">环球美食</option>
                        <option value="13">年货礼盒</option>
                        <option value="14">热销爆款</option>
                        <option value="15">缤纷水果</option>

                    </select>
                </div>
            </div>
            <div style="position: absolute;top: 0;left:706px">
                <button type="submit" class="layui-btn layui-btn-radius layui-btn-normal" data-type="reload">查询</button>
            </div>
        </div>
        <div style="position: absolute;top: 0;right: 30px">
            <button class="layui-btn layui-btn-radius layui-btn-normal" data-method="product" id="add">添加商品</button>
        </div>
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
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" data-method="product">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit" data-method="product">编辑</a>
    <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" data-method="product">删除</a>--%>
</script>
<script>
    var pageUrl = "${pageContext.request.contextPath}";
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        var url, msg, size, urlnext;
        //渲染数据表格
        table.render({
            elem: '#demo'
            , url: '${pageContext.request.contextPath}/product/findAll'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter']
            , parseData: function (res) {
                return {
                    "code": res.status, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.product.total, //解析数据长度
                    "data": res.product.list //解析数据列表
                }
            }
            , title: '用户数据表'
            , page: true
            , id: 'testReload'
            , limit: 10
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID',hide:true}
                , {field: 'productCode', title: '商品编号',align: 'center'}
                , {field: 'productName', title: '商品名称',align: 'center'}
                , {field: 'productPrice', title: '商品单价',align: 'center'}
                , {field: 'inventory', title: '商品库存',align: 'center'}
                , {field: 'productUnit', title: '商品单位',align: 'center'}
                , {field: 'category', title: '商品类别',align: 'center', templet: '<div>{{d.categorys.category}}</div>'}

                    /*templet: function (d) {if (d.category == 1) {
                        return '零食酒饮';
                    } else if (d.category == 2) {
                        return '优选蔬菜';
                    }else if (d.category == 3) {
                        return '超级U选';
                    }
                }*/

                , {field: 'description', title: '商品描述',align: 'center'}
                , {field: 'pic', title: '商品图片',align: 'center',templet:'<div><img src="{{d.pic}}" style="width:150px;height:150px"></div>'}
                , {fixed: 'right', align: 'center', title: '操作', toolbar: '#barDemo'}

                /*, {field: 'gender', title: '性别', sort: true,templet:function (d) {
                        return d.gender == '2' ? '男' : '女';
                    }}*/
            ]]

        });
        //模糊查询、搜索查询（表格的重载）
        var $ = layui.$, active1 = {
            reload: function () {
                var demoReload = $('#demoReload');
                var demoReload1 = $('#demoReload1');
                //执行重载
                table.reload('testReload', {
                    url: '${pageContext.request.contextPath}/product/findAll'
                    ,
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        productName: demoReload.val(),
                        category: demoReload1.val()

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
                    var idSer = "";
                    var picStr = "";
                    for (var i = 0; i < checkData.length; i++) {
                        if (i < checkData.length - 1) {
                            idSer += checkData[i].id + ",";
                            picStr += checkData[i].pic + ",";
                        } else {
                            idSer += checkData[i].id;
                            picStr += checkData[i].pic;
                        }

                    }

                    layer.confirm('真的删除行么', function (index) {
                        layer.close(index);
                        $.ajax({
                            url: pageUrl + '/product/delProduct',
                            data: {'ids': idSer,'pics': picStr},//
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
            product: function () {
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
                url = pageUrl + '/product/findProductInfo?id=' + data.id;
                size = ['500px', '520px'];
                msg = '查看信息';
                //需要在点击按钮处添加data-method="product"属性，才会由此触发弹出层
                var othis = $(this), method = $(this).data('method');
                active[method] ? active[method].call(this) : '';
                // layer.msg('ID：' + data.id + ' 的查看操作');
            } else if (obj.event === 'edit') {
                //layer.alert('编辑行：<br>' + JSON.stringify(data));
                url = pageUrl + '/product/updateProductInit?id=' + data.id;
                size = ['520px', '600px'];
                msg = '商品信息修改';
                var othis = $(this), method = $(this).data('method');
                active[method] ? active[method].call(this) : '';
            }
        });

        $("#add").on('click', function () {
            url = pageUrl + '/product/addProductInit';
            size = ['900px', '650px'];
            msg = '添加商品';
            //需要在点击按钮处添加data-method="product"属性，才会由此触发弹出层
            var othis = $(this), method = $(this).data('method');
            active[method] ? active[method].call(this) : '';
        });

    });

</script>

<%@include file="/jsps/common/footer.jsp" %>
