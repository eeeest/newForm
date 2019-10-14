<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>首页</title>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        .center{
            margin-top: 200px;
            text-align: center;
        }
        .userForm{
            margin-top: 20px;
        }
        .form{
            margin-top: 10px;
        }
        .hid{
            display: none;
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
    <div class="center">
        <p id="message">${msg}</p>
        <div class="search">
            <form action="${pageContext.request.contextPath}/selectUserByParam.action" method="get">
                <h3>主页</h3>
                用户名：<input type="text" name="username" placeholder="请输入用户名">
                <input type="submit" value="查询">
            </form>
            <a href="${pageContext.request.contextPath}/toRegistered.action" methods="post">添加用户</a>
        </div>

        <div class="userForm">
            <c:forEach items="${userList}" var="user">
                <div class="form">
                    <div>用户名：${user.username}</div>
                    <div>生日：${user.birthday}</div>
                    <div>性别：<c:if test="${user.sex==1}">男</c:if>
                                <c:if test="${user.sex==2}">女</c:if>
                    </div>
                    <div>电话${user.phone}</div>
                    <div>
                        <a href="${pageContext.request.contextPath}/toUserUpdate.action?id=${user.id}" methods="get">修改</a>
                        <a href="${pageContext.request.contextPath}/userdelete.action?id=${user.id}" methods="get">删除</a>
                    </div>
                    <div class="hid" id="id">用户ID：${user.id}</div>
                    <div class="hid">用户密码：${user.password}</div>
                    <p>-----------------</p>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
</script>
