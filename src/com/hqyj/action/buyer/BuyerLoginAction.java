package com.hqyj.action.buyer;

import com.hqyj.bean.User;
import com.hqyj.service.UserService;

public class BuyerLoginAction {
	private User user;
	private String loginResult;
	

	public String getLoginResult() {
		return loginResult;
	}

	public void setLoginResult(String loginResult) {
		this.loginResult = loginResult;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String preLogin() {
		return "login";
	}

	
	public String login() {
		UserService userService = new UserService();
		int flag = userService.login(user,user.getType());
		System.out.println(flag);
		if (flag == 1) {
			//买家身份
			if(user.getType().equals("1")){
				return "success";
			}else if(user.getType().equals("0")){
				//卖家身份
				return "saleSuccess";
			}
		} else {
			loginResult = flag == 0 ? "密码错误" : "用户名不存在";
		}
		return "login";
	}
}