package com.hqyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hqyj.bean.Address;
import com.hqyj.bean.Prodect;
import com.hqyj.bean.User;
import com.opensymphony.xwork2.ActionContext;

public class AddressDao extends BaseDao {
	private Connection connection;

	public boolean addAddress(Address address) {
		boolean flag = false;
		String sql = "INSERT INTO address(userId,username,telephone,address,postId,flag) VALUES(?,?,?,?,?,?)";
		connection = getConnection();
		
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement(sql);
			prepareStatement.setInt(1, address.getUserId());
			prepareStatement.setString(2, address.getUsername());
			prepareStatement.setString(3, address.getTelephone());
			prepareStatement.setString(4, address.getAddress());
			prepareStatement.setString(5, address.getPostId());
			prepareStatement.setString(6, address.getFlag());
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

	public List<Address> getAllAddressesByUserId(int userId) {
		List<Address> addresses = new ArrayList<Address>();

		connection = getConnection();
		String sql = "select * from address where userId = ?";
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement(sql);
			prepareStatement.setInt(1, userId);
			ResultSet rs = prepareStatement.executeQuery();
			while (rs.next()) {
				Address address = new Address();
				address.setId(rs.getInt("id"));
				address.setUserId(rs.getInt("userId"));
				address.setUsername(rs.getString("username"));
				address.setTelephone(rs.getString("telephone"));
				address.setAddress(rs.getString("address"));
				address.setPostId(rs.getString("postId"));
				address.setFlag(rs.getString("flag"));
				addresses.add(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addresses;
	}
}
