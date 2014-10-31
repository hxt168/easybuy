<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
<script type="text/javascript">
	var pc=[];
	
	${jscode}
	
	function changeDis()
	{
		var dist=document.getElementById("pc").value;	
		var st=document.getElementById("cg");
		st.length=0;
		for(var i in pc[dist])
		{
			var stp=pc[dist][i].split("-");
			st.add(new Option(stp[1],stp[0]));
		}
	}
	function sub()
	{
		var form1=document.getElementById("cate");
		form1.submit();
	}

function del(id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "${pageContext.request.contextPath}/product/manage_del?epId=" + id;
		}
}
</script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="2" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>商品管理</h2>
		<div class="manage">
		<form action="" method="get" id="cate">
		一级目录：
							<select id="pc" class="text" onchange="changeDis()" name="pid">
								<option value="">==请选择==</option>
										<c:forEach items="${pclist}" var="pc">
											<c:choose>
												<c:when test="${pc.epcParentId==param.pid }">
													<option value="${pc.epcParentId }" selected="selected">${pc.epcParentName }</option>
												</c:when>
												<c:otherwise>
														<option value="${pc.epcParentId }">${pc.epcParentName }</option>
												</c:otherwise>
										
											</c:choose>
											
											
										</c:forEach>
									</select>
		二级目录：
					<select id="cg" class="text" name="cid" onchange="sub()">
					<option value="">==请选择==</option>
                            			<c:forEach items="${pclist}" var="pc">
                            				
                            				<c:if test="${pc.epcParentId==param.pid}">
                            					<c:forEach items="${pc.list }" var="cg">
		                           						<c:choose>
															<c:when test="${cg.epcId==param.cid }">
																<option value="${cg.epcId }" selected="selected">${cg.epcName }</option>
															</c:when>
															<c:otherwise>
																	<option value="${cg.epcId }">${cg.epcName }</option>
															</c:otherwise>
												
														</c:choose>
                           						</c:forEach>
                           					</c:if>
                           				</c:forEach>
                           			</select><br /><br />
		
		</form>
			<table class="list">
				<tr>
					<th>商品编号</th>
					<th>商品名称</th>
					<th>库存</th>
					<th>销量</th>
					<th>是否促销</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pager.data }" var="pro">
				<tr>
					<td class="first w4 c">${pro.epProductNum }</td>
					<td class="thumb"><img src="../${pro.epFileName }" height="50px" width="50px" /><a href="${pageContext.request.contextPath }/product/_view?epId=${pro.epId}" target="_blank">${pro.epName }</a></td>
					<td class="w1 c">${pro.epStock }</td>
					<td class="w1 c">${pro.epSellAmount }</td>
					<c:if test="${pro.epIsPromote==1 }">
						<td class="w1 c">促销</td>
					</c:if>
					<c:if test="${pro.epIsPromote==0 }">
						<td class="w1 c">不促销</td>
					</c:if>
					<td class="w1 c"><a href="${pageContext.request.contextPath }/product/manage_modify?epId=${pro.epId}">修改</a> <a href="javascript:del(${pro.epId});">删除</a></td>
				</tr>
				</c:forEach>
			
				
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
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
