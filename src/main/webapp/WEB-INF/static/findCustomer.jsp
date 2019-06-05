<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/8
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入el标识所需要的标签 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>查询到的用户</title>
    <link rel="stylesheet" type="text/css" href="css/customerAdmin.css">
</head>
<body>
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
    <c:forEach items="${select}" var="cus" varStatus="status">
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
<form action="${pageContext.request.contextPath}/findCustomerAll" method="get">
    <input type="submit" value="返回上一级">
</form>

</body>
</html>
