<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: eeeest
  Date: 2019/10/12
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户</title>
    <style type="text/css">
        body{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        .userUpdate{
            margin-top: 400px;
            text-align: center;
        }
        #message{
            color: red;
        }
        .top-toolbar{
            width: 100%;
            height: 50px;
        }
        .hello{
            font-size: 20px;
            float: right;
        }
    </style>
</head>
<body>
<div class="top-toolbar">
    <div class="withme"></div>
    <div class="hello">你好：${USER.username}</div>
</div>
<form class="userUpdate" action="${pageContext.request.contextPath}/userUpdate.action" method="post" onsubmit="return check()">
    <input value="${user.id}" name="id" type="hidden">
    <h3>修改用户</h3>
    <p id="message">${msg}</p>
    <div>账号填写：<input type="text" name="username" id="username" value="${user.username}"></div>
    <div>生日填写：<input type="text" name="birthday" id="birthday" value="${user.birthday}"></div>
    (填写格式为：yyyy-mm-dd)
    <div>性别填写：
        <select name="sex">
            <option value="1" <c:if test="${user.sex==1}">selected="selected"</c:if>>男</option>
            <option value="2" <c:if test="${user.sex==2}">selected="selected"</c:if> >女</option>
        </select>
    </div>
    <div>电话填写：<input type="text" name="phone" id="phone" value="${user.phone}"></div>
    <input type="submit" value="确认修改">
</form>
</body>
</html>
<script type="text/javascript">
    function check() {
        var username=document.getElementById("username").value;
        var birthday=document.getElementById("birthday").value;
        var phone=document.getElementById("phone").value;

        var reg = /^(\d{4})-(\d{2})-(\d{2})$/;

        if (username==""||birthday==""||phone==""){
            alert("请输入完整信息！");
            return false;
        }
        if (!reg.test(birthday) && RegExp.$2 <= 12 && RegExp.$3 <= 31){
            alert("请确保输入生日日期为yyyy-mm-dd");
            return false;
        }
        return true;
    }
</script>