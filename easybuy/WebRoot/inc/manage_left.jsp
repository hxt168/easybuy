<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><em><a href="${pageContext.request.contextPath}/user/manage_add">新增</a></em><a href="${pageContext.request.contextPath}/user/manage_userlist">用户管理</a></dd>
				<dt>商品信息</dt>
				<dd><em><a href="${pageContext.request.contextPath}/category/manage_add">新增</a></em><a href="${pageContext.request.contextPath}/category/manage_list">分类管理</a></dd>
				<dd><em><a href="${pageContext.request.contextPath}/product/manage_add">新增</a></em><a href="${pageContext.request.contextPath}/product/manage_list">商品管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="${pageContext.request.contextPath}/order/manage_list">订单管理</a></dd>
				<dt>留言管理</dt>
				<dd><a href="${pageContext.request.contextPath}/comment/manage_list">留言管理</a></dd>
				<dt>新闻管理</dt>
				<dd><em><a href="${pageContext.request.contextPath}/news/manage_add">新增</a></em><a href="${pageContext.request.contextPath}/news/manage_list">新闻管理</a></dd>
			</dl>
		</div>
	</div>