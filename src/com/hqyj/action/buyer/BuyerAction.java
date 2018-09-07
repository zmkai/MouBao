package com.hqyj.action.buyer;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.criteria.CriteriaBuilder.In;

import com.hqyj.bean.Address;
import com.hqyj.bean.Prodect;
import com.hqyj.bean.ProductUpdate;
import com.hqyj.bean.Purchases;
import com.hqyj.bean.PurchasesVo;
import com.hqyj.bean.User;
import com.hqyj.service.BuyService;
import com.opensymphony.xwork2.ActionContext;

public class BuyerAction {
	private List<Prodect> proList;
	private Prodect product;
	private int productId;
	private Address address;
	private List<Address> list;
	private String msg;
	private List<PurchasesVo> productVoList;
	private String[] spIdCheckBox;
	private double realPrice;
	private int addressId;
	
	


	
	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(double realPrice) {
		this.realPrice = realPrice;
	}

	public String[] getSpIdCheckBox() {
		return spIdCheckBox;
	}

	public void setSpIdCheckBox(String[] spIdCheckBox) {
		this.spIdCheckBox = spIdCheckBox;
	}

	public List<PurchasesVo> getProductVoList() {
		return productVoList;
	}

	public void setProductVoList(List<PurchasesVo> productVoList) {
		this.productVoList = productVoList;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public List<Address> getList() {
		return list;
	}

	public void setList(List<Address> list) {
		this.list = list;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Prodect getProduct() {
		return product;
	}

	public void setProduct(Prodect product) {
		this.product = product;
	}

	public List<Prodect> getProList() {
		return proList;
	}

	public void setProList(List<Prodect> proList) {
		this.proList = proList;
	}


	public String home(){
		BuyService buyService = new BuyService();
		proList = buyService.getProductOnSale();
		return "home";
	}
	
	public String productInfo(){
		BuyService buyService = new BuyService();
		product = buyService.getProductBy(productId);
		return "detail";
	}
	
	public String addAddress(){
//		System.out.println("執行添加");
//		System.out.println(address.getTelephone());
		User user = (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}else {
			address.setUserId(user.getId());
		
			address.setFlag(address.getFlag().equals("true")?"1":"0");
			BuyService buyService = new BuyService();
			if(buyService.addAddress(address)){
				msg = "添加成功";
			}else {
				msg = "添加失败";
			}
			list = buyService.getAllAddressesByUserId(user.getId());
			return "accountManager";
		}
	}
	
	public String toAddAddress(){
		User user = (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}else {
			BuyService buyService = new BuyService();
			list = buyService.getAllAddressesByUserId(user.getId());
			System.out.println(list.size());
			return "accountManager";
		}
	}
	/**
	 * 添加购物车
	 * @return
	 */
	public String addGwc(){
		User user = (User)ActionContext.getContext().getSession().get("user");
		Purchases purchase = new Purchases();
		purchase.setUserId(user.getId());
		purchase.setPrice(product.getPrice());
		purchase.setProductId(product.getId());
		purchase.setState("0");
		purchase.setSaleNum(product.getNum());
		purchase.setSellUserId(product.getUserId());
		BuyService buyService = new BuyService();
		if(buyService.addShopCart(purchase)){
			productVoList = buyService.queryPurchasesVosByUserId(user.getId(),"0");
			return "shopCart";
		}else {
			return "detail";
		}
	}
	
	/**
	 * 提交订单
	 * @return
	 */
	public String submitDingDan(){
		User user = (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}else {
			List<ProductUpdate> list = new ArrayList<ProductUpdate>();
			//System.out.println(productVoList.size());
			for (int i = 0; i < spIdCheckBox.length; i++) {
				System.err.println("多选框的值"+spIdCheckBox[i]);
				ProductUpdate productUpdate =  new ProductUpdate();
				productUpdate.setId(Integer.parseInt(spIdCheckBox[i]));
				productUpdate.setAddressId(addressId);
				productUpdate.setOrderId(UUID.randomUUID().toString().substring(0,14));
				productUpdate.setSaleDate(new Date());
				list.add(productUpdate);
			}
			BuyService buyService = new BuyService();
			if(buyService.updatePurchases(list)){
				productVoList = buyService.queryPurchasesVosByUserId(user.getId(),"1");
				System.out.println(productVoList.size());
				return "myOrder";
			}else {
				return "home";
			}
		}
	}
	
	/**
	 * 点击结算
	 * @return
	 */
	public String computeGwc(){
//		for(int i = 0;i<spIdCheckBox.length;i++){
//			System.out.println(spIdCheckBox[i]);
//		}
		User user = (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}else {
			BuyService buyService = new BuyService();
			productVoList = buyService.queryPurchasesVosByUserIds(spIdCheckBox);
			for (PurchasesVo purchasesVo : productVoList) {
				realPrice+=purchasesVo.getTotalPrice();
			}
			list = buyService.getAllAddressesByUserId(user.getId());
			return "orderAffirm";
		}
	}
	
	/**
	 * 获取购物车的订单列表
	 * @return
	 */
	public String gwcList(){
		User user = (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}else {
			BuyService buyService = new BuyService();
			productVoList = buyService.queryPurchasesVosByUserId(user.getId(),"0");
			return "shopCart";
		}
	}
	
	/**
	 * 点击管理地址进入添加地址界面
	 * @return
	 */
	public String preAccountManager(){
		System.out.println("进入管理地址");
		User user = (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}else {
			BuyService buyService = new BuyService();
			list = buyService.getAllAddressesByUserId(user.getId());
		}
		return "accountManager";
	}
	
	
}
