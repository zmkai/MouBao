<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <base href="<%=basePath%>">
    
    <title>买家登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<link rel="stylesheet" href="css/com.css" >
	<link rel="stylesheet" href="css/login.css">
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript">
		function load(){
			var loginResult = "${loginResult}";
			if(loginResult!=""){
				document.getElementById("login_hint_box").style.display = "block";
				document.getElementById("login_hint_box").innerHTML = loginResult;
			}
		}
	</script>
  </head>
  <body onload="load()">
	<div class="header">
		<img alt="logo" src="img/logo.png" id="header_logo" />
		<div id="headerInfo">为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持！</div>
		<a><img src="img/login_header_suggest.png">"登录页面"改进意见</a>
	</div>
	<div class="login_box">
		<div class="login_content"><%--  该盒子居中，页面缩放图片和登录始终居中--%>
			<img src="img/login_body_bg.png">
			<div class="login">
				<span id="loginfont">密码登录</span>
				<div id="login_hint_box">
				</div>
				<img src="img/login_body_sm.png" id="smimg">
				<img src="img/login_body_smadv.png" id="smadvimg">
				<form action="" id="loginForm" method="post">
					<img src="img/input_nameimg.png" id="nameimg">
					<img src="img/input_pwdimg.png" id="pwdimg">
					<input type="text" name="user.username" class="login_input input_name" placeholder="会员名/邮箱/手机号"/>
					<input type="text" name="user.password" class="login_input input_pwd"/>
					<input type="hidden" name="user.type"  value="1"/>
					<input type="button" value="登  录" onclick="login()" class="input_btn">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
  </body>
</html>
