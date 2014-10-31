<%@page import="un.dez.easybuy.entity.News"%>
<%@page import="un.dez.easybuy.entity.Order"%>
<%@page import="un.dez.easybuy.biz.Factory"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	
	List<Order> orders=Factory.getOrderdao().getOrderByCount(7);
	request.setAttribute("orders", orders);
	List<News> nlist=Factory.getNesdao().getNewsListByCount(7);
	request.setAttribute("nlist",nlist);
 %>
<div class="news-list">
				<h4>新闻列表</h4>
					<ul>
				<c:forEach items="${nlist}" var="news">
				<li><a href="<%=request.getContextPath()%>/news/viewbyid?id=${news.enId}" >${news.shortTitle }</a></li>
				</c:forEach>
				</ul>
			</div>
			<div class="spacer"></div>
			<div class="news-list">
				<h4>购买动态</h4>
				<ul>
				<c:forEach items="${orders }" var="order">
					<li>${order.eoUser.euUserName } <font color="#996699">购买了</font>
					<c:forEach items="${order.list}" var="detail" begin="0" end="0"> 
					 <a href="${pageContext.request.contextPath }/product/_view?epId=${detail.product.epId}" >${detail.product.shortShortEpName }</a>
					 </c:forEach>
					 </li>
				</c:forEach>			
					
					
				</ul>
			</div>