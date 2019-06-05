<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/1
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!-- 引入el标识所需要的标签 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1">
        <tr>
            <td>编号</td>
            <td>客户名称</td>
            <td>客户来源</td>
            <td>客户所属行业</td>
            <td>客户级别</td>
            <td>固定电话</td>
            <td>手机</td>
            <td>操作</td>
        </tr>

        <td>${customer.id}</td>
        <td>${customer.cusName}</td>
        <td>${customer.cusFrom}</td>
        <td>${customer.cusIndustry}</td>
        <td>${customer.cusLevel}</td>
        <td>${customer.cusFixedPhone}</td>
        <td>${customer.cusPhone}</td>
        <td>${customer.cusOperation}</td>

    </table>
</body>
</html>
