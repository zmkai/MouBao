<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
	<div class="header_box">
  		<div class="header_content">
  			<div class="login_name">
  				<s:property  value="#session.user.username"/>&nbsp;&nbsp;
  				<img src="img/smallarrow_down_gray1.png">
  			</div>
  			<div class="loginNameMenu">
  				<a href="sellerManagerAction!preAccountManager.action">账号管理</a><br>
  				<a href="sellLoginAction!logout.action" >退出</a>
  			</div>
  			<div class="header_msg">
  				<img src="img/sell_header_msg.png"/>&nbsp;&nbsp;<a >消息 </a>
  				&nbsp;&nbsp;&nbsp;
  				<a href="sellerAction!firstPage.action">首页</a>
  			</div>
  			<div class="header_right">
  				<a href="buyerAction!gwcList.action">
  					<img src="img/sell_header_gwc.png">
  					购物车<s:property value="gwcNum"/>
  					<img src="img/smallarrow_down_red.png">
  				</a>
  				&nbsp;&nbsp;&nbsp;&nbsp;
  				<a >
  					<img src="img/header_star.png">
  					收藏
  					<img src="img/smallarrow_down_gray1.png">
				</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
  				<a >商品分类</a><img src="img/smallarrow_down_gray1.png"> &nbsp;&nbsp;|&nbsp;&nbsp;
  				<a href="buyerAction!toAddAddress.action">买家中心</a><img src="img/smallarrow_down_gray1.png"> &nbsp;&nbsp;|&nbsp;&nbsp;
  				<a >联系客服</a><img src="img/smallarrow_down_gray1.png"> &nbsp;&nbsp;&nbsp;&nbsp;
  				<img src="img/red3.png"> <a >网站导航</a><img src="img/smallarrow_down_red.png">
  			</div>
  		</div>
  	</div>
  	
