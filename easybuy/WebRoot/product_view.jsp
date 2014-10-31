<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String pid=request.getParameter("epId");
request.setAttribute("pid", pid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/function.js"></script>
<script type="text/javascript">
	addProductId("${product.epId}");
	
	function addShopping(id)
	{
		var xhr=null;
		 if (window.XMLHttpRequest)
		{// code for Firefox, Opera, IE7, etc.
 				xhr=new XMLHttpRequest();
 		}
		else if (window.ActiveXObject)
 		{// code for IE6, IE5
 				xhr=new ActiveXObject("Microsoft.XMLHTTP");
 		}
		xhr.open("post", "/easybuy/shopping/addDetailShopping?pid="+id,true);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200)
			{
				//alert(xhr.responseText);
				if(xhr.responseText=="true")
				{
					
					document.getElementById("msgs").innerHTML="加入成功";
				}else{
					//document.getElementById("erro").innerHTML="用户名或密码错误";
				}
			}
		};
		xhr.send(null);
	}
	
</script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" >
	<jsp:param value="${product.category.parentCategory.epcParentId}" name="parentId"/>
</jsp:include>
<div id="position" class="wrap">
	您现在的位置：<a href="${pageContext.request.contextPath }/index.jsp">易买网</a> &gt; <a href="product/_list?${product.category.parentCategory.epcParentId}">${product.category.parentCategory.epcParentName}</a> &gt;${product.category.epcName}
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="/inc/category_left.jsp" ></jsp:include>
	</div>
	<div id="product" class="main">
		<h1>${product.epName}</h1>
		<div class="infos">
			<div class="thumb"><img src="<%=path %>${product.epFileName}" height="280px" width="250px" /></div>
			<div class="buy">
				
				<c:choose>
				<c:when test="${product.epIsPromote==1}">
				<p>特价：
				<span class="price"style="color:red;">￥${product.epPromotePrice}</span>
				商城价：
				<span  style="text-decoration:line-through">￥${product.epPrice}</span></p>
				</c:when>
				<c:otherwise>
				<p>价格：
				<span class="price"style="color:red;">￥${product.epPrice}</span></p>
				</c:otherwise>
				</c:choose>
				<p>库          存：${product.epStock} </p>
				<p>销   售  量：${product.epSellAmount}</p>
				<p>上架时间：${product.formatDate}</p>
				<p>商品编号：${product.epProductNum}</p>
				<div class="button"><input type="button" name="button" value="" onclick="goBuy(${product.epId})" /><a href="javascript:addShopping(${product.epId});" >放入购物车</a><font id="msgs" color="red"></font></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品详情</strong></h2>
			<div class="text">
				${product.epDescription}
			</div>
			<h2><strong>购买记录</strong></h2>
			<div >
			<table width="100%" style="text-align:center">
			<tr style="line-height:30px; font-size:15px;"><th>&nbsp;购买人</th><th>数量</th><th>单价</th><th>时间</th></tr>
		
				<c:forEach items="${pager.data }" var="des" >
				<tr><td>${des.order.eoUser.euUserName }</td><td>${des.eodQuantity }</td><td>￥：${des.eodCost }</td><td>${des.order.formatDate }</td></tr>
				</c:forEach>
			
			<c:if test="${isnull==1 }">
					<tr align="center"><td colspan="4">暂无购买记录</td></tr>
			</c:if>
			</table>
		
				<div class="pager">
				<ul class="clearfix">
					<jsp:include page="/inc/pager.jsp">
	    				<jsp:param value="${pager.totalRecord}" name="items"/>
	    				<jsp:param value="${pager.pageSize}" name="pageSize"/>
	    				<jsp:param value="${pager.totalpage}" name="totalPage"/>
	    				<jsp:param value="${nowUrl}" name="url"/>
    				</jsp:include>
				</ul>
			    </div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
