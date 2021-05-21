<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>您的潮趣鞋店</title>
    <link type="text/css" rel="stylesheet" href="/styles/ucenter.css"/>
    <link type="text/css" rel="stylesheet" href="/styles/reset.css"/>
    <link type="text/css" rel="stylesheet" href="/styles/common.css"/>
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
            <h3>默认收货地址</h3>
            <c:if test="${sessionScope.user.getAddress()==null||sessionScope.user.getAddress().equals('')}">
                暂未填写
            </c:if>
            <c:if test="${sessionScope.user.getAddress()!=null||!(sessionScope.user.getAddress().equals(''))}">
                ${sessionScope.user.getAddress()}
            </c:if>
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

