<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>鞋店</title>
	<!-- <link type="text/css" rel="stylesheet" href="other/css/style.css"/> -->
	<link type="text/css" rel="stylesheet" href="/styles/index.css"/>
	<style type="text/css">
		label{
			position: relative;
		}
		label input{
			width: 0;
		}
		input~div{
			display:none;
			position:absolute;
			width: 200px;
			background-color:#3098F8;
			top: 30px;
		}
		input:checked~div{ /* ~ 所有相邻兄弟选择器*/
			display: block;
		}
		input:checked+span{	/* + 下一个相邻兄弟选择器*/
			display:inline-block;
			border-bottom: 3px solid #3098F8;
		}
	</style>
</head>
<body>
	<!-- 顶部导航栏 -->
	<%@ include file="components/nav.jsp" %>
	<%--<% session.setAttribute("errorMsg",null);%>--%>
	<h1 style="text-align:center">欢迎光临本鞋店</h1>
	<%=pageContext.findAttribute("123")%>
	<%=((User)(pageContext.findAttribute("123"))).getName()%>
	<SELECT name="select" onchange="window.open(this.options[this.selectedIndex].value,target='_self')">
		<OPTION value='file1.htm' selected>网址1</OPTION>
		<OPTION value='file2.htm'>网址2</OPTION>
		<OPTION value='file3.htm'>网址3</OPTION>
	</SELECT>
	<div class="wrap">
		<label>
			<input type="radio" name="tab" checked>
			<span>home</span>
			<div>home-page</div>
		</label>
		<label>
			<input type="radio" name="tab">
			<span>list</span>
			<div>list-page</div>
		</label>
		<label>
			<input type="radio" name="tab">
			<span>news</span>
			<div>news-page</div>
		</label>
		<label>
			<input type="radio" name="tab">
			<span>mine</span>
			<div>mine-page</div>
		</label>
	</div>

<script>
</script>
</body>
</html>