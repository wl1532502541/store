<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>您的潮趣鞋店</title>
    <link rel="stylesheet" type="text/css" href="/styles/admin_trade.css">
    <link type="text/css" rel="stylesheet" href="/styles/reset.css"/>
    <link type="text/css" rel="stylesheet" href="/styles/common.css"/>
</head>
<body>
<!-- 顶部导航栏 -->
<%@include file="../components/nav.jsp"%>
<div class="container">
    <div class="title">
        <h2>订单管理</h2>
        <%--<h6>共有${fn:length(trades )}个订单</h6>--%>
        <h6>共有${trades.size()}个订单</h6>
        <%--<h6 style="display:inline-block">共有${trades==null?0:trades.size}个订单</h6>--%>
    </div>
    <div class="content" >
        <% String[] stateNames= {"全部订单","待发货","配送中","已完成","已取消"};
            pageContext.setAttribute("stateNames",stateNames);
        int count=0;%>
        <div class="wrap">
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
                        <%--<%=count%>--%>
                        <table style="display: inline-table">
                            <c:forEach items="${trades}" var="trade">
                                <c:if test="${varStatus.count-1==trade.getState()||varStatus.count==1}">
                                        <% count++;%>
                                </c:if>
                            </c:forEach>
                            <% pageContext.setAttribute("count",count);%>
                            <%--<%=count%>--%>
                            <c:if test="${count!=0}">
                                <tr>
                                    <td>订单号</td>
                                    <td>商品id</td>
                                    <td>商品图片</td>
                                    <td>商品名称</td>
                                    <td>商品数量</td>
                                    <td>买家id</td>
                                    <td>订单状态</td>
                                    <c:if test="${varStatus.count<=3}">
                                        <td>操作</td>
                                    </c:if>
                                </tr>
                            </c:if>
                            <c:if test="${count==0}">
                                <h1>暂无</h1>
                            </c:if>
                            <% count=0;
                                pageContext.setAttribute("count",count);
                            %>
                            <%--<c:if test="${trades!=null}">
                                <tr>
                                    <td>订单号</td>
                                    <td>商品id</td>
                                    <td>商品数量</td>
                                    <td>买家id</td>
                                    <td>订单状态</td>
                                    <c:if test="${varStatus.count<4&&varStatus.count>1}">
                                        <td>操作</td>
                                    </c:if>
                                </tr>
                            </c:if>--%>
                            <%--<c:if test="${trades==null}">
                                <h1>暂无</h1>
                            </c:if>--%>
                            <c:forEach items="${trades}" var="trade">
                                <c:if test="${trade.state==varStatus.index||varStatus.index==0}">
                                    <tr>
                                        <td><c:out value="${trade.getId()}"></c:out></td>
                                        <td>${trade.getGoods().getId()}</td>
                                        <td><img style="max-width: 100px;max-height: 100px" src="/pics/shoes/${trade.getGoods().getId()}.jpg"></td>
                                        <td>${trade.getGoods().getName()}</td>
                                        <td>${trade.getGoodsCount()}</td>
                                        <td>${trade.getUser().getId()}</td>
                                        <%--<td>${trade.getState()}</td>--%>
                                        <td>${stateNames[trade.getState()]}</td>
                                        <%--<% int index=(int)pageContext.findAttribute("varStatus.index");%>--%>
                                        <%--<td><%=index%></td>--%>
                                        <c:if test="${varStatus.count<=3}">
                                            <c:if test="${trade.getState()==1}">
                                                <td><a href="/admin/trade/send?id=${trade.id}">发货</a></td>
                                            </c:if>
                                            <c:if test="${trade.getState()==2}">
                                                <td><a href="/admin/trade/cancel?id=${trade.id}">取消此订单</a></td>
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
</body>
</html>