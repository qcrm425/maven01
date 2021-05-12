<%--
  Created by IntelliJ IDEA.
  User: 15993354374
  Date: 2021/5/7
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form>
        <p>用户名：<input type="text" name="user"><span></span></p>
        <p>或</p>
        <p>用户角色：<select name="roleId"></select></p>
    </form>
    <p>
        <input type="button" value="查询" id="query">
        <input type="button" value="返回" onclick="window.location.href = window.location.href + '/../afterLogin.jsp'">
    </p>
    <div id="show"></div>
    <div id="bottom-button"></div>
    <input type="hidden" id="curPageNo">
    <input type="hidden" id="pageSize">

</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    $(function(){
        var rs = true;
        queryAjax = function (begin,size){
            rs = true;
            $(":text").blur();
            if(rs){
                $("#show").empty();
                $.ajax({
                    url:"limitQuery.do",
                    type:"post",
                    async:false,
                    data:$("form").serialize() + "&begin=" + begin + "&size=" + size,
                    dataType: "json",
                    success:function(data){
                        $.each(data.elements,function(index,cur){
                            $("#show").append("<p>用户名:" + cur.userName + "&nbsp;密码：" + cur.userPassword + "<input id='" + cur.id + "' type='button' value='修改' style='margin-left:10px;'></p>");
                        });
                        $("#show>p>input").click(function(){
                            window.location.href = window.location.href + "/../changeUserPage.jsp?userId=" + $(this).attr('id');
                        });
                        $("#curPageNo").val(data.begin);
                        $("#pageSize").val(data.pageSize);
                    },
                    error:function(){
                        alert("服务器错误!")
                    }
                });
            }
        };
        $("#query").click(function(){
            //清空全部跳转按钮
            $("#bottom-button").empty();
            //同步的，不跳转页面请求数据和分页信息
            queryAjax(1,5);
            //动态生成跳转按钮
            var temp = "<p>";
            for(var i = 1;i <= parseInt($("#pageSize").val());i++){
                temp += "<span style='border: black 1px solid;margin-left: 10px;' onclick='queryAjax(" + i + ",5)'>" + i + "</span>";
            }
            temp += "</p>";
            //进行填充页面
            $("#bottom-button").append(temp);
        });

        $(":text").blur(function(){
            isEmpty($(this));
        });
        function isEmpty($self){
            if($self.val() == "" || $self.val() == null){
                $self.next().css("color","red").html("用户不得为空！");
                rs = false;
            }else{
                $self.next().html("");
            }
        }
        function init(){
            $.ajax({
                url:"loadRole.do",
                type:"post",
                dataType:"json",
                success:function(data){
                    $.each(data,function(index,cur){
                        $("select").append("<option value='" + cur.id + "'>" + cur.roleName + "</option>");
                    });
                },
                error:function(){
                    alert("服务器错误!")
                }
            });
        }
        init();
    });
</script>
</html>
