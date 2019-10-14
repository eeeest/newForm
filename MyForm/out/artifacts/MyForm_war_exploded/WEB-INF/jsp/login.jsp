<%--
  Created by IntelliJ IDEA.
  User: eeeest
  Date: 2019/10/11
  Time: 下午8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆页面</title>
    <style type="text/css">
        body{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        .loginForm{
            margin-top: 400px;
            text-align: center;
        }
        #message{
            color: red;
        }
    </style>
</head>
<body>
    <form class="loginForm" action="${pageContext.request.contextPath}/login.action" method="post" onsubmit="return check()">
        <h3>登陆用户</h3>
        <p id="message">${msg}</p>
        <div>账号：<input type="text" name="username" id="username"></div>
        <div>密码：<input type="password" name="password" id="password"></div>
        <div>
            <input type="submit" value="登陆" name="login">
            没有账号？请先<a href="${pageContext.request.contextPath}/toRegistered.action">注册</a>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function check() {
        var username=document.getElementById("username").value;
        var password=document.getElementById("password").value;
        if (username==""||password==""){
            alert("请输入账号以及密码");
            return false;
        }
        return true;
    }
</script>