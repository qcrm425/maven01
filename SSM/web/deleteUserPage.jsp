<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/6
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>请输入要删除用户信息</h3>
    <form>
        <input type="hidden" id="username" value="${sessionScope.user.userName}">
        <input type="hidden" id="password" value="${sessionScope.user.userPassword}">
        <p>用户名:<input type="text" name="username"><span></span></p>
        <p>密码:<input type="text" name="password"><span></span></p>
        <span id="msg"></span>
        <p>
            <input type="button" value="删除" id="delete">
            <input type="button" value="返回" id="return" onclick="window.location.href = window.location.href + '/../afterLogin.jsp'">
        </p>
    </form>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        var rs = true;
        $("#delete").click(function(){
            $("#msg").html("");
            rs = true;
            $(":text").blur();
            if(rs){
                $.ajax({
                    url:"deleteUser.do",
                    type:"post",
                    data:$("form").serialize(),
                    dataType:"text",
                    async:false,
                    success:function(data){
                        // 删除成功
                        if("ok" == data){
                            // 删除的是登录账号，注销登录
                            if($(":text:eq(0)").val() == $("#username").val() && $(":text:eq(1)").val() == $("#password").val()){
                                $("#msg").css("color","green").html("已删除正在登录账号！即将注销账号");
                                $("#delete").attr("disabled","disabled");
                                setTimeout(function(){
                                    window.location.href = window.location.href + "/../reLogin.do";
                                },1000);
                            }else{
                                $("#msg").css("color","green").html("删除成功！");
                                $(":text").val("");
                            }
                        }else{
                            $("#msg").css("color","red").html("删除失败！");
                        }
                    },
                    error:function(){
                        alert("服务器错误!")
                    }
                });
            }
        });
        // input输入空光标移除事件
        $(":text").blur(function(){
            // rs = true;
            isEmpty($(this),$(this).val());
        });
        // 检查非空
        function isEmpty(self,value){
            if(value == "" || value == null){
                $(self).next().css("color","red").html("内容不能为空");
                rs = false;
            }else{
                $(self).next().html("");
            }
        }
    });
</script>
</html>
