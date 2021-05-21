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
    <%--<div class="shortcut">
      <div class="core">
            <!-- 左边栏 -->
        <div class="fl">
                <ul>
                    <li>欢迎您!</li>
                    <li>
                        <a href="#">请登录</a>
                        <a href="#" class="style_red">注册</a>
                    </li>
                </ul>
            </div>
            <!-- 右边栏 -->
            <div class="fr">
                <ul>
                    <li><a href="#">我的订单</a></li>
                    <li class="spacer"></li>
                    <li><a href="#">我的好鞋</a></li>
                    <li class="spacer"></li>
                    <li><a href="#">客户服务</a>
                    </li><li class="spacer"></li>
                    <li><a href="#">网站导航</a></li>
                </ul>
            </div>
        </div>
    </div>--%>
    <%--
	<!-- header部分 -->
    <div class="header core">
         <!-- logo部分 -->
      <h1><a href="index.html"><img src="images/logo.jpg" width="220" height="73" alt=""></a></h1>
        <!-- 搜索框部分 -->
        <div class="search">
            <input type="text" value="平价好鞋" >
            <button class="btn">搜索</button>
      </div>
    <div class="items_list">
            <ul>
                <li><a href="#" class="style_red">精品潮鞋</a></li>
                <li><a href="#">运动鞋</a></li>
                <li><a href="#">高跟鞋</a></li>
                <li><a href="#">休闲鞋</a></li>
                <li><a href="#">皮鞋</a></li>
                <li><a href="#">凉鞋</a></li>
            </ul>
	</div>	
	<!-- 购物车 -->
      <div class="shopping_car"><em><img src="images/index_C3(~E504]OTQK6F7(`CI~H6.png"/></em><a>我的购物车 </a></div>
