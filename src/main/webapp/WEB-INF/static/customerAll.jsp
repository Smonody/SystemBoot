<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/5
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入el标识所需要的标签 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>客户管理界面</title>
    <script src="https://api.dyboy.cn/static/js/jquery.pjax.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!--导入vue.js-->
    <%--<script src="plugins/vue.min.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!--引入样式-->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <!--添加login.css-->
    <link rel="stylesheet" type="text/css" href="css/customerAdmin.css">
    <%--引入axios--%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

<div id = "container">
    <el-container style="height: 100%; border: 1px solid #eee">
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
            <el-menu :default-openeds="['1', '3']">
                <el-submenu index="1">
                    <template slot="title"><i class="el-icon-message"></i>导航一</template>
                    <el-menu-item-group>
                        <template slot="title">分组一</template>
                        <el-menu-item index="1-1">选项1</el-menu-item>
                        <el-menu-item index="1-2">选项2</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="分组2">
                        <el-menu-item index="1-3">选项3</el-menu-item>
                    </el-menu-item-group>
                    <el-submenu index="1-4">
                        <template slot="title">选项4</template>
                        <el-menu-item index="1-4-1">选项4-1</el-menu-item>
                    </el-submenu>
                </el-submenu>
                <el-submenu index="2">
                    <template slot="title"><i class="el-icon-menu"></i>导航二</template>
                    <el-menu-item-group>
                        <template slot="title">分组一</template>
                        <el-menu-item index="2-1">选项1</el-menu-item>
                        <el-menu-item index="2-2">选项2</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="分组2">
                        <el-menu-item index="2-3">选项3</el-menu-item>
                    </el-menu-item-group>
                    <el-submenu index="2-4">
                        <template slot="title">选项4</template>
                        <el-menu-item index="2-4-1">选项4-1</el-menu-item>
                    </el-submenu>
                </el-submenu>
                <el-submenu index="3">
                    <template slot="title"><i class="el-icon-setting"></i>导航三</template>
                    <el-menu-item-group>
                        <template slot="title">分组一</template>
                        <el-menu-item index="3-1">选项1</el-menu-item>
                        <el-menu-item index="3-2">选项2</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="分组2">
                        <el-menu-item index="3-3">选项3</el-menu-item>
                    </el-menu-item-group>
                    <el-submenu index="3-4">
                        <template slot="title">选项4</template>
                        <el-menu-item index="3-4-1">选项4-1</el-menu-item>
                    </el-submenu>
                </el-submenu>
            </el-menu>
        </el-aside>

        <el-container>
            <el-header style="text-align: right; font-size: 1rem; height: 2em" id = "elHeader">
                <el-dropdown>
                    <i class="el-icon-setting"><label id = "adminSet" style="width: 5em">管理设置</label></i>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item>
                            <div class="bottonBtn">
                                <el-button type="text" @click="dialogVisible = true" style = "width: 100px">删除用户</el-button>
                            </div>
                        </el-dropdown-item>
                        <el-dropdown-item>
                            <el-button type="text" @click="update = true" style = "width: 100px">修改用户</el-button>
                        </el-dropdown-item>
                        <el-dropdown-item>
                            <el-button type="text" @click="add = true" style = "width: 100px">添加用户</el-button>
                        </el-dropdown-item>
                        <el-dropdown-item>
                            <el-button type="text" @click="select = true" style = "width: 100px">查询用户</el-button>
                        </el-dropdown-item>
                        <el-dropdown-item><a href="${pageContext.request.contextPath}/logout">退出登录</a></el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
                <span>${USER_SESSION.userName}</span>
            </el-header>
            <el-main>
                <div id = "select" name = "select">
                    <%--todo 显示客户信息--%>
                    <h3 style="float: left">客户信息列表</h3>
                    <table id = "userTable">
                        <tr id = "tableTitle">
                            <td>编号</td>
                            <td>客户名称</td>
                            <td>客户来源</td>
                            <td>客户所属行业</td>
                            <td>客户级别</td>
                            <td>固定电话</td>
                            <td>手机</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${customer}" var="cus" varStatus="status">
                            <tr>
                                <td>${cus.id}</td>
                                <td>${cus.cusName}</td>
                                <td>${cus.cusFrom}</td>
                                <td>${cus.cusIndustry}</td>
                                <td>${cus.cusLevel}</td>
                                <td>${cus.cusFixedPhone}</td>
                                <td>${cus.cusPhone}</td>
                                <td>${cus.cusOperation}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </el-main>
            <el-dialog title="删除用户" :visible.sync="dialogVisible" style = "text-align: center">
                <div class="el-dialog__body" style="height: 5%;">
                    <div id = "delCustomer" style="float: left">
                        <%--todo 删除客户--%>
                        <form action="${pageContext.request.contextPath}/deleteCustomer" method="get">
                            <span>编号：</span><input type="number" name = "id">
                            <input type="submit" value="删除" id = "del">
                        </form>
                    </div>
                </div>
            </el-dialog>
            <el-dialog title="修改用户" :visible.sync="update" style = "text-align: center">
                <div class="el-dialog__body" style="height: 30%; width: 80%">
                    <div id = updateForm style="float: left">
                        <%--todo 修改客户信息--%>
                        <form action="${pageContext.request.contextPath}/updateCustomer" method="get">
                            <label>编号:</label><input type="number" name="id">
                            <label>客户名称:</label><input type="text" name="cusName" >
                            <label>客户来源:</label><input type="text" name="cusFrom">
                            <label>客户所属行业:</label><input type="text" name="cusIndustry" >
                            <label >客户级别:</label><input type="text" name="cusLevel">
                            <label>固定电话:</label><input type="text" name="cusFixedPhone">
                            <label>手机:</label><input type="text" name="cusPhone" >
                            <label>操作:</label><input type="text" name="cusOperation">
                            <div  style="margin-top: 8%;text-align: center">
                                <input type="submit" value="修改" style="margin-right: 10%">
                                <input type="reset" value="清空" style="float: right;margin-right: 15%">
                            </div>
                        </form>
                    </div>
                </div>
            </el-dialog>
            <el-dialog title="添加客户" :visible.sync="add" >
                <div class="el-dialog__body" style="height: 23%;width: 80%;">
                    <div id = "addCustomer" style="float: left">
                        <%--todo 添加客户--%>
                        <form action="${pageContext.request.contextPath}/addCustomer" method="get">
                            <label>客户名称:</label><input type="text" name="cusName">
                            <label>客户来源:</label><input type="text" name="cusFrom">
                            <label>客户所属行业</label><input type="text" name="cusIndustry">
                            <label>客户级别:</label><input type="text" name="cusLevel">
                            <label>固定电话:</label><input type="text" name="cusFixedPhone">
                            <label>手机:</label><input type="text" name="cusPhone">
                            <label>操作:</label><input type="text" name="cusOperation">
                            <div class = "buttonGroup">
                                <input type="submit" value="添加">
                            </div>
                        </form>
                    </div>
                </div>
            </el-dialog>
            <el-dialog title="查询用户" :visible.sync="select">
                <div class="el-dialog__body" style="height: 28%; width: 80%">
                    <div id = "selCustomer" style="float: left">
                        <%--todo 动态查询客户信息--%>
                        <form action="${pageContext.request.contextPath}/findCustomer" method="get" id = "selectForm" name = "selectForm">
                            <label>编号:</label><input type="number" name="id" id = "id">
                            <label>客户名称:</label><input type="text" name="cusName" id = "cusName">
                            <label>客户来源:</label><input type="text" name="cusFrom" id = "cusFrom">
                            <label>客户所属行业:</label><input type="text" name="cusIndustry" id = "cusIndustry">
                            <label>客户级别:</label><input type="text" name="cusLevel" id = "cusLevel">
                            <label>固定电话:</label><input type="text" name="cusFixedPhone" id = "cusFixedPhone">
                            <label>手机:</label><input type="text" name="cusPhone" id = "cusPhone">
                            <label>操作:</label><input type="text" name="cusOperation" id = "cusOperation">
                            <div style="margin-top: 8%;text-align: center">
                                <input type="submit" value="查询" style="margin-right: 10%">
                                <input type="button" value="测试Ajax加载" onclick="search()" style="float: right;margin-right: 15%">
                            </div>
                        </form>
                    </div>
                </div>
            </el-dialog>
        </el-container>
    </el-container>
