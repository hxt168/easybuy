<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/xhe/jquery/jquery-1.4.4.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/xhe/xheditor-1.1.14-zh-cn.min.js" ></script>
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

</script>
</head>
<body>
<jsp:include page="/inc/manage_top.jsp" >
	<jsp:param value="2" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/manage_left.jsp" ></jsp:include>
	<div class="main">
		<h2>修改商品</h2>
		<div class="manage">
		
		<form action="${pageContext.request.contextPath }/product/manage_domodify" method="post" enctype="multipart/form-data" >
				<table class="form">
					<tr>
						<td class="field">商品编号：</td>
						<td><input type="hidden" name="epId" value="${pro.epId }"  /><input type="text" class="text" name="epProductNum" value="${pro.epProductNum }" /></td>
					</tr>
					<tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="epName" value="${pro.epName }" /></td>
					</tr>
					<tr>
						<td class="field">所属分类：</td>
						<td>
							一级目录：
							<select id="pc" class="text" onchange="changeDis()" name="pid">
								
										<c:forEach items="${pclist}" var="pc">
											<c:choose>
												<c:when test="${pc.epcParentId==pro.category.parentCategory.epcParentId }">
													<option value="${pc.epcParentId }" selected="selected">${pc.epcParentName }</option>
												</c:when>
												<c:otherwise>
														<option value="${pc.epcParentId }">${pc.epcParentName }</option>
												</c:otherwise>
										
											</c:choose>
										
										</c:forEach>
									</select>
		二级目录：
					<select id="cg" class="text" name="cid" >
                            			<c:forEach items="${pclist}" var="pc">
                         
                            				<c:if test="${pc.epcParentId==pro.category.parentCategory.epcParentId}">
                            					<c:forEach items="${pc.list }" var="cg">
		                           						<c:choose>
															<c:when test="${cg.epcId==pro.category.epcId }">
																<option value="${cg.epcId }" selected="selected">${cg.epcName }</option>
															</c:when>
															<c:otherwise>
																	<option value="${cg.epcId }">${cg.epcName }</option>
															</c:otherwise>
												
														</c:choose>
                           						</c:forEach>
                           					</c:if>
                           				</c:forEach>
                           			</select>
						</td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><input type="hidden" name="fileName" value="${pro.fileName}" /><input type="file" class="text" name="photo" /></td>
					</tr>
					<tr>
						<td class="field">商品价格：</td>
						<td><input type="text" class="text tiny" name="epPrice" value="${pro.epPrice }" /> 元</td>
					</tr>
					
					
					<tr>
						<td class="field">库存：</td>
						<td><input type="text" class="text tiny" name="epStock" value="${pro.epStock }" /></td>
					</tr>
					<tr>
						<td class="field">是否促销：</td>
						<td><select name="epIsPromote">
						<c:if test="${pro.epIsPromote==0 }">
							<option selected="selected" value="0">不促销</option>
							<option value="1">促销</option>
					</c:if>
					<c:if test="${pro.epIsPromote==1 }">
						<option value="0">不促销</option>
						<option selected="selected" value="1">促销</option>
					</c:if>
					</select></td>
					</tr>
					<tr>
						<td class="field">促销价：</td>
						<td><input type="text" class="text tiny" name="epPromotePrice" value="${pro.epPromotePrice }" /></td>
					</tr>
					<tr>
						<td class="field">内容：</td>
						<td><textarea name="epDescription" class="xheditor" cols="9" rows="200">${pro.epDescription }</textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="修改" /></label></td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
