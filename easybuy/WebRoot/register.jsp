<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="<%=path %>/scripts/md5.js"></script>
<script type="text/javascript">
	var isNameRight=false;
	function checkName()
	{
		var ob=document.getElementById("name");
		if(CheckItem(ob))
		{
			//alert(444);
			var msgBox = ob.parentNode.getElementsByTagName("span")[0];
			var name=ob.value;
			var xhr=null;
			 if (window.XMLHttpRequest)
 			{// code for Firefox, Opera, IE7, etc.
  				xhr=new XMLHttpRequest();
  			}
			else if (window.ActiveXObject)
  			{// code for IE6, IE5
  				xhr=new ActiveXObject("Microsoft.XMLHTTP");
  			}

			if(xhr!=null)
			{
				
				xhr.open("post", "/easybuy/user/name_exist?name="+name+"&t="+Math.random(),true);
				xhr.onreadystatechange=function(){
				
					if(xhr.readyState==4)
					{
						if(xhr.status==200)
						{
							//alert(xhr.responseText);
							if(xhr.responseText=="false")
							{
								isNameRight=true;
								document.getElementById("mymsg").innerHTML = "可以注册！";
								return true;
								
							}else{
								isNameRight=false;
								document.getElementById("mymsg").innerHTML = "";
								msgBox.innerHTML = "用户名已存在！";
								msgBox.className = "error";
								return false;
							}
						}
					}
				};
				xhr.send(null);
			}
		}else
		{
			return false;
		}
		
	}
	
	function checks(ob)
	{
		if(checkForm(ob))
		{
			//checkName();
			//if(isNameRight)
			//{
			
				var pwd=document.getElementById("passWord").value;
				pwd=hex_md5(hex_md5(pwd));
				pwd=pwd.substr(8,16);
				document.getElementById("passWord").value=pwd;
				//alert(pwd);
				return true;
			//}
		}
		return false;
	}
	function loadimage(){ 
		document.getElementById("randImage").src = "<%=path %>/image.jsp?"+Math.random(); 
	}
</script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" ></jsp:include>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎注册易买网</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>填写注册信息</li>
				<li class="last"><em></em>注册成功</li>
			</ul>
			<form id="regForm" method="post" action="<%=path%>/user/_register" onsubmit="return checks(this);">
				<table>
					<tr>
						<td class="field">用户名：</td>
						<td><input class="text" type="text" id="name" name="userName" value="${userName }" onfocus="FocusItem(this)" onblur="checkName()" /> <font id="mymsg" color="green"></font><span></span></td>
					</tr>
					<tr>
						<td class="field">登录密码：</td>
						<td><input class="text" type="password" id="passWord" name="passWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input class="text" type="password" name="rePassWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">验证码：</td>
						<td><input maxlength="4" class="text verycode" type="text" name="code" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><a href="javascript:loadimage();"> <img width="60" height="25" id="randImage" align="top" src="<%=path%>/image.jsp" /></a> <span></span></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="提交注册" /></label><span style="red">${msg}</span></td>
					</tr>
				</table>
			</form>
			<span style="color:red">${msg}</span>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
