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
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="3" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>修改订单</h2>
		<div class="manage">
		
				<div id="shopping">
			<form action="/easybuy/order/manage_domodify" method="post" >
			<table style="text-align:center" >
			<tr><td>订单id</td><td>${order.eoId }<input type="hidden" name="oid" value="${order.eoId }" /></td></tr>
			<tr><td>姓名</td><td><input type="text" name="euRealName" value="${order.eoRealName }" /></td></tr>
			<tr><td>收货地址</td><td><input type="text" name="euAddress" value="${order.eoUserAddress }"/></td></tr>
			<tr><td>联系电话</td><td><input type="text" name="euMobile" value="${order.eoUserPhone }"/></td></tr>
			<tr><td>支付方式</td><td><select name="eoType" >
			
				<option <c:if test="${order.eoType==1 }">selected="selected"</c:if> value="1">货到付款</option>
			
			<option <c:if test="${order.eoType==2 }">selected="selected"</c:if> value="2">网上支付</option>
			
	           </select></td></tr>
	         <tr><td>订单状态</td><td><select name="eoStatus" >
	         
					<option value="1" <c:if test="${order.eoStatus==1 }">selected="selected"</c:if>>下单</option>
					<option value="2" <c:if test="${order.eoStatus==2 }">selected="selected"</c:if>>审核通过</option>
					<option value="3" <c:if test="${order.eoStatus==3 }">selected="selected"</c:if>>配货</option>
					<option value="4" <c:if test="${order.eoStatus==4 }">selected="selected"</c:if>>送货中</option>
					<option value="5" <c:if test="${order.eoStatus==5 }">selected="selected"</c:if>>收获并确认</option>
			
	           </select></td></tr>
	           <tr><td>总金额</td><td><font color="red" style="font-weight:bold;">${order.eoCost }</font></td></tr>
			</table>
			
				<table >
					<tr>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>购买数量</th>
						
					</tr>
					
	
					
					
					
				<c:forEach items="${order.list}" var="item" varStatus="i" >
				
				<tr id="product_id_${i.index }">
					<td class="thumb"><img src="${pageContext.request.contextPath }/${item.product.epFileName}" height="80px" width="80px" /><a href="${pageContext.request.contextPath }/product/_view?epId=${item.product.epId}">${item.product.epName}</a></td>
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
				<div align="right"><input type="submit" value="修改订单" style="font-size:25px; background:grey"/></div>
			</form>
		</div>
			
		</div>
		
	</div>
	<div class="clear"></div>
</div>
	<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
