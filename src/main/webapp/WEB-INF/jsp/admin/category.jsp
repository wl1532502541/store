<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.example.store.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.store.entity.Category" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>您的潮趣鞋店</title>
    <link rel="stylesheet" type="text/css" href="/styles/admin_goods.css">
    <link type="text/css" rel="stylesheet" href="/styles/reset.css"/>
    <link type="text/css" rel="stylesheet" href="/styles/common.css"/>
</head>
<body>
<!-- 顶部导航栏 -->
<%@include file="../components/nav.jsp"%>
<% List<Category> categories=(List)pageContext.findAttribute("categories");%>
<%--<%= categories.get(0).getName()%>
<%= categories.get(0).getId()%>--%>
<div class="container">
    <div class="title">
        <h2>分类管理</h2>
        <%--<h6 style="display:inline-block">共有${sessionScope.cart==null?0:sessionScope.cart.size}件商品</h6>--%>
        <%--<h6>共有${sessionScope.cart==null?0:""}件商品</h6>--%>
        <h6>共有${itemsTotal}个分类</h6>
    </div>
    <div class="content" >
        <div>
            <div class="operation">
                <button onclick="showForm()">添加分类</button>
                <div class="pagination fr">
                    <c:if test="${pageIndex>0}">
                        <a href="/admin/goods?pageIndex=${pageIndex-1}" class="arrowWrap"><img class="arrow" src="/pics/prev.png"></a>
                    </c:if>
                    <c:if test="${pageIndex==0}">
                        <a  href="#" class="arrowWrap"><img class="arrow" src="/pics/prev.png"></a>
                    </c:if>
                    ${pageIndex+1}/${pagesTotal==0?1:pagesTotal}页
                    <c:if test="${pageIndex==pagesTotal-1}">
                        <a  href="#" class="arrowWrap"><img class="arrow" src="/pics/next.png"></a>
                    </c:if>
                    <c:if test="${pageIndex<pagesTotal-1}">
                        <a  href="/admin/goods?pageIndex=${pageIndex+1}" class="arrowWrap"><img class="arrow" src="/pics/next.png"></a>
                    </c:if>
                </div>
            </div>
            <div class="addFormWrap">
                <form id="addForm" action="/admin/category/add">
                    分类名：<input name="name" type="text" required>
                    <button onclick="closeForm()">关闭</button><button type="submit" >提交</button>
                </form>
            </div>
            <table>
                <tr>
                    <td>分类Id</td>
                    <td>分类名称</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${categories}" var="category" varStatus="varStatus">
                    <tr>
                        <td>${category.getId()}</td>
                        <td>${category.getName()}</td>
                        <td><a href="#">删除</a></td>
                            <%--<td>${good.getCategoryId()}</td>--%>
                            <%--<td>${categories.get(good.getCategoryId()-1).getName()}</td>--%>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!-- 分页的制作 -->
    <%--<div class="sec_kill_page">
        <span class="page_num">
            <a href="#" class="pn_prev">上一页</a>
            <a href="#" class="current">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#" class="dotted">...</a>
            <a href="#" class="pn_next">下一页</a>
        </span>
        <span class="page_skip"></span>
    </div>--%>
</div>
<script>
    function toggleActive(){
        var element=document.getElementsByClassName("addFormWrap")[0].classList.toggle("active");
    }
    function showForm(){
        toggleActive();
    }
    function closeForm(){
        toggleActive();
        var Form=document.getElementById("addForm");
        Form.reset();
    }

    var inputFormPic=document.getElementById("inputFormPic");
    var imgFormPic=document.getElementById("imgFormPic");
    /*inputFormPic.change();*/
    inputFormPic.addEventListener("change",function () {
        imgFormPic.src=getObjectURL(inputFormPic.files[0]);
        /*attr("src",getObjectURL(file[0].files[0]));*/
    })
    function getObjectURL(file) {
        var url = null;
        /* window.URL = window.URL || window.webkitURL;*/
        if (window.createObjcectURL != undefined) {
            url = window.createOjcectURL(file);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }
</script>
</body>
</html>
