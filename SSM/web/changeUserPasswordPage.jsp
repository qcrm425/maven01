<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/5
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form>
        <p>旧密码：<input type="text" name="old" id="check"><span></span></p>
        <p>新密码：<input type="text" name="newPassword" id="self"><span></span></p>
        <p>确认密码：<input type="text" name="second" id="again"><span></span></p>
        <span id="msg"></span>
        <p><input type="button" value="保存" id="sb"><input type="button" value="返回" id="return" onclick="window.location.href = window.location.href + '/../afterLogin.jsp'"></p>
    </form>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        var rs = true;
        var async = true;
        // 提交保存
        $("#sb").click(function(){
            rs = true;
            async = false;
            $(":text").blur();
            if(rs){
                $.ajax({
                    url: "changeUserPassword.do",
                    type: "post",
                    async:async,
                    data: "newPassword=" + $("#self").val(),
                    dataType: "text",
                    success:function(data){
                        if("ok" == data){
                            // 重新登录
                            $("#msg").css("color","green").html("修改成功！<br>请重新登录");
                            $("#sb").attr("disabled","disabled");
                            $("#return").attr("disabled","disabled");
                            setTimeout(function(){
                                window.location.href = window.location.href + "/../reLogin.do";
                            },1000);
                        }else{
                            $("#msg").css("color","red").html("修改成功！");
                        }
                    },
                    error:function(){
                        alert("服务器错误")
                    }
                });
            }
        });
        // 用户旧密码输入空光标移除事件
        $("#check").blur(function(){
            rs = true;
            isEmpty($(this),$(this).val());
            if(rs){
                isExists($(this).attr("id"),$(this).val());
            }
        });
        // 检查数据库是否存在
        function isExists(id,password){
            $.ajax({
                url:"checkUserPassword.do",
                type:"post",
                async:async,
                data:"old=" + password,
                dataType:"text",
                success:function(data){
                    if("exists" == data){
                        $("#" + id).next().css("color","green").html("输入正确");
                    }else{
                        $("#" + id).next().css("color","red").html("输入密码不存在!");
                        rs = false;
                    }
                },
                error:function () {
                    alert("服务器错误")
                }
            });
        }
        // 重复密码输入空光标移除事件
        $("#again").blur(function(){
            rs = true;
            isEmpty($(this),$(this).val());
            if(rs){
                if($(this).val() != $("#self").val()){
                    $(this).next().css("color","red").html("输入密码第一次输入不一致!");
                }
            }else{
                $(this).next().html("输入密码不能为空");
            }
        });
        // input输入空光标移除事件
        $(":text:not('#again')").blur(function(){
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
