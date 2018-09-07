<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/com.css">
<link rel="stylesheet" href="css/sellCommon.css">
<link rel="stylesheet" href="css/accountStyle.css">
<link rel="stylesheet" href="css/gwcStyle.css">
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<script type="text/javascript" src="js/sellAccountManager.js"></script>
<script type="text/javascript">
		$(function(){
			$(".box_right ul li").click(function(){
				$(this).addClass("on");
				$(this).siblings().removeClass("on");
				var index = $(this).index();
				$(".splist_box>div").eq(index).show().siblings("div").hide();
			});
			
			$(".splist_box>div:first").show();
		});
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
	<div class="account_banner">
		<div class="account_banner_content">
			<img src="img/mylogo.png"> <a
				href="sellerAction!firstPage.action" class="banner_firstpage">首页</a>
			<div class="banner_right">
				<input type="text" class="banner_input"> <input
					type="button" value="搜索" class="banner_btn">
			</div>
		</div>
	</div>

	<div class="box">
		<div class="box_left">
			<span>全部功能</span><br> <a href="sellerAction!gwcList.action">我的购物车</a><br>
			<a href="sellerAction!mySellList.action"><font color="#ff4400">已买到的宝贝</font>
			</a>
		</div>
		<div class="box_right">
			<ul>
				<li class="on">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color="#e8e8e8">|</font>
				</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待发货&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color="#e8e8e8">|</font>
				</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待收货&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					color="#e8e8e8">|</font>
				</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待评价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
			<br>
			<hr class="fengexian">
			<table class="title">
				<tr>
					<td class="baby_item">宝贝</td>
					<td class="price_item">单价</td>
					<td class="num_item">数量</td>
					<td class="realPrice_item">实际付款</td>
					<td class="state_item">交易状态</td>
					<td class="operation_item">交易操作</td>
				</tr>
			</table>
			<div class="splist_box">
				<div>
					<!-- 所有订单 -->
					<table>
						<s:iterator value="productVoList" id="spInAll">
							<tr>
								<td class="baby_item"><img src="${spInAll.picUrl}"
									style="width: 100px;height: 100px;vertical-align: middle;">
									<s:property value="#spInAll.name" /></td>
								<td class="price_item"><s:property
										value="#spInAll.perPrice" /></td>
								<td class="num_item"><s:property value="#spInAll.saleNum" />
								</td>
								<td class="realPrice_item"><s:property
										value="#spInAll.totalPrice" /></td>
								<td class="state_item"><s:if test="#spInAll.state==1"> 
									待发货
								</s:if> <s:elseif test="#spInAll.state==2">
									待收货
								</s:elseif> <s:elseif test="#spInAll.state==3">
									待评价
								</s:elseif></td>
								<td class="operation_item"><s:if test="#spInAll.state==2">
										<a
											href="sellerAction!confirmProduct.action?sellProduct.id=<s:property value="#spInAll.id"/>">确认收货</a>
									</s:if> <s:elseif test="#spInAll.state==3">
										<a>立即评价</a>
									</s:elseif></td>
							</tr>
						</s:iterator>
					</table>
				</div>
				<div>
					<!-- 待发货 -->
					<table>
						<s:iterator value="unsendSellProductVoList" id="spInAll">
							<tr>
								<td class="baby_item"><img src="${spInAll.picUrl}"
									style="width: 100px;height: 100px;vertical-align: middle;">
									<s:property value="#spInAll.name" /></td>
								<td class="price_item"><s:property
										value="#spInAll.perPrice" /></td>
								<td class="num_item"><s:property value="#spInAll.saleNum" />
								</td>
								<td class="realPrice_item"><s:property
										value="#spInAll.totalPrice" /></td>
								<td class="state_item"><s:if test="#spInAll.state==1"> 
									待发货
								</s:if> <s:elseif test="#spInAll.state==2">
									待收货
								</s:elseif> <s:elseif test="#spInAll.state==3">
									待评价
								</s:elseif></td>
								<td class="operation_item"><s:if test="#spInAll.state==2">
										<a
											href="sellerAction!confirmProduct.action?sellProduct.id=<s:property value="#spInAll.id"/>">确认收货</a>
									</s:if> <s:elseif test="#spInAll.state==3">
										<a>立即评价</a>
									</s:elseif></td>
							</tr>
						</s:iterator>
					</table>
				</div>
				<div>
					<!-- 待收货 -->
					<table>
						<s:iterator value="unreceivedSellProductVoList" id="spInAll">
							<tr>
								<td class="baby_item"><img src="${spInAll.picUrl}"
									style="width: 100px;height: 100px;vertical-align: middle;">
									<s:property value="#spInAll.name" /></td>
								<td class="price_item"><s:property
										value="#spInAll.perPrice" /></td>
								<td class="num_item"><s:property value="#spInAll.saleNum" />
								</td>
								<td class="realPrice_item"><s:property
										value="#spInAll.totalPrice" /></td>
								<td class="state_item"><s:if test="#spInAll.state==1"> 
									待发货
								</s:if> <s:elseif test="#spInAll.state==2">
									待收货
								</s:elseif> <s:elseif test="#spInAll.state==3">
									待评价
								</s:elseif></td>
								<td class="operation_item"><s:if test="#spInAll.state==2">
										<a
											href="sellerAction!confirmProduct.action?sellProduct.id=<s:property value="#spInAll.id"/>">确认收货</a>
									</s:if> <s:elseif test="#spInAll.state==3">
										<a>立即评价</a>
									</s:elseif></td>
							</tr>
						</s:iterator>
					</table>
				</div>
				<div>
					<!-- 待评价 -->
					<table>
						<s:iterator value="uncommentSellProductVoList" id="spInAll">
							<tr>
								<td class="baby_item"><img src="${spInAll.picUrl}"
									style="width: 100px;height: 100px;vertical-align: middle;">
									<s:property value="#spInAll.name" /></td>
								<td class="price_item"><s:property
										value="#spInAll.perPrice" /></td>
								<td class="num_item"><s:property value="#spInAll.saleNum" />
								</td>
								<td class="realPrice_item"><s:property
										value="#spInAll.totalPrice" /></td>
								<td class="state_item"><s:if test="#spInAll.state==1"> 
									待发货
								</s:if> <s:elseif test="#spInAll.state==2">
									待收货
								</s:elseif> <s:elseif test="#spInAll.state==3">
									待评价
								</s:elseif></td>
								<td class="operation_item"><s:if test="#spInAll.state==2">
										<a
											href="sellerAction!confirmProduct.action?sellProduct.id=<s:property value="#spInAll.id"/>">确认收货</a>
									</s:if> <s:elseif test="#spInAll.state==3">
										<a>立即评价</a>
									</s:elseif></td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
