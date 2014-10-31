<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" >
	<jsp:param value="1" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/user_left.jsp" ></jsp:include>
	<div class="main">
		<h2>订单查看</h2>
		<div class="manage">
			
		  <table style="text-align: center;" width="660" height="100">
		
		<tr><th>姓名</th><td>${order.eoRealName }</td></tr>
		<tr><th>收货地址</th><td>${order.eoUserAddress }</td></tr>
		<tr><th>联系电话</th><td>${order.eoUserPhone }</td></tr>
		<tr><th>支付方式</th><td><c:if test="${order.eoType==1 }">货到付款</c:if><c:if test="${order.eoType==2 }">网上支付</c:if></td></tr>
		<tr><th>订单状态</th><td>${order.status }</td></tr>	
		<tr><th>订购时间</th><td>${order.formatDate }</td></tr>	
		<tr><th>总价格<br /></th><td><font color="red">${order.eoCost }</font></td></tr>					
		</table>
		<br />
			<table width="658px" height="79px" style="text-align: center;" border="1">
				<tr>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>购买数量</th>
					
				</tr>
				
				<c:forEach items="${order.list}" var="item" varStatus="i" >
				
				<tr id="product_id_${i.index }">
					<td class="thumb"><a href="${pageContext.request.contextPath }/product/_view?epId=${item.product.epId}">${item.product.epName}</a></td>
					<td class="price" id="price_id_${i.index }">
						<span>${item.eodCost*item.eodQuantity }</span>
						<input type="hidden" value="${item.eodCost }" />
					</td>
					<td class="number">
						<dl>
							<dt>${item.eodQuantity }</dt>
							
						</dl>
					</td>
				
				</tr>
				</c:forEach>
				
			
				
			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
