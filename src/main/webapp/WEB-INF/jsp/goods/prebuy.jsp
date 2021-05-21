<%@ page import="java.util.List" %>
<%@ page import="com.example.store.entity.Goods" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>您的潮鞋趣店</title>
    <link rel="stylesheet" href="/styles/goods_prebuy.css">
    <link rel="stylesheet" href="/styles/reset.css" />
    <link rel="stylesheet" href="/styles/common.css" />
    <link rel="stylesheet" href="/styles/list.css" />
</head>

<body>
    <!-- 顶部导航栏 -->
    <%@ include file="../components/nav.jsp" %>
    <!-- header+nav2 -->
    <%@ include file="../components/header+nav2.jsp" %>
    <!-- sk _container主体部分 -->
    <div class="sec_kill_container core">
        <div class="sec_kill_hd">
            <img src="./uploads/bg_03.png" alt="" srcset="">
        </div>
        <div class="sec_kill_bd clearfix">
            <%--<ul>
                <c:forEach items="${goods}" var="good" varStatus="varStatus">
                    <li class="sec_kill_goods">
                        <a href="#"><img style="max-height: 288px;max-width: 288px" src="/pics/shoes/${good.getId()}.jpg" alt="" srcset=""></a>
                        <h5 class="sec_kill_goods_title">${good.getName()}</h5>
                        <div class="sec_kill_goods_price">
                            <em>￥${good.getPrice()}</em> <del>￥${good.getPrice()+80}</del>
                        </div>
                        <div class="sec_kill_goods_progress">
                            已售<span><fmt:formatNumber type="number" value="${100*good.getSoldCount()/(good.getSoldCount()+good.getLeftCount())}" maxFractionDigits="1"/>%</span>

                            <div class="progress">
                                <div class="progress_in" style="width: <fmt:formatNumber type="number" value="${100-100*good.getSoldCount()/(good.getSoldCount()+good.getLeftCount())}" maxFractionDigits="2"/>%"></div>
                            </div>
                            剩余<i>${good.getLeftCount()}</i>双
                        </div>
                        <a href="#" class="sec_kill_goods_buy">立即购买</a>
                    </li>
                </c:forEach>
            </ul>--%>
            <div class="view fl">
                <img style="max-height: 600px;max-width: 90%" src="/pics/shoes/${goods.getId()}.jpg">
            </div>
            <div class="infos fr">
                <h6>${goods.getCategory().getName()}</h6>
                <h1>${goods.getName()}</h1>
                <h6>商品ID：${goods.getId()}</h6>
                <h2>￥${goods.getPrice()}<del>￥${goods.getPrice()+80}</del></h2>

                <br><br><br><br><br><br><br><br>
                <%--选择数量：<input type="text" value="1"><br>--%>
                <c:if test="${sessionScope.cartMap.get(goods.getId())==null}">
                    <a href="/goods/cart?goodsId=${goods.getId()}&op=add">
                        <button type="button" name="addToCart" class="fl"><img  src="/pics/cart_add.png"></img>加入购物车</button>
                    </a>
                </c:if>
                <c:if test="${sessionScope.cartMap.get(goods.getId())!=null}">
                    <a href="/goods/cart?goodsId=${goods.getId()}&op=remove">
                        <button type="button" name="addToCart" class="fl"><img  src="/pics/cart_del.png"></img>移出购物车</button>
                    </a>
                </c:if>
                <%--<div class="addFormWrap">
                    <form id="addCart" action="/admin/category/add">
                        分类名：<input name="name" type="text" required>
                        <button onclick="closeForm()">关闭</button><button type="submit" >提交</button>
                    </form>
                </div>--%>
                <button type="button" name="buyNow" class="fr" onclick="showBuyForm()">立即购买</button>
                <div class="buyFormWrap">
                    <form id="buyForm" action="/goods/buy">
                        <%--隐式传商品id--%>
                        <input style="display: none" name="goodsId" value="${goods.getId()}">
                        购买数量：<input type="text" name="goodsCount" required value="1">
                        收货地址：<input type="text" name="address" value="${sessionScope.user.getAddress()}">
                        <button type="button" onclick="closeBuyForm()">关闭</button><button type="submit" >提交</button>
                    </form>
                </div>
            </div>
        </div>

    </div>


    <!-- 底部部分 -->
    <%@ include file="../components/footer.jsp" %>
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