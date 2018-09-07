package com.hqyj.action.buyer;

import java.util.List;

import com.hqyj.bean.Address;
import com.hqyj.bean.User;
import com.hqyj.service.BuyService;
import com.opensymphony.xwork2.ActionContext;

public class SellerManagerAction {
	private List<Address> addressList;
	
	
	public List<Address> getAddressList() {
		return addressList;
	}


	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}


	public String preAccountManager(){
		User user =(User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}else {
			BuyService buyService = new BuyService();
			addressList = buyService.getAllAddressesByUserId(user.getId());
			return "orderAffirmList";
		}
	}

}
