package com.hqyj.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.spec.PSource;

import com.hqyj.bean.Prodect;
import com.sun.crypto.provider.RSACipher;

public class ProductDao extends BaseDao {
	Connection connection = null;

	/**
	 * 查询上架商品，即查询出售中的所有商品
	 * @param state
	 * @return
	 */
	public List<Prodect> queryByState(String state) {
		List<Prodect> prodects = new ArrayList<Prodect>();
		
		connection = getConnection();
		String sql = "select * from product where state = ? order by dateOnSale desc";
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, state);
			ResultSet rs = prepareStatement.executeQuery();
			while(rs.next()){
				Prodect prodect = new Prodect();
				prodect.setId(rs.getInt("id"));
				prodect.setUserId(rs.getInt("userId"));
				prodect.setName(rs.getString("name"));
				prodect.setDescription(rs.getString("description"));
				prodect.setPicUrl(rs.getString("picUrl"));
				prodect.setType(rs.getString("type"));
				prodect.setDateOnSale(rs.getDate("dateOnSale"));
				prodect.setDateSubmit(rs.getDate("dateSubmit"));
				prodect.setPrice(rs.getDouble("price"));
				prodect.setState(rs.getString("state"));
				prodect.setLocation(rs.getString("location"));
				prodects.add(prodect);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodects;
	}
	
	public Prodect getProductInfo(int productId){
		connection = getConnection();
		String sql = "select * from product where id = ?";
		Prodect prodect = null;
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, productId);
			ResultSet rs = prepareStatement.executeQuery();
			if(rs.next()){
				prodect = new Prodect();
				prodect.setId(rs.getInt("id"));
				prodect.setUserId(rs.getInt("userId"));
				prodect.setName(rs.getString("name"));
				prodect.setDescription(rs.getString("description"));
				prodect.setPicUrl(rs.getString("picUrl"));
				prodect.setType(rs.getString("type"));
				prodect.setDateOnSale(rs.getDate("dateOnSale"));
				prodect.setDateSubmit(rs.getDate("dateSubmit"));
				prodect.setPrice(rs.getDouble("price"));
				prodect.setState(rs.getString("state"));
				prodect.setLocation(rs.getString("location"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodect;
	}
	
	/**
	 * 通过卖家id获取到发布商品
	 */
	public List<Prodect> getProductsByUserId(int userId){
		connection = getConnection();
		String sql = "select * from product where userId = ?";
		List<Prodect> prodects = new ArrayList<Prodect>();
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, userId);
			ResultSet rs = prepareStatement.executeQuery();
			while(rs.next()){
				Prodect prodect = new Prodect();
				prodect = prodect;
				prodect.setId(rs.getInt("id"));
				prodect.setUserId(rs.getInt("userId"));
				prodect.setName(rs.getString("name"));
				prodect.setDescription(rs.getString("description"));
				prodect.setPicUrl(rs.getString("picUrl"));
				prodect.setType(rs.getString("type"));
				prodect.setDateOnSale(rs.getDate("dateOnSale"));
				prodect.setDateSubmit(rs.getDate("dateSubmit"));
				prodect.setPrice(rs.getDouble("price"));
				prodect.setState(rs.getString("state"));
				prodect.setLocation(rs.getString("location"));
				prodects.add(prodect);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodects;
	}
	
	/**
	 * 添加一条商品信息
	 * @param prodect
	 * @return
	 */
	public boolean addBaby(Prodect prodect){
		//INSERT INTO product(userId,name,picUrl,type,price,description,state,num,dateSubmit) VALUES(2,"矿泉水","/files/dress.jpg","饮用水",10.2,"很好喝","0",5,"2018-02-01")
		boolean flag = false;
		connection = getConnection();
		String sql = "INSERT INTO product(userId,name,picUrl,type,price,description,state,num,dateSubmit) VALUES(?,?,?,?,?,?,'0',?,?)";
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, prodect.getUserId());
			prepareStatement.setString(2, prodect.getName());
			prepareStatement.setString(3, prodect.getPicUrl());
			prepareStatement.setString(4, prodect.getType());
			prepareStatement.setDouble(5, prodect.getPrice());
			prepareStatement.setString(6, prodect.getDescription());
			prepareStatement.setInt(7, prodect.getNum());
			prepareStatement.setDate(8,new Date(prodect.getDateSubmit().getTime()));
			
			int executeUpdate = prepareStatement.executeUpdate();
			if(executeUpdate>0){
				flag = true;
			}else {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 上架或者下架宝贝
	 * @param productId
	 * @param state
	 * @return
	 */
	public boolean shangjiaBaby(int productId,String state) {
		boolean flag = false;
		connection = getConnection();
		String sql = "UPDATE product SET state = ? WHERE id = ?";
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, state);
			prepareStatement.setInt(2, productId);
			int executeUpdate = prepareStatement.executeUpdate();
			if(executeUpdate>0){
				flag = true;
			}else {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 查询上架商品，即查询出售中的所有商品
	 * @param state
	 * @return
	 */
	public List<Prodect> queryBabyByStateAndUserId(String state,int userId) {
		List<Prodect> prodects = new ArrayList<Prodect>();
		
		connection = getConnection();
		String sql = "select * from product where state = ? and userId = ?";
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, state);
			prepareStatement.setInt(2, userId);
			ResultSet rs = prepareStatement.executeQuery();
			while(rs.next()){
				Prodect prodect = new Prodect();
				prodect.setId(rs.getInt("id"));
				prodect.setUserId(rs.getInt("userId"));
				prodect.setName(rs.getString("name"));
				prodect.setDescription(rs.getString("description"));
				prodect.setPicUrl(rs.getString("picUrl"));
				prodect.setType(rs.getString("type"));
				prodect.setDateOnSale(rs.getDate("dateOnSale"));
				prodect.setDateSubmit(rs.getDate("dateSubmit"));
				prodect.setPrice(rs.getDouble("price"));
				prodect.setState(rs.getString("state"));
				prodect.setLocation(rs.getString("location"));
				prodects.add(prodect);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodects;
	}
}
