<%@page import="un.dez.easybuy.entity.*"%>
<%@page import="un.dez.easybuy.dao.IProductdao"%>
<%@page import="un.dez.easybuy.biz.Factory"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Cookie[] cookies=request.getCookies();
	String pids=null;
	for(Cookie c:cookies)
	{
		if("pid".equals(c.getName()))
		{
			pids=c.getValue();
		}
	}
	//out.print(pids);
	List<Product> products=null;
	if(pids!=null&&!"".equals(pids))
	{
		pids=java.net.URLDecoder.decode(pids,"utf-8");
		String[] pidArr=pids.split(",");
		IProductdao pd=Factory.getProductdao();
		products=new ArrayList<Product>();
		for(String pid:pidArr)
		{
			int id=Integer.parseInt(pid);
			Product p=pd.getProductById(id);
			products.add(p);
		}
	}
	request.setAttribute("products", products);
	

 %>
<div class="last-view">
			<h2>最近浏览</h2>
			
			<dl class="clearfix">
			<c:if test="${products!=null }">
				<c:forEach items="${products }" var="p">
					<dt><img src="${pageContext.request.contextPath }/${p.epFileName}" width="54px" height="45px" /></dt>
					<dd><a href="${pageContext.request.contextPath }/product/_view?epId=${p.epId}">${p.shortEpName }</a></dd>
				</c:forEach>	
			</c:if>	
			<c:if test="${products==null }">
				暂未浏览记录
			</c:if>
			</dl>
			

		</div>