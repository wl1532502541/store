<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>您的潮趣鞋店</title>
    <link type="text/css" rel="stylesheet" href="/styles/user_cart.css">
    <link type="text/css" rel="stylesheet" href="/styles/reset.css"/>
    <link type="text/css" rel="stylesheet" href="/styles/common.css"/>
</head>
<body>
    <!-- 顶部导航栏 -->
    <%@include file="../components/nav.jsp"%>
    <div class="cart-container" >
        <div class="cart-title">
            <h2>我的购物车</h2>
            <h6>共有${sessionScope.cartGoods==null?0:sessionScope.cartGoods.size()}件商品</h6>
        </div>
        <div class="cart-content" >
            <c:if test="${sessionScope.cartGoods==null||sessionScope.cartGoods.size()==0}">
                    <div class="cart-empty">
                        <p>购物车暂无商品，<a href="/">马上选购</a></p>
                    </div>
            </c:if>
            <c:if test="${sessionScope.cartGoods!=null&&sessionScope.cartGoods.size()>0}">
                <div class="cart-notEmpty">
                    <table>
                        <tr>
                            <td>商品id</td>
                            <td>商品名</td>
                            <td>商品图</td>
                            <td>商品分类</td>
                            <td>商品价格</td>
                            <td>商品数量</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${sessionScope.cartGoods}" var="goods" varStatus="varStatus">
                            <tr>
                                <td>${goods.getId()}</td>
                                <td>${goods.getName()}</td>
                                <td><img src="/pics/shoes/${goods.getId()}.jpg"></td>
                                <td>${goods.getCategory().getName()}</td>
                                <td>${goods.getPrice()}</td>
                                <td>${sessionScope.cartMap.get(goods.getId())}</td>
                                <td><a href="/user/cart/op?op=more&goodsId=${goods.getId()}">增加</a></td>
                                <td><a href="/user/cart/op?op=less&goodsId=${goods.getId()}">减少</a></td>
                                <td><a href="/user/cart/op?op=move&goodsId=${goods.getId()}">移除</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="totalPriceAndBuyButton">
                        总价：${totalPrice}
                        <button onclick="showBuyForm()">立即结算</button>
                        <div class="buyFormWrap">
                            <form id="buyForm" action="/user/buyFromCart">
                                总价：￥${totalPrice}<br>
                                收货地址：<input name="address" type="text" value="${sessionScope.user.getAddress()}">
                                <button type="submit">付款</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <script>
        function toggleActive(){
            var element=document.getElementsByClassName("buyFormWrap")[0].classList.toggle("active");
        }
        function showBuyForm(){
            toggleActive();
        }
        function closeBuyForm(){
            toggleActive();
            var Form=document.getElementById("buyForm");
            Form.reset();
        }
    </script>
</body>
</html>
