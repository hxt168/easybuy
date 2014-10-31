<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function del(oid)
	{
		if(confirm("确定要删除吗？")) {
		location.href = "${pageContext.request.contextPath}/order/manage_del?oid=" + oid;
		}
	}
	function checkDate()
	{
		var date1=document.getElementById("date1").value;
		var date2=document.getElementById("date2").value;
		if(date1>date2)
		{
			alert("开始日期不能大于结束日期");
			return false;
		}
		return true;
	}

</script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="3" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				<form action="" method="get" onsubmit="return checkDate()">
				状态：<select name="eoStatus">
					<option value="">=选择=</option>
					<option <c:if test="${param.eoStatus==1}">selected="selected"</c:if> value="1">下单</option>
					<option <c:if test="${param.eoStatus==2}">selected="selected"</c:if> value="2">审核通过</option>
					<option <c:if test="${param.eoStatus==3}">selected="selected"</c:if> value="3">配货</option>
					<option <c:if test="${param.eoStatus==4}">selected="selected"</c:if> value="4">送货中</option>
					<option <c:if test="${param.eoStatus==5}">selected="selected"</c:if> value="5">收获并确认</option>
				</select>	订单地址：<input type="text" class="text" value="${eoUserAddress }" name="eoUserAddress" /> 订货人：<input type="text" class="text" name="eoRealName" value="${eoRealName }" />
				
				 <br/>
				  <br/>
		开始日期 : <input class="Wdate" id="date1" name="date1" value="${param.date1 }" type="text" onClick="WdatePicker()"> 结束日期 : <input class="Wdate" id="date2" name="date2" value="${param.date2 }" type="text" onClick="WdatePicker()">&nbsp;&nbsp;&nbsp; <label class="ui-blue"><input type="submit" name="submit" value="查询" /></label>
				</form>
			</div>
			<div class="spacer"></div>
			<table class="list">
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>发货地址</th>
					<th>订购时间</th>
					<th>总金额</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${orderlist.data}" var="order">
				<tr>
					<td class="first w4 c">${order.eoId }</td>
					<td class="w1 c">${order.eoRealName }</td>
					<td>${order.eoUserAddress }</td>
					<td class="w1 c">${order.formatDate }</td>
					<td class="w1 c">${order.eoCost }</td>
					<td class="w1 c">${order.status }</td>
					<td class="w1 c"><a href="${pageContext.request.contextPath}/order/manage_modify?oid=${order.eoId}">修改</a> <a href="javascript:del(${order.eoId});">删除</a></td>
				</tr>
			</c:forEach>
			</table>
			<div class="pager">
				<ul class="clearfix">
					<jsp:include page="/inc/pager.jsp">
	    				<jsp:param value="${orderlist.totalRecord}" name="items"/>
	    				<jsp:param value="${orderlist.pageSize}" name="pageSize"/>
	    				<jsp:param value="${orderlist.totalpage}" name="totalPage"/>
	    				<jsp:param value="${nowUrl}" name="url"/>
	 
    				</jsp:include>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
