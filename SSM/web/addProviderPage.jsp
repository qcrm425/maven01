<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/2
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <input type="hidden" id="result" value="<%=request.getAttribute("result")%>" />
    <form method="post" action="addProvider.do">
        <p>供应商编码:<input type="text" name="proCode" id="check"><span></span></p>
        <p>供应商名称:<input type="text" name="proName"><span></span></p>
        <p>联系人:<input type="text" name="proContact"><span></span></p>
        <p>联系电话:<input type="text" name="proPhone"><span></span></p>
        <p>联系地址:<input type="text" name="proAddress"><span></span></p>
        <p>传真:<input type="text" name="proFax"><span></span></p>
        <p>描述:<input type="text" name="proDesc"><span></span></p>
        <p>
            <input type="submit" value="保存" id="save">
            <input type="button" value="返回" id="return" onclick="window.location.href = window.location.href + '/../afterLogin.jsp'">
        </p>
    </form>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        init();
        //检测是否有处理结果
        function init (){
            // alert($("#result").val())
            if("finished" == $("#result").val()){
                alert("添加用户完成！");
            }else if("failed" == $("#result").val()){
                alert("添加用户失败！");
            }
        }
        var rs = true;
        var async = true;
        // 表单提交
        $("form").submit(function(){
            rs = true;
            async = false;
            $(":text").blur();
            //通过验证
            if(rs){
                return true;
            }else{
                return false;
            }
        });
        // 编号输入空光标移除事件
        $("#check").blur(function(){
            rs = true;
            // async = true;
            isEmpty($(this),$(this).val());
            if(rs){
                isExists($(this).attr("id"),$(this).val());
            }
        });
        // input输入空光标移除事件
        $(":text:not(#check)").blur(function(){
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
        // 检查数据库是否存在
        function isExists(id,proCode){
            $.ajax({
                url:"check.do?proCode=" + proCode,
                type:"get",
                async:async,
                dataType:"text",
                success:function(data){
                    if("exists" == data){
                        $("#" + id).next().css("color","red").html("输入的内容已存在");
                        rs = false;
                    }else{
                        $("#" + id).next().html("");
                    }
                },
                error:function () {
                    alert("服务器错误")
                }
            });
        }
    });
</script>
</html>
