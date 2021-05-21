<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>您的潮趣鞋店</title>
	<link type="text/css" rel="stylesheet" href="/styles/index.css"/>
	<link type="text/css" rel="stylesheet" href="/styles/reset.css"/>
	<link type="text/css" rel="stylesheet" href="/styles/common.css"/>
	<style>
		#container{
			/*width:590px;*/
			height:470px;
			margin:0 auto;
			/*margin-top: 60px;*/
			position: relative;
		}
		#container>#imgs{
			position: absolute;
		}
		#container>#imgs>li{
			list-style: none;
			/*float: left;*/
			display: none;
		}
		#container>#imgs>li img{
			width:100%;
			max-height: 475px;
		}
		#container>#imgs>li.active{
			display: block;
		}
		#container>#circles{
			width: 152px;
			height: 18px;
			position: absolute;
			left: 46px;
			bottom: 20px;
			display: flex;
			justify-content: space-around;
			align-items: center;
		}
		#container>#circles>li{
			list-style: none;
			width: 14px;
			height: 14px;
			border-radius: 50%;
			background: #fff;
		}
		#container>#circles>li.active{
			background: red;
		}
		#container>div.arrow{
			width: 24px;
			height: 40px;
			position: absolute;
			margin-top: -20px;
			background: rgba(0,0,0,.2);
			font-size: 20px;
			color: #fff;
			line-height: 40px;
			text-align: center;
			user-select: none;
			cursor: pointer;
		}
		#container>div.arrow:hover{
			background: rgba(0,0,0,.5);
		}
		#container>div#left{
			top: 50%;
			left: 0;
		}
		#container>div#right{
			top: 50%;
			right: 0;
		}
	</style>
</head>
<body>
	<!-- 顶部导航栏 -->
	<%@ include file="components/nav.jsp" %>
	<!-- header+nav2 -->
	<%@ include file="components/header+nav2.jsp" %>
	<div class="main">
		<!-- 焦点图部分 -->
		<%--<div class="focus">
			<a href="#">
				<img src="/pics/uploads/focus.jpg">
			</a>

			<a href="#" class="arrow_l arrow" id="left"><i>&lt;</i></a>
			<a href="#" class="arrow_r arrow" id="right"><i>&gt;</i></a>
			<ul>
				<li class="current"></li>
				<li class="current"></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>--%>
		<div id="container">
			　　　　　　<!--定义图片列表-->
			　　　　　　<ul id="imgs">
			　　　　　　　　<li class="active"><a href="/goods/prebuy?goodsId=4"><img src="/pics/uploads/focus1.png" alt=""></a></li>
			　　　　　　　　<li><a href="/goods/prebuy?goodsId=12"><img src="/pics/uploads/focus2.png" alt=""></a></li>
			　　　　　　　　<li><a href="/goods/prebuy?goodsId=1"><img src="/pics/uploads/focus3.png" alt=""></a></li>
			　　　　　　</ul>
			　　　　　　<!--定义圆点列表-->
			　　　　　　<ul id="circles">
			　　　　　　　　<li class="active"></li>
			　　　　　　　　<li></li>
			　　　　　　　　<li></li>
			　　　　　　　　<li></li>
			　　　　　　　　<li></li>
			　　　　　　　　<li></li>
			　　　　　　　　<li></li>
			　　　　　　　　<li></li>
			　　　　　　</ul>
			　　　　　　<!--左右箭头-->
			　　　　　　<div id="left" class="arrow"><</div>
			　　　　　　<div id="right" class="arrow">></div>
			　　　　</div>
	</div>
	<div class="recommend core" style="margin-top: 100px;">
		<div class="recom_hd fl">
			<img src="/images/clock.png" alt="">
			<h3>今日推荐</h3>
		</div>
		<div class="recom_bd fl">
			<ul>
				<li><a href="#"><img src="/pics/uploads/today1.jpg" alt=""></a></li>
				<li><a href="#"><img src="/pics/uploads/today2.jpg" alt=""></a></li>
				<li><a href="#"><img src="/pics/uploads/today3.jpg" alt=""></a></li>
				<li><a href="#"><img src="/pics/uploads/today4.jpg" alt=""></a></li>
			</ul>
		</div>
	</div>
	<!-- 底部部分 -->
	<%@ include file="components/footer.jsp" %>
	<script>
		//获取元素
		var container = document.getElementById('container');
		var lis = container.children[0].children;
		var circles = container.children[1].children;
		var left = document.getElementById('left');
		var right = document.getElementById('right');
		var len = lis.length;
		//index表示当前所显示图片的下标
		var index = 0;
		var run;
		//将图片轮播封装为一个函数
		function turn(){
			run = setInterval(function(){
				lis[index].removeAttribute('class');
				circles[index].removeAttribute('class');
				index++;
				if(index == len){
					index = 0;
				}
				lis[index].setAttribute('class','active');
				circles[index].setAttribute('class','active');
			},2000);
		}
		//启动时，调用函数
		turn();
		//设置鼠标移入移出容器事件
		container.onmouseenter = function(){
			//当鼠标移入容器中，停止轮播
			clearInterval(run);
		}
		container.onmouseleave = function(){
			//当鼠标移出容器时，继续开始轮播
			turn();
		}
		//设置鼠标移动到圆点上的悬浮事件
		for(var i = 0; i < len; i++){
			circles[i].onmouseover = (function(i){
				return function(){
					lis[index].removeAttribute('class');
					circles[index].removeAttribute('class');
					index = i;
					lis[i].setAttribute('class','active');
					circles[i].setAttribute('class','active');
				}

			})(i);
		}
		//设置左箭头单击事件
		left.onclick = function(){
			lis[index].removeAttribute('class');
			circles[index].removeAttribute('class');
			index--;
			if(index < 0){
				index = len - 1;
			}
			lis[index].setAttribute('class','active');
			circles[index].setAttribute('class','active');
		}
		//设置右箭头单击事件
		right.onclick = function(){
			lis[index].removeAttribute('class');
			circles[index].removeAttribute('class');
			index++;
			if(index == len){
				index = 0;
			}
			lis[index].setAttribute('class','active');
			circles[index].setAttribute('class','active');
		}
	</script>
</body>
</html>