<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/5
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入el标识所需要的标签 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>restfulTest</title>
    <%--${pageContext.request.contextPath}/WEB-INF/static/plugins/jquery.pjax.js--%>
    <%--<script src="${pageContext.request.contextPath}/WEB-INF/static/plugins/jquery-3.0.0.min.js"></script>--%>
    <script src="https://api.dyboy.cn/static/js/jquery.pjax.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
    <form>
        编号：<input type="text" name="number" id="number">
        密码：<input type="text" name="password" id="password">
        <input type="button" value="查询" onclick="search()">
        <input type="button" value="引用" onclick="load()">
    </form>
    <div id = "page" style="width: 500px;height: 500px">

    </div>
    <script type="text/javascript">
       function search() {
            //获取输入的查询编号
           /*var id = $("input:text").val();*/
           var id = $("#number").val();
           alert(id);
            $.ajax({
                url: "${pageContext.request.contextPath}/user/"+id,
                type: "GET",
                //定义回调响应的数据格式为JSON字符串，该属性可以省略
                dataType: "json",
                //成功响应的结果
                success: function (data) {
                    if(data.cusName!= null){
                        alert("您查询的用户是："+data.cusName);
                        load();
                    }else{
                        alert("没有找到id为："+id+"的用户！");
                    }
                }
            })
        }
        function load() {
            $('#page').load('${pageContext.request.contextPath}/index.jsp');
        }
    </script>
</body>
</html>
