<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String nowDate=sdf.format(new Date());
	request.setAttribute("nowDate", nowDate);
  %>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="../index.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
		<c:if test="${param.nowMenu==null }">
			<c:set var="nowMenu" value="0"></c:set>
		</c:if>
		<c:if test="${param.nowMenu!=null }">
			<c:set var="nowMenu" value="${param.nowMenu }"></c:set>
		</c:if>
			<li <c:if test="${nowMenu==0 }">class="current"</c:if>><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
			<li <c:if test="${nowMenu==1 }">class="current"</c:if>><a href="${pageContext.request.contextPath}/user/manage_userlist">用户</a></li>
			<li <c:if test="${nowMenu==2 }">class="current"</c:if>><a href="${pageContext.request.contextPath}/product/manage_list">商品</a></li>
			<li <c:if test="${nowMenu==3 }">class="current"</c:if>><a href="${pageContext.request.contextPath}/order/manage_list">订单</a></li>
			<li <c:if test="${nowMenu==4 }">class="current"</c:if>><a href="${pageContext.request.contextPath}/comment/manage_list">留言</a></li>
			<li <c:if test="${nowMenu==5 }">class="current"</c:if>><a href="${pageContext.request.contextPath}/news/manage_list">新闻</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		管理员 ${loginUser.euUserName } 您好，今天是${nowDate }，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="${pageContext.request.contextPath}/index.jsp">易买网</a> &gt; 管理后台
</div>