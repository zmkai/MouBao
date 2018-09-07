<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <head>
    <base href="<%=basePath%>">
    
    <title>卖家发布宝贝</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/com.css">
	<link rel="stylesheet" href="css/saleCommon.css">
	<link rel="stylesheet" href="css/babyStyle.css">
	<script type="text/javascript" src="js/baby.js"></script>
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/jsp/sale/commonHeader.jsp"></jsp:include>
  	
  	<div class="content_box">
  		<jsp:include page="/WEB-INF/jsp/sale/commonMenu.jsp"></jsp:include>
  		<div class="body_right_box"> 
  			<div class="baby_title">我是卖家&nbsp;&gt;&nbsp;宝贝管理&nbsp;&gt;&nbsp;发布宝贝</div>
			<table class="baby_table">
				<s:form theme="simple" method="post" enctype="multipart/form-data" action="babyManagerAction!addBaby.action" onsubmit="return checkBaby()">
				<tr>
					<td>宝贝名称：</td>
					<td><s:textfield  name="product.name" cssClass="baby_input"></s:textfield ><div id="nameDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>宝贝类别：</td>
					<s:set var="typeList" value="#{'女装/男装':'女装/男装','鞋靴/箱包':'鞋靴/箱包','童装玩具':'童装玩具','家电/数码':'家电/数码'}"></s:set>
					<td><s:select name="product.type" list="typeList" headerKey="" headerValue="选择宝贝的类别" cssClass="baby_select"></s:select><div id="typeDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>宝贝价格：</td>
					<td><s:textfield  name="product.price" cssClass="baby_input"></s:textfield ><div id="priceDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>宝贝数量：</td>
					<td><s:textfield  name="product.num" cssClass="baby_input"></s:textfield ><div id="numDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>宝贝图片：</td>
					<td><s:file  name="photo"></s:file><div id="photoDiv" class="msgDiv"></div></td>
				</tr>
				<tr>
					<td>宝贝描述：</td>
					<td><s:textarea  name="product.description" cols="50" rows="15"></s:textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<s:submit value="提交" cssClass="baby_btn"></s:submit><s:reset value="重置" cssClass="baby_btn"></s:reset>
					</td>
				</tr>
				</s:form>
			</table>
  		</div>
  	</div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
  </body>
</html>
