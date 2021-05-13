<%--
  Created by IntelliJ IDEA.
  User: wl
  Date: 2021/5/11
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="/static/styles/ucenter.css"/>
</head>
<body>
    <!-- 顶部导航栏 -->
    <%@include file="../components/nav.jsp"%>
    <div class="container" >
        <div class="sidebar">
            <div class="menu">
                <h1>个人中心</h1>
                <div style="width:100%;height:10px;background-color: #3098F8"></div><%--横线--%>
                <ul style="list-style: none">
                    <li><a href="/user/ucenter/index">首页</a></li>
                    <li><a href="/user/ucenter/trade">我的订单</a></li>
                    <li><a href="/user/ucenter/infor">我的信息</a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <div id="index">
                <h1>HELLO WORLD</h1>
                <%@include file="index.jsp" %>
            </div>
            <div id="trade">
                <h1>ORDER</h1>
                <%@include file="trade.jsp" %>
            </div>
            <div id="infor">
                <h1>INFOR</h1>
                <%@include file="infor.jsp" %>
            </div>
        </div>
    </div>
    <script>
        console.log(location.href);
        href=location.href; //获取url
        let index = href.lastIndexOf("\/"); //获得url里最后一个/的位置
        let str = href.substring(index + 1,href.length);    //由此位置向后切片得到要显示的元素的类名
        console.log(str);
        /*var element=document.getElementsByClassName(str);
        element[0].classList.add("active");*/
        var e=document.getElementById(str);
        e.classList.add("active")

    </script>
</body>
</html>
