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
    
    <title>商家中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/com.css">
	<link rel="stylesheet" href="css/saleCommon.css">
	<link rel="stylesheet" href="css/saleBaby.css">
	
	
  </head>
  
  <body>
  	<jsp:include page="/WEB-INF/jsp/sale/commonHeader.jsp"></jsp:include>
  	
  	<div class="content_box">
  		<jsp:include page="/WEB-INF/jsp/sale/commonMenu.jsp"></jsp:include>
  		<div class="sale_baby">
  		</div>
  	</div>
  	
    <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
  </body>
</html>
