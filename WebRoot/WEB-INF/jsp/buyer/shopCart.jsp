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
    
    <title>购物车列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/com.css">
	<link rel="stylesheet" href="css/sellCommon.css">
	<link rel="stylesheet" href="css/firstPage.css">
	<link rel="stylesheet" href="css/gwcStyle.css">
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<script type="text/javascript" src="js/buyerAccountManager.js"></script>
	<script>

		function computeOver(){
			
			document.getElementById("realPrice").value = document.getElementById("computPrice").innerText;
			document.getElementById("comForm").action = "buyerAction!computeGwc.action";
			document.getElementById("comForm").submit();
		};

		$(function(){
			//点击减少数量
			var num = 1;//产品数量
			var perPrice = 0;//产品单价
			$(".numOperation").click(function(){
				var obj = $(this);
				var idName = obj.attr("id");
				var id = idName.substring(6);
				var op = obj.html();
				
				num = $("#num"+id).val();
				perPrice = $("#perPrice"+id).html();
				if(op=='+'){
					num = Number(num)+1;
				}else{
					if(num<=1){
						return;
					}else{
						num = Number(num)-1;
					}
				}
				var totalPrice = num*perPrice;
				$.ajax({
	                type: "POST",
	                url: "<%=basePath%>sellerAction!changeSaleNum.action",
	                data: {
	                	"sellProduct.id":id,
	                	"sellProduct.saleNum":num,
	                	"sellProduct.price":totalPrice,
	                },
	                dataType: "json",
	                success:
		                function(data) { 
	                		if(data==1){
	                			$("#num"+id).val(num);
		    					$("#totalPrice"+id).html(num*perPrice);
		    					//点击数量加减，计算总价格
		    					if(obj.parent().siblings(".t-checkbox").children("input:checkbox").prop("checked")){
		    						var money = $("#computPrice").html();
		    						if(op=='+'){
		    							money = Number(money)+Number(perPrice);
		    						}else{
		    							money = money-perPrice;
		    						}
		    						$("#computPrice").html(money);
		    					}
	                		}
	                    }
	            });
			});
			
			//点击全选按钮
			$(".selectAll").click(function(){
				//计算选中的记录总价格
				var money = 0;
				if($(this).prop("checked")){//所有商品被选中
					$("input:checkbox").each(function(){
						//计算总价格
						var checkClassValue = $(this).prop("class");
						if(checkClassValue=="itemCheckBox"){//去掉两个全选按钮，两个全选按钮不用算。
							money += eval($(this).parent().siblings(".t-money").children("span").html());
						}
						//将没选中选中
						if(!$(this).prop("checked")){
							$(this).prop("checked",true);
						}
					});
					$("#computPrice").html(money);
				
				}else{//所有商品被取消选中
					$("input:checkbox").each(function(){
						if($(this).prop("checked")){
							$(this).prop("checked",false);
						}
					});
					$("#computPrice").html(0);
				}
			});
			
			//点击某条记录的复选框
			$(".itemCheckBox").click(function(){
				var money = $("#computPrice").html();
				var itemPrice = $(this).parent().siblings(".t-money").children("span").html();
				if($(this).prop("checked")){
					money = Number(itemPrice)+Number(money);
				}else{
					money = Number(money)-Number(itemPrice);
				}
				$("#computPrice").html(money);
			});
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
  	<div class="first_banner">
  		<div class="first_banner_content">
  			<img src="img/logo.png">
  			<div class="banner_right">
  				<input type="text" class="banner_input">
  				<input type="button" value="搜索" class="banner_btn">
  			</div>
  		</div>
  	</div>
  	
  	<div class="productTitle">
		<div class="column t-checkbox"><input type="checkbox" class="selectAll"/>&nbsp;&nbsp;全选</div>
		<div class="column t-product">商品</div>
		<div class="column t-size"></div>
		<div class="column t-price">单价</div>
		<div class="column t-num">数量</div>
		<div class="column t-money">小计</div>
		<div class="column t-operation">操作</div>
	</div>
	
	<div id="contentBox">
		<s:form id="comForm" method="post">
		<input type="hidden" name="realPrice" id="realPrice" value=""/>
		<s:iterator value="productVoList" id="protemp">
			<%--<input type="hidden" name="spId"  value="<s:property value="#protemp.id"/>"/>
			<input type="hidden" name="spTotalPrice"  value="<s:property value="#protemp.totalPrice"/>"/>
			
			--%><div class="item">
				<div class="itemcolumn t-checkbox">
					<input type="checkbox" class="itemCheckBox" name="spIdCheckBox" id="item<s:property value="#protemp.id"/>" value="<s:property value="#protemp.id"/>"/>&nbsp;&nbsp;<img src="${protemp.picUrl}" /> 
				</div>
				<div class="itemcolumn t-product">
					<span><a><s:property value="#protemp.name"/> </a> </span><br>
					<img src="img/seven.png" title="支持七天无理由退换货"/>
				</div>
				<div class="itemcolumn t-size">
					<%--<p title="颜色：文君拂红碗莲种子">颜色：文君拂红碗莲种子</p>
					<p title="尺码：间包装 50克装（约50粒装）">尺码：间包装 50克装（约50粒装）</p>
				--%></div>
				<div class="itemcolumn t-price">
					￥<span id="perPrice<s:property value="#protemp.id"/>"><s:property value="#protemp.perPrice"/></span>
				</div>
				<div class="itemcolumn t-num">
					<div id="subNum<s:property value="#protemp.id"/>" class="numOperation">-</div>
					<input type="text" name="spSaleNum" id="num<s:property value="#protemp.id"/>" class="num" value="<s:property value="#protemp.saleNum"/>" disabled="disabled"/>
					<div id="addNum<s:property value="#protemp.id"/>" class="numOperation">+</div>
				</div>
				<div class="itemcolumn t-money">
					<span id="totalPrice<s:property value="#protemp.id"/>"><s:property value="#protemp.totalPrice"/></span>
				</div>
				<div class="itemcolumn t-operation">
					<a>删除</a><br />
					<a>移到我的关注</a><br />
					
				</div>
			</div>
		</s:iterator>
		<div class="computeTotal">
			<input type="checkbox" class="selectAll"/>全选
			<a>删除选中的商品</a><a>移到我的关注</a>
			<div class="cmpButtonBox" onclick="computeOver()">结算</div>
			<div class="selectProduct">
					已选择<span id="computeNum">1</span>件商品 总价：￥<span id="computPrice">0.0</span>&nbsp;&nbsp;&nbsp;
			</div>
			
		</div>
		</s:form>
	</div>
    
    <jsp:include page="../footer.jsp"></jsp:include>
  </body>
</html>
