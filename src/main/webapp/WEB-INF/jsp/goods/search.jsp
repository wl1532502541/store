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
        搜索关键词：${searchContent} 找到${itemsTotal}个商品
        <%--<img src="./uploads/bg_03.png" alt="" srcset="">--%>
    </div>
    <div class="sec_kill_bd clearfix">
        <%--<c:if test="${goods==null}">
            没有找到相关商品
        </c:if>--%>
        <ul>
            <c:forEach items="${goods}" var="good" varStatus="varStatus">
                <li class="sec_kill_goods">
                    <a href="/goods/prebuy?goodsId=${good.getId()}"><img style="max-height: 288px;max-width: 288px" src="/pics/shoes/${good.getId()}.jpg" alt="" srcset=""></a>
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
                    <a href="/goods/prebuy?goodsId=${good.getId()}" class="sec_kill_goods_buy">立即购买</a>
                </li>
            </c:forEach>

        </ul>
    </div>

    <!-- 分页的制作 -->
    <div class="sec_kill_page">
            <span class="page_num">
                <c:if test="${pageIndex>0}">
                    <a href="/goods/search?searchContent=${searchContent}&pageIndex=${pageIndex-1}" class="pn_prev">上一页</a>
                </c:if>
                <c:if test="${pageIndex==0}">
                    <a  href="#" class="pn_prev">上一页</a>
                </c:if>
                ${pageIndex+1}/${pagesTotal==0?1:pagesTotal}页
                <%--<a href="#" class="pn_prev">上一页</a>--%>
                <%--<a href="#" class="current">1</a>
                <a href="#">2</a
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#" class="dotted">...</a>--%>
                <c:if test="${pageIndex==pagesTotal-1}">
                    <a  href="#" class="pn_next">下一页</a>
                </c:if>
                    <c:if test="${pageIndex<pagesTotal-1}">
                        <a  href="/goods/search?searchContent=${searchContent}&pageIndex=${pageIndex+1}" class="pn_next">下一页</a>
                    </c:if>
            </span>
        <span class="page_skip"></span>
    </div>
</div>

<!-- 底部部分 -->
<%@ include file="../components/footer.jsp" %>
</body>

</html>