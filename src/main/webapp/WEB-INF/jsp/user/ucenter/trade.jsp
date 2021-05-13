<%@ page import="com.example.store.entity.Trade" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="/styles/ucenter.css"/>
    <link type="text/css" rel="stylesheet" href="/styles/ucenter_trade.css"/>
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
            <% String[] stateNames= {"待发货","配送中","已完成","已取消"};%>
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
                                <tr>
                                    <td>订单号</td>
                                    <td>商品id</td>
                                    <td>商品数量</td>
                                    <c:if test="${varStatus.count<4}">
                                        <td>操作</td>
                                    </c:if>
                                </tr>
                                <c:if test="${trades==null}">
                                    <h1>暂无</h1>
                                </c:if>
                                <c:forEach items="${trades}" var="trade">
                                    <c:if test="${trade.state==varStatus.index+1}">
                                        <tr>
                                            <td><c:out value="${trade.getId()}"></c:out></td>
                                            <td>${trade.getGoodsId()}</td>
                                            <td>${trade.getGoodsCount()}</td>
                                            <c:if test="${varStatus.count<4}">
                                                <td><a href="/user/ucenter/trade/canceltrade?id=${trade.id}">取消此订单</a></td>
                                            </c:if>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </div>
                    </label>
                </c:forEach>
                <%--<label>
                    <input type="radio" name="tab"   checked>
                    <span>待发货</span>
                    <div>
                        <table>
                            <tr>
                                <td>订单号</td>
                                <td>商品id</td>
                                <td>商品数量</td>
                                <td>操作</td>
                            </tr>
                            <c:if test="${trades==null}">
                                <h1>暂无</h1>
                            </c:if>
                            <c:forEach items="${trades}" var="trade">
                                <c:if test="${trade.state==1}">
                                    <tr>
                                        <td><c:out value="${trade.getId()}"></c:out></td>
                                        <td>${trade.getGoodsId()}</td>
                                        <td>${trade.getGoodsCount()}</td>
                                        <td><a href="/user/ucenter/trade/canceltrade?id=${trade.id}">取消此订单</a></td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                        </table>
                        home-page
                    </div>
                </label>
                <label>
                    <input type="radio" name="tab">
                    <span>配送中</span>
                    <div>
                        <table>
                            <tr>
                                <td>The table body</td>
                                <td>with two columns</td>
                            </tr>
                        </table>
                        list-page
                    </div>
                </label>
                <label>
                    <input type="radio" name="tab">
                    <span>已完成</span>
                    <div>news-page</div>
                </label>
                <label>
                    <input type="radio" name="tab">
                    <span>已发货</span>
                    <div>mine-page</div>
                </label>--%>
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

