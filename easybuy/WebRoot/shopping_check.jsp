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
<script type="text/javascript">
	function check()
	{
		var name=document.getElementById("name").value;
		var address=document.getElementById("euaddress").value;
		var mobile=document.getElementById("mobile").value;
		if(name=="")
		{
			document.getElementById("msg").innerHTML="姓名不能为空";
			return false;
		}
		if(address=="")
		{
			document.getElementById("msg").innerHTML="收货地址不能为空";
			return false;
		}
		if(mobile=="")
		{
			document.getElementById("msg").innerHTML="手机号码不能为空";
			return false;
		}
	
	
		return true;
	}


</script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="<%=path %>/index.jsp">易买网</a> &gt; 订单确认
</div>
<div class="wrap">
	<div id="shopping">
		<form action="<%=request.getContextPath() %>/order/user_addOrder" method="post" onsubmit="return check()">
		<table style="text-align:center" >
		
		<tr><td>姓名</td><td><input id="name" type="text" name="euRealName" value="${loginUser.euRealName }" /></td></tr>
		<tr><td>收货地址</td><td><input id="euaddress" type="text" name="euAddress" value="${loginUser.euAddress }"/></td></tr>
		<tr><td>联系电话</td><td><input type="text" id="mobile" name="euMobile" value="${loginUser.euMobile }"/></td></tr>
		<tr><td>支付方式</td><td><select name="eoType" >
		<option value="1">货到付款</option>
		<option value="2">网上支付</option>
           </select></td></tr>
         <tr><td>总金额</td><td><font color="red" style="font-weight:bold;">${shoppingCart.totalCost}</font></td></tr>  
		</table>
		
			<table >
				<tr>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>购买数量</th>
					
				</tr>
				
				<c:forEach items="${shoppingCart.items}" var="item" varStatus="i" >
				
				<tr id="product_id_${i.index }">
					<td class="thumb"><img src="<%=path %>/${item.product.epFileName}" height="50px" width="50px"  /><a href="<%=path %>/product/_view?epId=${item.product.epId}">${item.product.epName}</a></td>
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
			<div align="right"><font id="msg" color="red"></font> <input type="submit" value="确认订单" style="font-size:25px; background:grey"/></div>
		</form>
	</div>
	
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
