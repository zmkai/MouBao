package com.hqyj.service;

import java.util.List;

import com.hqyj.bean.Prodect;
import com.hqyj.dao.ProductDao;

public class SaleService {
	/**
	 * 添加一条商品信息
	 * @param product
	 * @return
	 */
	public boolean addOneProduct(Prodect product) {
		ProductDao productDao = new ProductDao();
		return productDao.addBaby(product);
	}
	
	/**
	 * 通过卖家Id查询商品
	 */
	public List<Prodect> getProductsByUserId(int userId){
		ProductDao productDao = new ProductDao();
		return productDao.getProductsByUserId(userId);
	}
	
	/**
	 * 上架或者下架商品
	 * @param productId
	 * @param state
	 * @return
	 */
	public boolean shangjiaBaby(int productId,String state){
		ProductDao productDao = new ProductDao();
		return productDao.shangjiaBaby(productId,state);
	}
	
	/**
	 * 查询获得上架的商品
	 * @param userId
	 * @param state
	 * @return
	 */
	public List<Prodect> getShangJiaBaby(int userId,String state){
		ProductDao productDao = new ProductDao();
		return productDao.queryBabyByStateAndUserId(state,userId);
	}
}
