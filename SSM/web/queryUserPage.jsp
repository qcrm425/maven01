<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/6
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>请输入用户id</p>
    <form method="post" action="queryUserById.do">
        <p><input type="text" name="id" id="id"><span style="color: red">${error}</span></p>
        <p>
            <input type="submit" value="查询" id="query">
            <input type="button" value="返回" id="return" onclick="window.location.href = window.location.href + '/../afterLogin.jsp'">
        </p>
    </form>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        var rs = true;
        $("form").submit(function(){
            rs = true;
            $("#id").blur();
            return rs;
        });
        $("#id").blur(function(){
            isEmpty($(this));
            if(rs){
                if(!/^\d+$/.test($(this).val())){
                    $(this).next().css("color","red").html("必须输入数字！");
                    rs = false;
                }else{
                    $(this).next().html("");

                }
            }
        });
        function isEmpty($self){
            if("" == $self.val() || null == $self.val()){//text,date
                $self.next().css("color","red").html("内容不能为空");
                rs = false;
            }else{
                $self.next().html("");
            }
        }
    })
</script>
</html>
