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
    
    <title>出售中的宝贝列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/com.css">
	<link rel="stylesheet" href="css/saleCommon.css">
	<link rel="stylesheet" href="css/babyStyle.css">
	<script type="text/javascript" src="js/baby.js"></script>
	<script type="text/javascript">
		/*点击下架商品*/
		function downProduct(productId){
			document.getElementsByName("proVo.id")[0].value = productId;
			document.mform.action = "babyManagerAction!downProductBaby.action";
			document.mform.submit();
		}
	</script>
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/jsp/sale/commonHeader.jsp"></jsp:include>
  	
  	<div class="content_box">
  		<jsp:include page="/WEB-INF/jsp/sale/commonMenu.jsp"></jsp:include>
  		<div class="body_right_box"> 
  			<div class="baby_title">我是卖家&nbsp;&gt;&nbsp;宝贝管理&nbsp;&gt;&nbsp;出售中的宝贝</div>
			<s:form action="babyManagerAction!queryWareProduct.action" name="mform"  theme="simple">
			
				<div class="condition_box">
					&nbsp;&nbsp;&nbsp;&nbsp;宝贝名称：<s:textfield  name="proVo.name" cssClass="baby_input"></s:textfield >
					<s:set var="typeList" value="#{'女装/男装':'女装/男装','鞋靴/箱包':'鞋靴/箱包','童装玩具':'童装玩具','家电/数码':'家电/数码'}"></s:set>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宝贝类别：<s:select name="proVo.type" list="typeList" headerKey="" headerValue="选择宝贝的类别" cssClass="baby_select_small"></s:select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宝贝价格：<s:textfield  name="proVo.lowPrice" cssClass="baby_input_small" type=""></s:textfield >-<s:textfield  name="proVo.highPrice" cssClass="baby_input_small"></s:textfield >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:reset value="清空" cssClass="baby_btn_small"></s:reset><s:submit value="搜索" cssClass="baby_btn_small"></s:submit>
				</div>
				
				<input type="hidden" name="proVo.id" value="" id="productId ">
				<input type="hidden" name="hintMsg" value="salebaby">
				
				<s:iterator value="productList" id="product">
					<div class="product_box">
						<img src="${product.picUrl}">
						<div class="item_name">宝贝名称：<s:property value="#product.name"/> </div>
						<div class="item_type item_font">宝贝类别：<s:property value="#product.type"/> </div>
						<div class="item_price item_font">宝贝单价：<font color="red"> <s:property value="#product.price"/>￥</font></div>
						<div class="item_dateOnSale item_font">上架日期：<s:date name="#product.dateOnSale" format="yyyy/MM/dd"/> </div>
						<input type="button" value="编辑宝贝信息" onclick="editProduct()" class="btn_edit_product"/>
						<input type="button" value="下架商品" onclick="downProduct(<s:property value="#product.id"/>)" class="btn_product"/>
					</div>
				</s:iterator>
			</s:form>
  		</div>
  	</div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
  </body>
</html>
