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
    
    <title>买家-商品详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/com.css">
	<link rel="stylesheet" href="css/sellCommon.css">
	<link rel="stylesheet" href="css/firstPage.css">
	<link rel="stylesheet" href="css/productInfo.css">
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<script type="text/javascript" src="js/sellAccountManager.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".addnum_btn").click(function(){
				
				var saleNum = Number($("#saleNum").val())+1;
				$("#saleNum").val(saleNum);
				var price = ${product.price}
				$("#productprice").val(Number(saleNum)*price);
			});
			$(".subnum_btn").click(function(){
				var saleNum = Number($("#saleNum").val())-1;
				if(saleNum!=1){
					$("#saleNum").val(saleNum);
					var price = ${product.price}
					$("#productprice").val(Number(saleNum)*price);
				}else{
					$("#saleNumDiv").html("购买数量不能小于1");
				}
			});
		})
		function myload(){
			var msg = "<%=msg%>";
			if(msg!=null && msg!="null"){
				alert(msg);
			}
		}
	</script>
  </head>
  
  <body onload="myload()">
    <jsp:include page="/WEB-INF/jsp/buyer/commonHeader.jsp"></jsp:include>
    
    <div class="first_banner">
  		<div class="first_banner_content">
  			<img src="img/logo.png">
  			
  			<div class="banner_right">
  				<input type="text" class="banner_input">
  				<input type="button" value="搜索本店" class="banner_btn">
  			</div>
  		</div>
  	</div>
  	<div class="menu_box">
  		<div class="menu_content">
  			<a>首页</a>
  			<a>所有产品</a>
  			<a>热卖推荐</a>
  			<a>新品上市</a>
  			<a>收藏店铺</a>
  		</div>
  	</div>
  	<div class="product_content">
  		<form action="buyerAction!addGwc.action" method="post">
  			<input type="hidden" name="product.userId" value="<s:property value="product.userId"/>" />
  			<input type="hidden" name="product.id" value="<s:property value="product.id"/>" />
  			<input type="hidden" name="product.price" value="<s:property value="product.price"/>"  id="productprice"/>
	  		<img src="${product.picUrl}" class="product_img">
	  		<div class="product_info">
	  			<h4>&nbsp;&nbsp;<s:property value="product.name"/></h4>
	  			<div class="product_price">
	  				&nbsp;&nbsp;价格：&nbsp;&nbsp;&nbsp;&nbsp;<h1>￥<s:property value="product.price"/></h1><br>
	  				&nbsp;&nbsp;运费：&nbsp;&nbsp;&nbsp;&nbsp;快递0.0元
	  			</div>
	  			
	  			<div class="num_box">
	  				&nbsp;&nbsp;数量：&nbsp;&nbsp;&nbsp;&nbsp;
	  				<input type="text" value="1" class="input_num" name="product.num" id="saleNum"/>
	  				<img src="img/add_arrow.png" class="addnum_btn">
	  				<img src="img/sub_arrow.png" class="subnum_btn">
	  				件<div id="saleNumDiv" class="msgDiv"></div>
	  			</div>
	  			
	  			<br>
	  			<input type="submit" value="加入购物车" class="buy_btn" />
	  		</div>
  		</form>
  		
  		<div class="des_box">
  			<div class="des_title">商品介绍：</div>
  			<s:property value="product.description"/>
  		</div>
  	</div>
    
     <jsp:include page="../footer.jsp"></jsp:include>
  </body>
</html>
