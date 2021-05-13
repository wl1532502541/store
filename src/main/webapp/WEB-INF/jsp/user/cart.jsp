<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <!-- 顶部导航栏 -->
    <%@include file="../components/nav.jsp"%>
    <div class="container" style="width:1300px;margin: 100px auto;min-height: 300px">
        <div class="title">
            <h2 style="border-top: 5px solid #3098F8;display:inline-block" >我的购物车</h2>
            <h6 style="display:inline-block">共有${sessionScope.cart==null?0:sessionScope.cart.size}件商品</h6>
        </div>
        <div class="content" >
            <c:if test="${sessionScope.cart==null||sessionScope.cart.size==0}">
                <div class="flex" style="display:flex;justify-content:center;align-items:center;min-height: 300px">
                    <div style="width:50%;text-align: center">
                        购物车暂无商品，<a href="/">马上选购</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
