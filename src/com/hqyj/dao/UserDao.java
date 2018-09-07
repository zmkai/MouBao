package com.hqyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hqyj.bean.User;

public class UserDao extends BaseDao {
	Connection connection;

	public User queryByUsername(String username,String type){
		String sql = "select * from user where username = ? and type = ?";
		connection = getConnection();
		User user = null;
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement(sql);
			prepareStatement.setString(1, username);
			prepareStatement.setString(2, type);
			ResultSet executeQuery = prepareStatement.executeQuery();
			if(executeQuery.next()){
				user = new User();
				user.setId(executeQuery.getInt("id"));
				user.setUsername(executeQuery.getString("username"));
				user.setPassword(executeQuery.getString("password"));
				user.setType(executeQuery.getString("type"));
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
		return user;
	}
	
	
	public boolean existUser(User user,String type) {
		String sql = "select * from user where username = ? and password = ? and type = ?";
		connection = getConnection();
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement(sql);
			prepareStatement.setString(1, user.getUsername());
			prepareStatement.setString(2, user.getPassword());
			prepareStatement.setString(3, type);
			ResultSet executeQuery = prepareStatement.executeQuery();
			return executeQuery.next();
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
		return false;
	}

}
