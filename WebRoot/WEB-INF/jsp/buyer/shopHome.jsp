<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>买家-浏览商品</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/com.css">
<link rel="stylesheet" href="css/sellCommon.css">
<link rel="stylesheet" href="css/firstPage.css">
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="js/sellAccountManager.js"></script>
</head>

<body bgcolor="#fafafa">
	<jsp:include page="/WEB-INF/jsp/buyer/commonHeader.jsp"></jsp:include>

	<div class="first_banner">
		<div class="first_banner_content">
			<img src="img/logo.png">
			<div class="banner_right">
				<input type="text" class="banner_input"> <input
					type="button" value="搜索" class="banner_btn">
			</div>
		</div>
	</div>
	<div class="body_content">
		<div class="select_condition">已选条件：&nbsp;&nbsp;&nbsp;</div>
		<div class="input_condition_box">
			<div class="total_order">综合排序</div>
			<div class="input_condition">
				销量<img src="img/arrow_down_gray.png">
			</div>
			<div class="input_condition" style="width:200px">
				价格<img src="img/arrow_down_gray.png"> <input type="text"
					placeholder="￥" name="lowprice" class="small_input"> - <input
					type="text" placeholder="￥" name="highprice" class="small_input">
			</div>
			<div class="input_condition" style="width:140px">
				发货地：&nbsp;&nbsp;
				<div class="location_condition">不限</div>
				<div class="location_btn">
					<img src="img/arrow_down_gray.png">
				</div>
			</div>
			<div class="input_condition_right">
				&nbsp;&nbsp;<input type="checkbox" name="tb_box">&nbsp;&nbsp;淘宝&nbsp;&nbsp;
				&nbsp;&nbsp;<input type="checkbox" name="tm_box">&nbsp;&nbsp;天猫&nbsp;&nbsp;
				&nbsp;&nbsp;<input type="checkbox" name="by_box">&nbsp;&nbsp;包邮&nbsp;&nbsp;
				&nbsp;&nbsp;<input type="checkbox" name="zpbz_box">&nbsp;&nbsp;正品保障&nbsp;&nbsp;
				<div class="multi_location_btn">
					<img src="img/arrow_down_gray.png">
				</div>
			</div>
		</div>

		<div class="product_box">
			<s:iterator value="proList" id="temp" status="st">
				<div class="item_product_box">
					<a
						href="buyerAction!productInfo.action?productId=<s:property value="#temp.id"/>">
						<img src="${temp.picUrl}"> </a>
					<div class="product_title">
						<a
							href="buyerAction!productInfo.action?productId=<s:property value="#temp.id"/>"><s:property
								value="#temp.name" /> </a>
					</div>
					<div class="product_info">
						￥ <span class="product_price"><s:property
								value="#temp.price" /> </span>
						<div class="product_location">
							<s:property value="#temp.location" />
						</div>
					</div>
				</div>
			</s:iterator>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
