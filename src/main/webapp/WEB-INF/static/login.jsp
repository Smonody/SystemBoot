<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/6
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--导入vue.js-->
    <%--<script src="plugins/vue.min.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!--引入样式-->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <!--添加login.css-->
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <%--引入axios--%>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id = "loginBox">
    <div id = "box">
        <div id="title">
            <label>{{title}}</label>
        </div>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <input type="text" name="userName" id="username" v-model="username">
            <%--<span>{{username}}</span>--%>
            <input type="password" name="passWord" id = "password" v-model="password">
            <%--<span>{{password}}</span>--%>
            <h5>${msg}</h5>
            <input type="submit" value="登陆" id = "submitForm">
            <input type="reset" value="重置" id = "resetForm">
        </form>
    </div>
</div>

<%--<div id="login">
    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="账号" prop="username">
            <el-input type="text" v-model="ruleForm.username" autocomplete="off" id="username" name="username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="ruleForm.password" autocomplete="off" id="password" name="password"></el-input>
        </el-form-item>
        <!-- <el-form-item label="年龄" prop="age">
             <el-input v-model.number="ruleForm.age"></el-input>
         </el-form-item>-->
        <el-form-item>
            <div id = "login_btn">
                <el-button type="button" @click="submitForm('ruleForm')">提交</el-button>
            </div>
            <div id = "reset_btn">
                <el-button @click="resetForm('ruleForm')">重置</el-button>
            </div>
        </el-form-item>
    </el-form>
</div>--%>

<script src="js/login.js" type="text/javascript" rel="stylesheet"></script>
</body>
</html>