</div>


<script src="js/customerAdmin.js" type="text/javascript" rel="stylesheet"></script>
<script type="text/javascript">
    function search() {
        var customer = $(selectForm).serializeArray();
        /*$.each(data, function(i, field){
           /!* $("#results").append(field.name + ":" + field.value + " ");*!/
            alert(field.value);
        });*/
       /* for(var key in data)
        {
            alert("Key是:" + key);
            alert("对应的值是:" + data[key]);
        }*/
       var id = customer[0].value;
       var cusName = customer[1].value;
        var cusFrom = customer[2].value;
        var cusIndustry = customer[3].value;
        var cusLevel = customer[4].value;
        var cusFixedPhone = customer[5].value;
        var cusPhone = customer[6].value;
        var cusOperation = customer[7].value;
        /*alert(customer);
        alert(id);*/
        $.ajax({
            type: 'POST',
            url: "${pageContext.request.contextPath}/action",
            data: {
                /*'id':id,
                'cusName':cusName,
                'cusFrom':cusFrom,
                'cusIndustry':cusIndustry,
                'cusLevel':cusLevel,
                'cusFixedPhone':cusFixedPhone,
                'cusPhone':cusPhone,
                'cusOperation':cusOperation*/
            },
            success: function (data) {
                /*load();*/
                /*var customer = JSON.stringify(data);
                var test = JSON.parse(customer);*/
                $('#select').load('${pageContext.request.contextPath}/findCustomer?id='+id+
                    '&&cusName='+cusName +
                    '&&cusFrom='+cusFrom+
                    '&&cusIndustry='+cusIndustry+
                    '&&cusLevel=' +cusLevel+
                    '&&cusFixedPhone='+cusFixedPhone+
                    '&&cusPhone='+cusPhone+
                    '&&cusOperation='+cusOperation);
            },
            dataType: "json"
        });
    }
</script>
</body>
</html>