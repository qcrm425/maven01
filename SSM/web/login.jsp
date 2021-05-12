<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/5
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>登录大厅</h3>
    <form id="msg">
        <p>用户名：<input type="text" name="username"><span></span></p>
        <p>密码：<input type="text" name="password"><span></span></p>
        <span id="tip"></span>
        <p><input id="sb" type="button" value="登录"></p>
    </form>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        var rs = true;
        $("#sb").click(function(){
            rs = true;
            $(":text").blur();
            //通过验证
            if(rs){
                $.ajax({
                    url:"login.do?",
                    type:"post",
                    data:$("#msg").serialize(),
                    dataType:"text",
                    success:function(data){
                        if("true" == data){
                            $("#tip").css("color","red").html("登录成功！");
                            setTimeout(function(){
                                window.location.href = window.location.href + "/../afterLogin.jsp";
                            },1000);
                        }else{
                            $("#tip").css("color","red").html("用户名或密码错误");
                        }
                    },
                    error:function(){
                        alert("服务器错误")
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
        function isEmpty($self,value){
            if(value == "" || value == null){
                $self.next().css("color","red").html("内容不能为空");
                rs = false;
            }else{
                $self.next().html("");
            }
        }
    });
</script>
</html>
