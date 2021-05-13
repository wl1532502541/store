<%--
  Created by IntelliJ IDEA.
  User: wl
  Date: 2021/5/12
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>订单管理</title>
    <link rel="stylesheet" type="text/css" href="/styles/admin_trade.css">
</head>
<body>
<!-- 顶部导航栏 -->
<%@include file="../components/nav.jsp"%>
<div class="container" style="width:1300px;margin: 100px auto;min-height: 300px">
    <div class="title">
        <h2 style="border-top: 5px solid #3098F8;display:inline-block" >订单管理</h2>
        <h6 style="display:inline-block">共有${fn:length(trades )}个订单</h6>
        <%--<h6 style="display:inline-block">共有${trades==null?0:trades.size}个订单</h6>--%>
    </div>
    <div class="content" >
        <% String[] stateNames= {"全部订单","待发货","配送中","已完成","已取消"};%>
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
                        <table>
                            <c:if test="${trades!=null}">
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
                            </c:if>
                            <c:if test="${trades==null}">
                                <h1>暂无</h1>
                            </c:if>
                            <c:forEach items="${trades}" var="trade">
                                <c:if test="${trade.state==varStatus.index||varStatus.index==0}">
                                    <tr>
                                        <td><c:out value="${trade.getId()}"></c:out></td>
                                        <td>${trade.getGoodsId()}</td>
                                        <td>${trade.getGoodsCount()}</td>
                                        <td>${trade.getUserId()}</td>
                                        <td>${trade.getState()}</td>
                                        <%--<% int index=(int)pageContext.findAttribute("varStatus.index");%>--%>
                                        <%--<td><%=index%></td>--%>
                                        <c:if test="${varStatus.count<4}">
                                            <td><a href="/admin/trade/canceltrade?id=${trade.id}">取消此订单</a></td>
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