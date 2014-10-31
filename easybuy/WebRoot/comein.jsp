<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="<%=path%>/css/style.css" />
<script type="text/javascript" src="<%=path%>/scripts/function.js"></script>
</head>
<body>&nbsp; 
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="main" class="wrap">
	<div class="lefter">
		
		<jsp:include page="/inc/category_left.jsp" ></jsp:include>
		<div class="spacer"></div>
		<jsp:include page="/inc/last_view.jsp" ></jsp:include>
	</div>
	<div class="main">
		<div class="price-off">
			<h2>今日特价</h2>
			<ul class="product clearfix">
			<c:forEach var="product1" items="${products1}">
			<li>
					<dl>
						<dt><a href="<%=path%>/product/_view?epId=${product1.epId}" target="_blank"><img src="<%=path%>${product1.epFileName}" /></a></dt>
						<dd class="title"><a href="<%=path%>/product/_view?epId=${product1.epId}" target="_blank">${product1.epName}</a></dd>
						<dd class="price">${product1.epPrice}</dd>
					</dl>
			</li>
			</c:forEach>
				
			</ul>
		</div>
		<div class="side">
			
		<jsp:include page="/inc/news_list.jsp" ></jsp:include>
			
		</div>
		<div class="spacer clear"></div>
		<div class="hot">
			<h2>热卖推荐</h2>
			<ul class="product clearfix">
			<c:forEach var="product2" items="${products2}">
			<li>
					<dl>
						<dt><a href="<%=path%>/product/_view?epId=${product2.epId}" target="_blank"><img src="<%=path%>${product2.epFileName}" /></a></dt>
						<dd class="title"><a href="<%=path%>/product/_view?epId=${product2.epId}" target="_blank">${product2.epName}</a></dd>
						<dd class="price">${product2.epPromotePrice}</dd>
					</dl>
			</li>
			</c:forEach>
			
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>

