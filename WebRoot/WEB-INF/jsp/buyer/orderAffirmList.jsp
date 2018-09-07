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
    
    <title>确认订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/com.css">
	<link rel="stylesheet" href="css/sellCommon.css">
	<link rel="stylesheet" href="css/firstPage.css">
	<link rel="stylesheet" href="css/dingDanStyle.css">
	<link rel="stylesheet" href="css/gwcStyle.css">
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<script type="text/javascript" src="js/sellAccountManager.js"></script>
	<script type="text/javascript">
		$(function(){
			//选择地址改变时，将新的地址放入到底部
			$(".addressBox input:radio").click(function(){
				$(".defaultAddress").removeClass("defaultAddress");
				$(this).parent().addClass("defaultAddress");
				
				$("#toAddress").html($(this).siblings(".selectAddress").html());
				$("#toPerson").html($(this).siblings(".selectUsername").html()+"&nbsp;&nbsp;&nbsp;"+$(this).siblings(".selectTel").html());
			});
			
			$(".submitBtn").click(function(){
				document.getElementById("comForm").action = "buyerAction!submitDingDan.action";
				document.getElementById("comForm").submit();
			});
		})
		
		//进入页面时，将选中的地址赋值到底部
		function myload(){
			$("#toAddress").html($(".defaultAddress").children(".selectAddress").html());
			$("#toPerson").html($(".defaultAddress").children(".selectUsername").html()+"&nbsp;&nbsp;&nbsp;"+$(".defaultAddress").children(".selectTel").html());
		}
	</script>
	

  </head>
  
  <body onload="myload()">
    <jsp:include page="/WEB-INF/jsp/buyer/commonHeader.jsp"></jsp:include>
  	<div class="first_banner">
  		<div class="first_banner_content">
  			<img src="img/logo.png">
  			<div class="banner_right">
  				<img src="img/dingdan.png">
  			</div>
  		</div>
  	</div>
  	
    <div id="contentBox" >
    	<s:form id="comForm" method="post">
	    <div class="confirmAdress">
	    	<span class="ddTitle">确认收货地址</span>
	    	<a class="manageAddress" href="buyerAction!preAccountManager.action">管理收货地址</a>
	    </div>
		<table class="addressBox">
			<s:iterator value="list" id="addressTemp">
				<tr>
				<s:if test="#addressTemp.flag==1">
					<td class="defaultAddress">
						<input type="radio" name="addressId" value="<s:property value="#addressTemp.id"/>" checked="checked">
						<span class="selectAddress"><s:property value="#addressTemp.address"/></span>&nbsp;&nbsp;&nbsp;
						(<span class="selectUsername"><s:property value="#addressTemp.username"/></span>)&nbsp;&nbsp;&nbsp;
						<span class="selectTel"><s:property value="#addressTemp.telephone"/></span>
					</td>
				</s:if>
				<s:else>
					<td>
						<input type="radio" name="addressId" value="<s:property value="#addressTemp.id"/>">
						<span class="selectAddress"><s:property value="#addressTemp.address"/></span>&nbsp;&nbsp;&nbsp;
						(<span class="selectUsername"><s:property value="#addressTemp.username"/></span>)&nbsp;&nbsp;&nbsp;
						<span class="selectTel"><s:property value="#addressTemp.telephone"/></span>
					</td>
				</s:else>
				</tr>
			</s:iterator>
		</table>
	 	<div class="confirmAdress">
	    	<span class="ddTitle">确认订单信息</span>
	    </div>
	    
	    <div class="productTitle" style="margin-top:10px;margin-bottom: -18px">
			<div class="column t-checkbox">商品图片</div>
			<div class="column t-product">商品名称</div>
			<div class="column t-price">单价</div>
			<div class="column t-num">数量</div>
			<div class="column t-money">小计</div>
		</div>
		<div id="contentBox">
			<s:iterator value="productVoList" id="protemp">
				<input type="hidden" name="spIdCheckBox"  value="<s:property value="#protemp.id"/>"/>
				<div class="item">
					<div class="itemcolumn t-checkbox">
						<img src="${protemp.picUrl}" /> 
					</div>
					<div class="itemcolumn t-product">
						<span><a><s:property value="#protemp.name"/> </a> </span><br>
						<img src="img/seven.png" title="支持七天无理由退换货"/>
					</div>
					
					<div class="itemcolumn t-price">
						￥<span id="perPrice<s:property value="#protemp.id"/>"><s:property value="#protemp.perPrice"/></span>
					</div>
					<div class="itemcolumn t-num">
						<s:property value="#protemp.saleNum"/>
					</div>
					<div class="itemcolumn t-money">
						<span id="totalPrice<s:property value="#protemp.id"/>"><s:property value="#protemp.totalPrice"/></span>
					</div>
				</div>
			</s:iterator>
		</div>
		
		<div class="submitDingDan">
			<b>实付款：</b><span id="realPrice">￥<s:property value="realPrice"/> </span><br>
			<b>寄送至：</b><span id="toAddress"></span><br>
			<b>收货人：</b><span id="toPerson"></span>
		</div>
		</s:form>
		<div class="submitBtn">提交订单</div>
    </div>
    
	<jsp:include page="../footer.jsp"></jsp:include>
  </body>
</html>
