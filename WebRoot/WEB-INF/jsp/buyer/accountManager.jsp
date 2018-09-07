<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>账户管理-地址管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/com.css">
	<link rel="stylesheet" href="css/sellCommon.css">
	<link rel="stylesheet" href="css/accountStyle.css">
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<script type="text/javascript" src="js/buyerAccountManager.js"></script>
	<script type="text/javascript">
		function myload(){
			var msg = "<%=msg%>";
			if(msg!=null && msg!="null"){
				alert(msg);
			}
		}
		$(function(){
			$(".default_address_box").hover(
				function(){
					$(this).children(".set_default_box").addClass("set_default_box_on");
				},
				function(){
					$(this).children(".set_default_box").removeClass("set_default_box_on");
				}
			);
		})
	</script>
  </head>
  
  <body onload="myload()">
    <jsp:include page="/WEB-INF/jsp/buyer/commonHeader.jsp"></jsp:include>
  	<div class="account_banner">
  		<div class="account_banner_content">
  			<img src="img/mylogo.png">
  			<a href="sellerAction!firstPage.action" class="banner_firstpage">首页</a>
  			<div class="banner_right">
  				<input type="text" class="banner_input">
  				<input type="button" value="搜索" class="banner_btn">
  			</div>
  		</div>
  	</div>
  	
  	<div class="body_box">
  		<div class ="body_left">
  			<img src="img/seller_photo.png"><br>
  			<font color="#ffb34f"> 账号管理</font> 
  			<ul>
  				<li><a >安全设置</a></li>
  				<li><a >个人资料</a></li>
  				<li><a >个人成长设置</a></li>
  				<li><a >支付宝绑定设置</a></li>
  				<li><a ><font color="#ffb34f">收货地址</font></a></li>
  			</ul>
  		</div>
  		<div class ="body_right">
  			<div class="address_title">收货地址</div>
  			<table class="add_table">
				<s:form theme="simple" method="post" action="buyerAction!addAddress.action">
				<tr>
					<td>收货人：</td>
					<td><s:textfield  name="address.username" cssClass="baby_input"></s:textfield ><div id="nameDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>收货电话：</td>
					<td><s:textfield  name="address.telephone" cssClass="baby_input"></s:textfield ><div id="typeDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>收货地址：</td>
					<td><s:textarea  name="address.address" cols="50" rows="3"></s:textarea><div id="priceDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>收货邮编：</td>
					<td><s:textfield  name="address.postId" cssClass="baby_input"></s:textfield ><div id="numDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td></td>
					<td><s:checkbox name="address.flag"></s:checkbox>设置为默认收货地址</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<s:submit value="保存" cssClass="address_btn"></s:submit>
					</td>
				</tr>
				</s:form>
			</table>
			<br>
			<font color="#ffb34f">已有地址如下：</font>
			<table class="list_talbe" width="800px" border="1px" bordercolor="#e7e7e7"  style="border-collapse:collapse;">
				<tr height="40px">
					<th width="65px">收货人</th>
					<th width="115px">收货电话</th>
					<th >收货地址</th>
					<th width="50px">邮编</th>
					<th	width="70px">操作</th>
					<th width="120px"></th>
				</tr>
				<s:iterator value="list" id="temp">
					<tr>
						<td><s:property value="#temp.username"/> </td>
						<td><s:property value="#temp.telephone"/></td>
						<td><s:property value="#temp.address"/></td>
						<td><s:property value="#temp.postId"/></td>
						<td>
							<a>修改</a>
							|
							<a href="sellerManagerAction!deleteAddress.action?addressId=<s:property value="#temp.id"/>" class="trim_a">删除</a> 
						</td>
						<td align="center">
							<div class="default_address_box">
								<s:set name="flag" value="#temp.flag"></s:set>
								<s:if test="flag==1">
									<div class="default_box">默认地址</div>
								</s:if>
								<s:else>
									<div class="set_default_box">
										<a href="sellerManagerAction!setDefault.action?addressId=<s:property value="#temp.id"/>">设为默认</a>
									</div>
								</s:else>
							</div>
						</td>
					</tr>
				</s:iterator>
			</table>
  		</div>
  	</div>
  	
    <jsp:include page="../footer.jsp"></jsp:include>
  </body>
</html>
