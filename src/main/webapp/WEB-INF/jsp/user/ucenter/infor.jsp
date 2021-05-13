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
    <link type="text/css" rel="stylesheet" href="/styles/ucenter.css"/>
</head>
<body>
<!-- 顶部导航栏 -->
<%@include file="../../components/nav.jsp"%>
<div class="container" >
    <%-- 侧边栏 --%>
    <%@include file="../../components/ucenter/sidebar.jsp"%>
    <div class="content">
        <div id="infor">
            <h1>INFOR</h1>
            <h3>用户名</h3>
            ${sessionScope.user.getName()}
            <h3>详细地址</h3>
            <c:if test="${sessionScope.user.getAddress()}==''">
                暂未填写
            </c:if>
            ${sessionScope.user.getAddress()}
        </div>
    </div>
</div>
<script>
    /*console.log(location.href);
    href=location.href; //获取url
    let index = href.lastIndexOf("\/"); //获得url里最后一个/的位置
    let str = href.substring(index + 1,href.length);    //由此位置向后切片得到要显示的元素的类名
    console.log(str);
    /!*var element=document.getElementsByClassName(str);
    element[0].classList.add("active");*!/
    var e=document.getElementById(str);
    e.classList.add("active")*/

</script>
</body>
</html>

