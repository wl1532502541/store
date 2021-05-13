<%@ page import="com.example.store.entity.User" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: wl
  Date: 2021/5/11
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理</title>
</head>
<body>
<!-- 顶部导航栏 -->
<%@include file="../components/nav.jsp"%>
    <div class="container" style="width:1300px;margin: 100px auto;min-height: 300px">
        <div class="title">
            <h2 style="border-top: 5px solid #3098F8;display:inline-block" >商品管理</h2>
            <%--<h6 style="display:inline-block">共有${sessionScope.cart==null?0:sessionScope.cart.size}件商品</h6>--%>
            <h6 style="display:inline-block">共有${sessionScope.cart==null?0:""}件商品</h6>
        </div>
        <div class="content" >

        </div>
    </div>
</body>
</html>
