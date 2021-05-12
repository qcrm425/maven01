<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/8
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--    修改用户的ID：${param.userId}--%>
    <h3>修改页面</h3>
    <form>
        <input type="hidden" name="id" value="${param.userId}">
        <p>用户名：<input type="text" name="userName"><span></span></p>
        <p>用户密码：<input type="text" name="userPassword"><span></span></p>
        <p>
            <input type="button" value="更新" id="update">
            <input type="button" value="返回" onclick="history.go(-1)">
        </p>
    </form>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    var rs = true;
    $("#update").click(function(){
        rs = true;
        $(":text").blur();
        if(rs){
            $.ajax({
                url:"changeUser.do",
                type:"post",
                data:$("form").serialize(),
                dataType:"text",
                success:function(data){
                    if ("ok" == data){
                        alert("修改成功！");
                        $(":text").val("");
                        if($("input[name='id']").val() == ${sessionScope.user.id}){
                            alert("当前登录账号已修改，请重新登陆！");
                            window.location.href = "${pageContext.request.contextPath}/reLogin.do";
                        }
                    }else{
                        alert("修改失败!");
                    }
                },
                error:function(){
                    alert("服务器错误!")
                }
            });
        }
    });
    $(":text").blur(function(){
        isEmpty($(this));
    });
    function isEmpty($self){
        if($self.val() == "" || $self.val() == null){
            $(this).next().css().html("不能为空！");
            rs = false;
        }else{
            $(this).next().html("");
        }
    }
</script>
</html>
