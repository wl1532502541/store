<%@ page import="com.example.store.entity.User" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="/styles/nav.css"/>
<div class="navwl">
	<ul style="list-style:none">
		<li>
			<a href="/user/logout">退出</a>
		</li>
		<% if(session.getAttribute("user")==null){ %>
			<li><a href="/user/register">注册</a></li>
			<li><a href="/user/login">登录</a></li>
			<li>
				您好，请先
			</li>
		<%}else { %>
			<%if(((User)session.getAttribute("user")).getIsAdmin()!=null&&(Boolean)(((User)session.getAttribute("user")).getIsAdmin())==true) {%>
				<li><a href="/admin/trade">订单管理</a></li>
				<li><a href="/admin/goods">商品管理</a></li>
				<li><a href="/admin/category">分类管理</a></li>
				<li>欢迎，尊贵的鞋店拥有者 <%=((User)session.getAttribute("user")).getName() %><li>
			<%}else {%>
				<li><a href="/user/cart"><img style="width: 20px;height: 20px" src="/pics/cart-empty.png">购物车</a></li>
				<li><a href="/user/ucenter/index">个人中心</a></li>
				<li>欢迎，普通用户 <%=((User)session.getAttribute("user")).getName() %><li>
			<%}%>
		<%} %>
		<li style="float: left;margin-left: 2%">
			<a href="/">首页</a>
		</li>
	</ul>
</div>