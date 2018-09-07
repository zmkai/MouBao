package com.hqyj.service;

import com.hqyj.bean.User;
import com.hqyj.dao.UserDao;
import com.opensymphony.xwork2.ActionContext;

public class UserService {
	/**
	 * 买家登录
	 * @param user
	 * @return 
	 * 0代表买家，1代表卖家
	 */
	public int login(User user,String type) {
		UserDao userDao = new UserDao();
		User user_obj = userDao.queryByUsername(user.getUsername(),type);
		if(user_obj==null){
			return -1;
		}else {
			//买家
			if(userDao.existUser(user,user.getType())){
				ActionContext.getContext().getSession().put("user", user_obj);
				return 1;
			}else {
				return 0;
			}
		}
	}
}
