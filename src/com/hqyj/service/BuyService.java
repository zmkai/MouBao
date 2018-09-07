package com.hqyj.service;

import java.util.List;

import com.hqyj.bean.Address;
import com.hqyj.bean.Prodect;
import com.hqyj.bean.ProductUpdate;
import com.hqyj.bean.Purchases;
import com.hqyj.bean.PurchasesVo;
import com.hqyj.dao.AddressDao;
import com.hqyj.dao.ProductDao;
import com.hqyj.dao.PurchasesDao;

public class BuyService {
	public List<Prodect> getProductOnSale(){
		ProductDao productDao = new ProductDao();
		//查詢上架商品
		List<Prodect> queryByState = productDao.queryByState("1");
		return queryByState;
	}
	
	public Prodect getProductBy(int productId){
		ProductDao productDao = new ProductDao();
		Prodect prodect = productDao.getProductInfo(productId);
		return prodect;
	}
	
	public boolean addAddress(Address address){
		AddressDao addressDao = new AddressDao();
		return addressDao.addAddress(address);
	}
	
	public List<Address> getAllAddressesByUserId(int userId){
		AddressDao addressDao = new AddressDao();
		return addressDao.getAllAddressesByUserId(userId);
	}
	
	public boolean addShopCart(Purchases purchase){
		PurchasesDao purchasesDao = new PurchasesDao();
		return purchasesDao.addPurchases(purchase);
	}
	
	public List<PurchasesVo> queryPurchasesVosByUserId(int userId,String state){
		PurchasesDao purchasesDao = new PurchasesDao();
		return purchasesDao.queryPurchasesByUserId(userId,state);
	}
	
	public boolean updatePurchases(List<ProductUpdate> productUpdates){
		PurchasesDao purchasesDao = new PurchasesDao();
		return purchasesDao.confirePurchases(productUpdates);
	}
	//查询选中的订单
	public List<PurchasesVo> queryPurchasesVosByUserIds(String[] userIds){
		PurchasesDao purchasesDao = new PurchasesDao();
		return purchasesDao.queryPurchasesByUserIds(userIds);
	}
}
