<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/6
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form enctype="multipart/form-data" method="post" id="upLoad">
        <p>用户编码：<input type="text" name="userCode"><span></span></p>
        <p>用户名称：<input type="text" name="userName"><span></span></p>
        <p>用户密码：<input type="text" name="userPassword" id="ps"><span></span></p>
        <p>确认密码：<input type="text" id="second"><span></span></p>
        <p>用户性别：<input type="text" name="gender" id="sex"><span></span></p>
        <p>出生日期：<input type="date" name="birthday"><span></span></p>
        <p>用户电话：<input type="text" name="phone"><span></span></p>
        <p>用户地址：<input type="text" name="address"><span></span></p>
        <p>用户角色：
            <select name="userRole"  id="roleList">
                <option id="notValue">请选择</option>
            </select>
            <span></span>
        </p>
        <p>
            上传图片:<input type="file" name="a_idPicPath" />
        </p>
        <span id="msg"></span>
    </form>
    <p id="notCheck"><input type="button" value="保存" id="save"><input type="button" value="返回" id="return" onclick="window.location.href = window.location.href + '/../afterLogin.jsp'"></p>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        var rs = true;
        $("#sex").blur(function(){
            rs = true;
            isEmpty($(this));
            if(rs){
                if(!/^[1-2]{1}$/.test($(this).val())){
                    $(this).next().css("color","red").html("必须是1-2的纯数字！");
                }
            }
        });
        $("#second").blur(function(){
            rs = true;
            isEmpty($(this));
            if(rs){
                if($(this).val() != $("#ps").val()){
                    $(this).next().css("color","red").html("和第一次输入不一致！");
                }else{
                    $(this).next().html("");
                }
            }
        });
        $("#save").click(function(){
            rs = true;
            $("input").blur();
            $("#roleList").change();
            var form = new FormData(document.getElementById("upLoad"));
            if(rs){
                alert("进来了")
                $.ajax({
                    url:"addUser.do",
                    type: "post",
                    processData:false,
                    contentType:false,
                    // async:false,
                    data:form,
                    dataType: "text",
                    success:function(data){
                        if("ok" == data){
                            $("#msg").html("");
                            alert("添加成功!");
                            window.location.href = window.location.href;
                        }else{
                            $("#msg").css("color","red").html("添加失败!");
                        }
                    }
                });
            }
        });
        init();
        function init(){
            $.ajax({
                url:"loadRole.do",
                type:"post",
                dataType:"json",
                success:function(data){
                    $.each(data,function(index,cur){
                        $("#roleList").append("<option value='" + cur.id + "'>" + cur.roleName + "</option>")
                    });
                },
                error:function(){
                    rs = false;
                    alert("服务器错误")
                }
            });
        }
        $("#roleList").on("change",function(){
            if($("option:selected",this).val() == "请选择"){
                $(this).next().css("color","red").html("内容不能为空");
                rs = false;
            }else{
                $(this).next().html("");
            }
        });
        $("input:not('#role'):not('#sex'):not('#second')").blur(function(){
            isEmpty($(this));
        });
        function isEmpty($self){
            if("" == $self.val() || null == $self.val()){//text,date
                $self.next().css("color","red").html("内容不能为空");
                rs = false;
            }else{
                $self.next().html("");
            }
        }
    });
</script>
</html>
