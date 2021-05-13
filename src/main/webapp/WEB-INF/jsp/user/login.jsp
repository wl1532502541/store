<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="/styles/login.css"/>
</head>
<body>
	<!-- 顶部导航栏 -->
	<%@ include file="../components/nav.jsp" %>
	<div class="background">
		<div class="loginForm">
			<form action="/user/login/handleSubmit" method="post">
				<input name="userName" type="text" placeholder="用户名" required>
				<input name="password" type="password" placeholder="密码" required>
				<button type="submit" >立即登录</button>
				<div class="errorMsg" style="color:red">
					<%=request.getParameter("errorMsg")!=null?"登陆失败":""%>
				</div>
			</form>
		</div>
	</div>
</body>
</html>