<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="<%=path %>/css/style.css" />
<script type="text/javascript" src="<%=path %>/scripts/function.js"></script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="<%=path %>/index.jsp">易买网</a> &gt; 购物车
</div>
<div class="wrap">
	<div id="shopping">
		<form action="<%=path %>/shopping/user_check" method="post" >
			<table>
				<tr>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${shoppingCart.items}" var="item" varStatus="i" >
				
				<tr id="product_id_${i.index }">
					<td class="thumb"><img src="<%=path %>${item.product.epFileName}" height="50px" width="50px"  /><a href="<%=path %>/product/_view?epId=${item.product.epId}">${item.product.epName}</a></td>
					<td class="price" id="price_id_${i.index }">
						<span>${item.eodCost*item.eodQuantity }</span>
						<input type="hidden" value="${item.eodCost }" />
					</td>
					<td class="number">
						<dl>
							<dt><input id="number_id_${i.index }" type="text" name="number" onblur="reloadPrice(${i.index },false);" value="${item.eodQuantity }" /></dt>
							<dd onclick="reloadPrice(${i.index },true);">修改</dd>
						</dl>
					</td>
					<td class="delete"><a href="javascript:delShopping(${i.index });">删除</a></td>
				</tr>
				</c:forEach>
				<c:if test="${shoppingCart==null }">
					<tr align="center"><td colspan="4">购物车还未有商品!</td></tr>
				</c:if>
			</table>
			<c:if test="${shoppingCart!=null }">
			<div class="button"><input type="submit" value="" /></div>
			</c:if>
		</form>
	</div>

</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
