<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/function-manage.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/md5.js"></script>
<script type="text/javascript">
var xhr;
var msgBox;
function CheckForm(frm){
	var pwd=document.getElementById("newpass").value;
	pwd=hex_md5(hex_md5(pwd));
	pwd=pwd.substr(8,16);
	document.getElementById("newpass").value=pwd;
	var repass=document.getElementById("repass").value;
	repass=hex_md5(hex_md5(repass));
	repass=repass.substr(8,16);
	document.getElementById("repass").value=repass;
	
	var els = frm.getElementsByTagName("input");
	for(var i=0; i<els.length; i++) {
		if(typeof(els[i].getAttribute("onblur")) == "function") {
			if(!CheckItem(els[i])){
			alert("验证失败！");
			 return false;}
		}
	}
	
	
	return true;
}
function FocusItem(obj){
obj.parentNode.parentNode.className = "current";
    var msgBox1 = obj.parentNode.getElementsByTagName("span")[0];
	msgBox1.innerHTML = "";
	msgBox1.className = "";
}
function CheckItem(obj){
obj.parentNode.parentNode.className = "";
msgBox = obj.parentNode.getElementsByTagName("span")[0];
switch(obj.name){
case "oldpass":
if(obj.value == "") {
				msgBox.innerHTML = "请输入原密码！";
				msgBox.className = "error";
				return false;
			}
else{
var pwd=document.getElementById("oldpass").value;

	pwd=hex_md5(hex_md5(pwd));
	pwd=pwd.substr(8,16);

			if (window.XMLHttpRequest)
 			{// code for Firefox, Opera, IE7, etc.
  				xhr=new XMLHttpRequest();
  			}
			else if (window.ActiveXObject)
  			{// code for IE6, IE5
  				xhr=new ActiveXObject("Microsoft.XMLHTTP");
  			}

xhr.open("post","<%=request.getContextPath()%>/user/user_checkpwd?pwd="+pwd,true);
xhr.onreadystatechange=callback;
xhr.send(null);
}
break;
case "newpass":
			if(obj.value == "") {
				msgBox.innerHTML = "请输入新密码！";
				msgBox.className = "error";
				return false;
			}
			break;
case "repass":
			if(obj.value == "") {
				msgBox.innerHTML = "请再次输入密码！";
				msgBox.className = "error";
				return false;
			} else if(obj.value != document.getElementById("newpass").value) {
				msgBox.innerHTML = "两次输入的密码不一致！";
				msgBox.className = "error";
				return false;
			}
			break;
}
return true;
}
function callback(){
if(xhr.readyState==4&&xhr.status==200){
if(xhr.responseText!="true"){
msgBox.innerHTML = "输入的原始密码错误！";
msgBox.className = "error";
return false;
}
}
}
</script>
</head>
<body>
<jsp:include page="/inc/view_top.jsp" >
	<jsp:param value="3" name="nowMenu"/>
</jsp:include>
<div id="main" class="wrap">
	<jsp:include page="/inc/user_left.jsp" ></jsp:include>
	<div class="main">
		<h2>修改密码</h2>
		<div class="manage">
		<form id="passForm" action="<%=request.getContextPath() %>/user/user_updatePwd" method="post"  onsubmit="return CheckForm(this);">
		<table>
		<tr>
						<td class="field">原始密码：</td>
						<td><input class="text" type="password" id="oldpass" name="oldpass" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span style="color:red"></span></td>
					</tr>
		<tr>
						<td class="field">新密码：</td>
						<td><input class="text" type="password" id="newpass" name="newpass" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span style="color:red"></span></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input class="text" type="password" id="repass" name="repass" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span style="color:red"></span></td>
					</tr>
		<tr><td></td><td><input type="submit" value="修改密码"/></td></tr>
		</table>
		</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<jsp:include page="/inc/footer.jsp" ></jsp:include>
</body>
</html>
