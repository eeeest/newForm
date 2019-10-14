<%--
  Created by IntelliJ IDEA.
  User: eeeest
  Date: 2019/10/11
  Time: 下午9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <style type="text/css">
        body{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        .registered{
            margin-top: 400px;
            text-align: center;
        }
        #message{
            color: red;
        }
    </style>
</head>
<body>
    <form class="registered" action="${pageContext.request.contextPath}/registered.action" method="post" onsubmit="return check()">
        <h3>注册用户</h3>
        <p id="message">${msg}</p>
        <div>账号填写：<input type="text" name="username" id="username"></div>
        <div>密码填写：<input type="password" name="password" id="password1"></div>
        <div>确认密码：<input type="password" id="password2"></div>
        <div>生日填写：<input type="text" name="birthday" id="birthday"></div>
        (填写格式为：yyyy-mm-dd)
        <div>性别填写：
            <select name="sex">
                <option value="1">男</option>
                <option value="2">女</option>
            </select>
        </div>
        <div>电话填写：<input type="text" name="phone" id="phone"></div>
        <input type="submit" value="注册">
    </form>
</body>
</html>
<script type="text/javascript">
    function check() {
        var username=document.getElementById("username").value;
        var password1=document.getElementById("password1").value;
        var password2=document.getElementById("password2").value;
        var birthday=document.getElementById("birthday").value;
        var phone=document.getElementById("phone").value;

        var reg = /^(\d{4})-(\d{2})-(\d{2})$/;

        if (username==""||password1==""||password2==""||birthday==""||phone==""){
            alert("请输入完整信息！");
            return false;
        }
        if (password2!=password1){
            alert("确认密码输入不一致！")
            return false;
        }
        if (!reg.test(birthday) && RegExp.$2 <= 12 && RegExp.$3 <= 31){
            alert("请确保输入生日日期为yyyy-mm-dd");
            return false;
        }
        return true;
    }
</script>