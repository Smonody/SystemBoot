<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/10
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>restfulPost</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/user" method="post">
    <input type="text" name="UserName" id = "UserName"/>
    <input type="text" name="PassWord" value="PassWord"/>
    <input type="submit" value="提交"/>
</form>
</body>
</html>
