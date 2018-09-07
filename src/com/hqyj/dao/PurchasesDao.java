package com.hqyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hqyj.bean.ProductUpdate;
import com.hqyj.bean.Purchases;
import com.hqyj.bean.PurchasesVo;

public class PurchasesDao extends BaseDao{
	Connection connection;
	public boolean addPurchases(Purchases purchase){
		boolean flag = false;
		String sql = "INSERT INTO purchases(userId,sellUserId,productId,state,saleNum,price) VALUES(?,?,?,?,?,?) ";
		connection = getConnection();
		
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement(sql);
			prepareStatement.setInt(1, purchase.getUserId());
			prepareStatement.setInt(2, purchase.getSellUserId());
			prepareStatement.setInt(3, purchase.getProductId());
//			prepareStatement.setString(5, purchase.getOrderId());
			prepareStatement.setString(4,purchase.getState());
			prepareStatement.setInt(5, purchase.getSaleNum());
//			prepareStatement.setDate(8,(java.sql.Date) new Date());
			prepareStatement.setDouble(6, purchase.getPrice());
			
			int executeUpdate = prepareStatement.executeUpdate();
			if (executeUpdate > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	
	public List<PurchasesVo> queryPurchasesByUserId(int userId,String state){
		String sql = "SELECT P.id,P.saleNum,P.orderId,P.saleDate,P.state,PR.`name`,PR.picUrl,PR.price FROM purchases P LEFT JOIN product PR ON P.productId = PR.id WHERE P.userId = ? and P.state = ?";
		connection = getConnection();
		List<PurchasesVo> list = new ArrayList<PurchasesVo>();
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement(sql);
			prepareStatement.setInt(1, userId);
			prepareStatement.setString(2, state);
			
			ResultSet rs = prepareStatement.executeQuery();
			while (rs.next()) {
				PurchasesVo purchasesVo = new PurchasesVo();
				purchasesVo.setId(rs.getInt("id"));
				purchasesVo.setSaleNum(rs.getInt("saleNum"));
				purchasesVo.setOrderId(rs.getString("orderId"));
				purchasesVo.setSaleDate(rs.getDate("saleDate"));
				purchasesVo.setState(rs.getString("state"));
				purchasesVo.setName(rs.getString("name"));
				purchasesVo.setPicUrl(rs.getString("picUrl"));
				purchasesVo.setPerPrice(rs.getDouble("price"));
				purchasesVo.setTotalPrice(rs.getDouble("price")*rs.getInt("saleNum"));
				list.add(purchasesVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	public boolean confirePurchases(List<ProductUpdate> productUpdates){
		boolean flag = false;
		String sql = "UPDATE purchases SET addressId = ?,orderId = ?,saleDate = ?,state = '1' WHERE id = ?";
		connection = getConnection();
		if(productUpdates.size()<1){
			return flag;
		}
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement(sql);
			for(int i = 0;i<productUpdates.size();i++){
				prepareStatement.setInt(1, productUpdates.get(i).getAddressId());
				prepareStatement.setString(2, productUpdates.get(i).getOrderId());
				prepareStatement.setDate(3, new java.sql.Date(productUpdates.get(i).getSaleDate().getTime()));
				prepareStatement.setInt(4, productUpdates.get(i).getId());
				prepareStatement.addBatch();
			}
			
			prepareStatement.executeBatch();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	
	public List<PurchasesVo> queryPurchasesByUserIds(String[] ids){
		int count = ids.length;
		List<PurchasesVo> list = new ArrayList<PurchasesVo>();
		if(count<1){
			return null;
		}
		for(int i = 0;i<count;i++){
			System.out.println(ids[i]);
			String sql = "SELECT P.id,P.saleNum,P.orderId,P.saleDate,P.state,PR.`name`,PR.picUrl,PR.price FROM purchases P LEFT JOIN product PR ON P.productId = PR.id WHERE P.id = ?";
			connection = getConnection();
			try {
				PreparedStatement prepareStatement = connection
						.prepareStatement(sql);
				prepareStatement.setInt(1, Integer.parseInt(ids[i]));
				
				ResultSet rs = prepareStatement.executeQuery();
				while (rs.next()) {
					PurchasesVo purchasesVo = new PurchasesVo();
					purchasesVo.setId(rs.getInt("id"));
					purchasesVo.setSaleNum(rs.getInt("saleNum"));
					purchasesVo.setOrderId(rs.getString("orderId"));
					purchasesVo.setSaleDate(rs.getDate("saleDate"));
					purchasesVo.setState(rs.getString("state"));
					purchasesVo.setName(rs.getString("name"));
					purchasesVo.setPicUrl(rs.getString("picUrl"));
					purchasesVo.setPerPrice(rs.getDouble("price"));
					purchasesVo.setTotalPrice(rs.getDouble("price")*rs.getInt("saleNum"));
					list.add(purchasesVo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} 
		return list;
	}
}