</div>
	<!-- nav导航栏部分 -->
    <div class="nav">
      <div class="core" style="position: relative;">
            <!-- 下拉栏目部分 -->
            <div class="dropdown">
                <div class="dt"><a>全部商品分类</a></div>
            <!-- 链接小项目 -->
            <div class="nav_items_list fr">
                <ul>

                    <li><a href="">跑步鞋</a></li>
                    <li><a href="">休闲鞋</a></li>
                    <li><a href="">篮球鞋</a></li>
                    <li><a href="">训练鞋</a></li>
                    <li><a href="">板鞋</a></li>
                    <li><a href="">拖鞋</a></li>
                    <li><a href="">皮鞋</a></li>
                </ul>
            </div>
        </div>
    </div>
	</div>
    --%>
    <!-- header+nav2 -->
    <%@ include file="../components/header+nav2.jsp" %>
    <!-- sk _container主体部分 -->
    <div class="sec_kill_container core">
        <div class="sec_kill_hd">
            <%--<img src="./uploads/bg_03.png" alt="" srcset="">--%>
                当前分类：${curCategory}
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
                <%--<li class="sec_kill_goods">
                    <a href="#"><img src="./images/shoes/11.jpg" alt="" srcset=""></a>
                    <h5 class="sec_kill_goods_title">FAMDBANN联名詹·姆斯曼巴精神篮球鞋7代男鞋杜兰</h5>
                    <div class="sec_kill_goods_price">
                        <em>¥338</em> <del>￥399</del>
                    </div>
                    <div class="sec_kill_goods_progress">
                        已售<span>89%</span>
                        <div class="progress">
                            <div class="progress_in"></div>
                        </div>
                        剩余<i>39</i>双
                    </div>
                    <a href="#" class="sec_kill_goods_buy">立即购买</a>
                </li>--%>
            </ul>
        </div>

        <%--<div class="sec_kill_page">
        <div class="pagination fr">
            <c:if test="${pageIndex>0}">
                <a href="/admin/goods?pageIndex=${pageIndex-1}" class="arrowWrap"><img class="arrow" src="/pics/prev.png"></a>
            </c:if>
            <c:if test="${pageIndex==0}">
                <a  href="#" class="arrowWrap"><img class="arrow" src="/pics/prev.png"></a>
            </c:if>
            ${pageIndex+1}/${pagesTotal}页
            <c:if test="${pageIndex==pagesTotal-1}">
                <a  href="#" class="arrowWrap"><img class="arrow" src="/pics/next.png"></a>
            </c:if>
            <c:if test="${pageIndex<pagesTotal-1}">
                <a  href="/admin/goods?pageIndex=${pageIndex+1}" class="arrowWrap"><img class="arrow" src="/pics/next.png"></a>
            </c:if>
        </div>
        </div>--%>
        <!-- 分页的制作 -->
        <div class="sec_kill_page">
            <span class="page_num">
                <c:if test="${pageIndex>0}">
                    <a href="/goods?categoryId=${categoryId}&pageIndex=${pageIndex-1}" class="pn_prev">上一页</a>
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
                        <a  href="/goods?categoryId=${categoryId}&pageIndex=${pageIndex+1}" class="pn_next">下一页</a>
                    </c:if>
            </span>
            <span class="page_skip"></span>
        </div>
    </div>
 
 
    <%--
    <!-- 底部部分 -->
    <div class="footer">
        <div class="core">
            <div class="mod_service">
                <div class="mod_service_zheng">
                    <div class="icon_list"></div>
                    <div>
                        <h4>正品保障</h4>
                        <p>正品保障，提供发票</p>
                    </div>
                </div>
                <div class="mod_service_ji">
                    <div class="icon_list"></div>
                    <div>
                        <h4>急速物流</h4>
                        <p>急速物流，急速送达</p>
                    </div>
                </div>
                <div class="mod_service_wu">
                    <div class="icon_list"></div>
                    <div>
                        <h4>无忧售后</h4>
                        <p>7天无理由退换货</p>
                    </div>
                </div>
                <div class="mod_service_te">
                    <div class="icon_list"></div>
                    <div>
                        <h4>特色服务</h4>
                        <p>私人定制套餐</p>
                    </div>
                </div>
                <div class="mod_service_bang">
                    <div class="icon_list"></div>
                    <div>
                        <h4>帮助中心</h4>
                        <p>您的购物指南</p>
                    </div>
                </div>
            </div>
            <div class="mod_help">
                <ul>
                    <li>
                        <h4>购物指南</h4>
                    </li>
                    <li><a>购物流程</a></li>
                    <li><a>会员介绍</a></li>
                    <li><a>生活旅行/团购</a></li>
                    <li><a>常见问题</a></li>
                    <li><a>联系客服</a></li>
                </ul>
                <ul>
                    <li>
                        <h4>配送方式</h4>
                    </li>
                    <li><a>上门自提</a></li>
                    <li><a>211限时达</a></li>
                    <li><a>配送服务查询</a></li>
                    <li><a>配送费收取标准</a></li>
                    <li><a>海外配送</a></li>
                </ul>
                <ul>
                    <li>
                        <h4>支付方式</h4>
                    </li>
                    <li><a>货到付款</a></li>
                    <li><a>在线支付</a></li>
                    <li><a>分期付款</a></li>
                    <li><a>邮局汇款</a></li>
                    <li><a>公司转账</a></li>
                </ul>
                <ul>
                    <li>
                        <h4>特色服务</h4>
                    </li>
                    <li><a>夺宝岛</a></li>
                    <li><a>DIY装配</a></li>
                    <li><a>延保服务</a></li>
                </ul>
                <ul>
                    <li>
                        <h4>售后政策</h4>
                    </li>
                    <li><a>售后政策</a></li>
                    <li><a>价格保护</a></li>
                    <li><a>退款说明</a></li>
                    <li><a>返修/退换货</a></li>
                    <li><a>取消订单</a></li>
                    <li><a>联系客服</a></li>
                </ul>
            </div>
		</div>
	</div>
    --%>
    <!-- 底部部分 -->
    <%@ include file="../components/footer.jsp" %>
</body>
 
</html>