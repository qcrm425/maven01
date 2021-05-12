<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/6
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>ID:${info.id}</p>
    <p>编号:${info.userCode}</p>
    <p>用户名:${info.userName}</p>
    ${info.idPicPath}
    <p>头像：<img src="${info.idPicPath}"></p>
    <p><input type="button" value="返回" id="return" onclick="window.location.href = window.location.href + '/../queryUserPage.jsp'"></p>
</body>
</html>
