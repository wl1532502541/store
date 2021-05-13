<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="/styles/register.css"/>
</head>
<body>
	<!-- 顶部导航栏 -->
	<%@ include file="../components/nav.jsp" %>
	<div class="background">
		<div class="registerForm">
			<form action="/user/register/handleSubmit" method="post">
				<input name="userName" type="text" placeholder="用户名" required>
				<input name="password1" type="password" placeholder="密码" required>
				<input name="password2" type="password" placeholder="确认密码" required>
				<button type="submit" onclick="return onRegister()">注册</button>
				<div class="errorMsg" style="color:red">
					<%=request.getParameter("errorMsg")!=null?"注册失败，该用户名已被占用":""%>
				</div>
			</form>
		</div>
	</div>
		<script>
			function onRegister(){
	            let inputs = document.getElementsByTagName("input");
	            if(inputs[1].value!=inputs[2].value){
	                alert("2次密码输入不一致")
	                return false;
	            }
	            return true;
	        }
		</script>
	</body>
</body>
</html>