<%@ page import="com.example.store.entity.Trade" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>您的潮趣鞋店</title>
    <link type="text/css" rel="stylesheet" href="/styles/ucenter.css"/>
    <link type="text/css" rel="stylesheet" href="/styles/ucenter_trade.css"/>
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
        <div id="trade">
            <h1>TRADE</h1>
            <%--<% String[] stateNames= {"待发货","配送中","已完成","已取消"};%>--%>
            <div class="wrap">
                    <% String[] stateNames= {"全部订单","待发货","配送中","已完成","已取消"};
                        pageContext.setAttribute("stateNames",stateNames);
                        int count=0;%>
                    <c:forEach items="<%=stateNames%>" var="stateName" varStatus="varStatus">
                        <label>
                            <c:if test="${varStatus.count==1}">
                                <input type="radio" name="tab" checked>
                            </c:if>
                            <c:if test="${varStatus.count>1}">
                                <input type="radio" name="tab">
                            </c:if>
                            <span>${stateName}</span>
                            <div>
                                <table style="display: inline-table">
                                    <c:forEach items="${trades}" var="trade">
                                        <c:if test="${varStatus.count-1==trade.getState() || varStatus.count==1}">
                                            <% count++;%>
                                        </c:if>
                                    </c:forEach>
                                    <% pageContext.setAttribute("count",count);%>
                                    <c:if test="${count!=0}">
                                        <tr>
                                            <td>订单号</td>
                                            <td>商品id</td>
                                            <td>商品图片</td>
                                            <td>商品名称</td>
                                            <td>商品数量</td>
                                            <%--<td>买家id</td>--%>
                                            <td>订单状态</td>
                                            <c:if test="${varStatus.count<=3||varStatus.count==5}">
                                                <td>操作</td>
                                            </c:if>
                                        </tr>
                                    </c:if>
                                    <c:if test="${count==0}">
                                        <h1 style="margin-left: 10%;">暂无,<a href="/">马上选购</a></h1>
                                    </c:if>
                                    <% count=0;
                                        pageContext.setAttribute("count",count);
                                    %>
                                    <c:forEach items="${trades}" var="trade">
                                        <c:if test="${trade.state==varStatus.index||varStatus.index==0}">
                                            <tr>
                                                <td><c:out value="${trade.getId()}"></c:out></td>
                                                <td>${trade.getGoods().getId()}</td>
                                                <td><img style="max-width: 100px;max-height: 100px" src="/pics/shoes/${trade.getGoods().getId()}.jpg"></td>
                                                <td>${trade.getGoods().getName()}</td>
                                                <td>${trade.getGoodsCount()}</td>
                                                <%--<td>${trade.getUserId()}</td>--%>
                                                <td>${stateNames[trade.getState()]}</td>
                                                    <%--<% int index=(int)pageContext.findAttribute("varStatus.index");%>--%>
                                                    <%--<td><%=index%></td>--%>
                                                <c:if test="${varStatus.count<=3||varStatus.count==5}">
                                                    <c:if test="${trade.getState()==1}">
                                                        <td><a href="/user/trade/cancel?id=${trade.id}">取消此订单</a></td>
                                                    </c:if>
                                                    <c:if test="${trade.getState()==2}">
                                                        <td><a href="/user/trade/got?id=${trade.id}">确认已收货</a></td>
                                                    </c:if>
                                                    <%--<td><a href="/admin/trade/canceltrade?id=${trade.id}">取消此订单</a></td>--%>
                                                </c:if>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </table>
                            </div>
                        </label>
                    </c:forEach>
            </div>
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

