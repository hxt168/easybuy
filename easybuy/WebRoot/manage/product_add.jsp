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
	
	function check()
	{
		var num=document.getElementById("epProductNum").value;
		var epName=document.getElementById("epName").value;
		var cg=document.getElementById("cg").value;
		var epPrice=document.getElementById("epPrice").value;
		var epStock=document.getElementById("epStock").value;
		var photo=document.getElementById("photo").value;
		if(num=="")
		{
			document.getElementById("msg").innerHTML="商品编码不能为空";
			return false;
		}
		if(epName=="")
		{
			document.getElementById("msg").innerHTML="商品名称不能为空";
			return false;
		}
		if(cg=="")
		{
			document.getElementById("msg").innerHTML="商品类别不能为空";
			return false;
		}
		if(photo=="")
		{
			document.getElementById("msg").innerHTML="图片不能为空";
			return false;
		}
		if(epPrice=="")
		{
			document.getElementById("msg").innerHTML="商品价格不能为空";
			return false;
		}
		if(isNaN(epPrice))
		{
			document.getElementById("msg").innerHTML="商品价格要为数字";
			return false;
		}
		if(isNaN(epStock))
		{
			document.getElementById("msg").innerHTML="商品库存要为数字";
			return false;
		}
		if(epStock=="")
		{
			document.getElementById("msg").innerHTML="商品库存不能为空";
			return false;
		}
		return true;
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
		<h2>添加商品</h2>
		<div class="manage">
		
			<form action="${pageContext.request.contextPath }/product/manage_doadd" method="post" enctype="multipart/form-data" onsubmit="return check()" >
				<table class="form">
					<tr>
						<td class="field">商品编号：：</td>
						<td><input id="epProductNum" type="text" class="text" name="epProductNum" /></td>
					</tr>
					<tr>
						<td class="field">商品名称：</td>
						<td><input id="epName" type="text" class="text" name="epName" value="" /></td>
					</tr>
					<tr>
						<td class="field">所属分类：</td>
						<td>
							一级目录：
							<select id="pc" class="text" onchange="changeDis()" name="pid">
								<option value="">==请选择==</option>
										<c:forEach items="${pclist}" var="pc">
											
														<option value="${pc.epcParentId }">${pc.epcParentName }</option>
												
										
										</c:forEach>
									</select>
		二级目录：
					<select id="cg" class="text" name="cid" >
										<option value="">==请选择==</option>
                            			<c:forEach items="${pclist}" var="pc">
                            				
                            				<c:if test="${pc.epcParentId==param.pid}">
                            					<c:forEach items="${pc.list }" var="cg">
		                           						
																	<option value="${cg.epcId }">${cg.epcName }</option>
															
                           						</c:forEach>
                           					</c:if>
                           				</c:forEach>
                           			</select>
						</td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><input id="photo" type="file" class="text" name="photo" /></td>
					</tr>
					<tr>
						<td class="field">商品价格：</td>
						<td><input id="epPrice" type="text" class="text tiny" name="epPrice" /> 元</td>
					</tr>
					
					
					<tr>
						<td class="field">库存：</td>
						<td><input id="epStock" type="text" class="text tiny" name="epStock" /></td>
					</tr>
					<tr>
						<td class="field">内容：</td>
						<td><textarea name="epDescription" class="xheditor" cols="9" rows="200"></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label> <font id="msg" color="red"></font></td>
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
