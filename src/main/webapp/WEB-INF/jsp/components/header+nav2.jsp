<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- header部分 -->
<div class="header core">
    <!-- logo部分 -->
    <%--<h1><a href="index.html"><img src="images/logo.jpg" width="220" height="73" alt=""></a></h1>--%>
    <!-- 搜索框部分 -->
    <div class="search">
        <form action="/goods/search">
            <c:if test="${searchContent!=null}">
                <input type="text" value="${searchContent}" name="searchContent">
                <button class="btn">搜索</button>
            </c:if>
            <c:if test="${searchContent==null}">
                <input type="text" value="精品潮鞋" name="searchContent">
                <button class="btn">搜索</button>
            </c:if>
        </form>
        <%--<input type="text" value="篮球鞋" >
        <button class="btn">搜索</button>--%>
    </div>
    <%--<div class="items_list">
        <ul>
            <li><a href="#" class="style_red">精品潮鞋</a></li>
            <li><a href="#">运动鞋</a></li>
            <li><a href="#">高跟鞋</a></li>
            <li><a href="#">休闲鞋</a></li>
            <li><a href="#">皮鞋</a></li>
            <li><a href="#">凉鞋</a></li>
        </ul>
    </div>--%>
    <!-- 购物车 -->
    <%--<div class="shopping_car"><em><img src="images/index_C3(~E504]OTQK6F7(`CI~H6.png"/></em><a>我的购物车 </a></div>--%>
</div>
<!-- nav导航栏部分 -->
<div class="nav">
    <div class="core" style="position: relative;">

        <!-- 下拉栏目部分 -->
        <div class="dropdown">
            <div class="dt"><span>全部商品分类</span></div>
            <!-- 链接小项目 -->
            <div class="nav_items_list fr">
                <ul>
                    <c:forEach items="${categories}" var="category" varStatus="varStatus">
                        <li><a href="/goods?categoryId=${category.getId()}">${category.getName()}</a></li>
                        <script></script>
                    </c:forEach>
                    <%--<li><a href="run.html">跑步鞋</a></li>
                    <li><a href="Loafers.html">休闲鞋</a></li>
                    <li><a href="/goods/basketball">篮球鞋</a></li>
                    <li><a href="plimsolls">帆布鞋</a></li>
                    <li><a href="">板鞋</a></li>
                    <li><a href="">凉鞋</a></li>
                    <li><a href="">皮鞋</a></li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>