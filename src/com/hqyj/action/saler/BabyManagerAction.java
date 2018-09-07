package com.hqyj.action.saler;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.hqyj.bean.Prodect;
import com.hqyj.bean.PurchasesVo;
import com.hqyj.bean.User;
import com.hqyj.service.SaleService;
import com.opensymphony.xwork2.ActionContext;

public class BabyManagerAction {
	private Prodect product;
	private User user;
	private List<Prodect> productList;
	
	private File photo;
	private String photoFileName;
	private String photoContentType;
	
	private PurchasesVo proVo;
	
	
	
	
	

	public PurchasesVo getProVo() {
		return proVo;
	}

	public void setProVo(PurchasesVo proVo) {
		this.proVo = proVo;
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	public List<Prodect> getProductList() {
		return productList;
	}

	public void setProductList(List<Prodect> productList) {
		this.productList = productList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Prodect getProduct() {
		return product;
	}

	public void setProduct(Prodect product) {
		this.product = product;
	}

	/**
	 * 转到卖家登录界面
	 * @return
	 */
	public String salerLogin(){
		return "salerLogin";
	}
	
	/**
	 * 商家发布商品
	 * @return
	 */
	public String preAddBaby(){
		return "addBaby";
	}
	
	/**
	 * 添加商品
	 * @return
	 */
	public String addBaby(){
		user =  (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "salerLogin";
		}else {
			File file = new File("E:/MouBaoShopFile");
			String picType = photoFileName.substring(photoFileName.indexOf("."));
			//重命名文件名
			String photoNameDB = System.currentTimeMillis()+picType;
			photo.renameTo(new File(file,photoNameDB));
			product.setPicUrl("/files/"+photoNameDB);
			
			product.setUserId(user.getId());
			product.setDateSubmit(new Date());
			product.setState("0");
			SaleService saleService = new SaleService();
			saleService.addOneProduct(product);
			productList = saleService.getProductsByUserId(user.getId());
			return "saleBaby";
		}
		
		
	}
	
	/**
	 * 查询仓库中的宝贝
	 * @return
	 */
	public String wareBabyList(){
		user =  (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "salerLogin";
		}else {
			SaleService saleService = new SaleService();
			productList = saleService.getProductsByUserId(user.getId());
		}
		return "saleBaby";
	}
	/**
	 * 上架商品
	 * @return
	 */
	public String onProductBaby(){
		SaleService saleService = new SaleService();
		saleService.shangjiaBaby(proVo.getId(),"1");
		wareBabyList();
		return "saleBaby";
		
	}
	
	/**
	 * 下架商品
	 * @return
	 */
	public String downProductBaby(){
		SaleService saleService = new SaleService();
		saleService.shangjiaBaby(proVo.getId(),"0");
		wareBabyList();
		return "saleBaby";
	}
	/**
	 * 获得出售中的商品
	 * @return
	 */
	public String saleBabyList(){
		user =  (User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "salerLogin";
		}else {
			SaleService saleService = new SaleService();
			productList = saleService.getShangJiaBaby(user.getId(),"1");
			return "saleBabyList";
		}
	}
	
}
