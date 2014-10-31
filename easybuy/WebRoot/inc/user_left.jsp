<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><a href="${pageContext.request.contextPath}/user/user_modifyUser">信息修改</a></dd>
				<dd><a href="${pageContext.request.contextPath}/user/user_password">密码修改</a></dd>
                 <dt>订单查看</dt>
				<dd><a href="${pageContext.request.contextPath}/order/user_list">订单查看</a></dd>
				
				<dt>留言查看</dt>
				<dd><a href="${pageContext.request.contextPath}/comment/list">留言查看</a></dd>
				<dt>新闻查看</dt>
				<dd><a href="${pageContext.request.contextPath}/news/list">新闻查看</a></dd>
			</dl>
		</div>
	</div>