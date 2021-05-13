<%@ page import="com.example.store.entity.Trade" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="/static/styles/ucenter_trade.css"/>
<div class="wrap">
    <label>
        <input type="radio" name="tab" checked>
        <span>待发货</span>
        <div>
            <tr>

            </tr>
            <c:forEach items="${trades}" var="trade">

                asd
                ${trade.getState()}
            </c:forEach>
            <% List<Trade> trades= (List)pageContext.findAttribute("trades");%>
            <%=trades==null?"":trades.get(0).getUserId()%>
            home-page
        </div>
    </label>
    <label>
        <input type="radio" name="tab">
        <span>待收货</span>
        <div>list-page</div>
    </label>
    <label>
        <input type="radio" name="tab">
        <span>已完成</span>
        <div>news-page</div>
    </label>
    <label>
        <input type="radio" name="tab">
        <span>mine</span>
        <div>mine-page</div>
    </label>
</div>
