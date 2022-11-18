package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.CustomerVO;

public class CustomerDAO extends DBHelper{
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	
	private CustomerDAO() {}
	
	public void insertCustomer(CustomerVO cv) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `customer` values (?,?,?,?)");
			psmt.setInt(1, cv.getCustId());
			psmt.setString(2, cv.getName());
			psmt.setString(3, cv.getAddress());
			psmt.setString(4, cv.getPhone());
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public CustomerVO selectCustomer(String custId) {
		
		CustomerVO cv = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `customer` where `custId`=?");
			psmt.setString(1, custId);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cv= new CustomerVO();
				cv.setCustId(rs.getInt(1));
				cv.setName(rs.getString(2));
				cv.setAddress(rs.getString(3));
				cv.setPhone(rs.getString(4));				
			}
			
			close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return cv;
	}
	
	public List<CustomerVO> selectCustomers() {
		
		List<CustomerVO> customers = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `customer`");
			
			while(rs.next()) {
				CustomerVO cv = new CustomerVO();
				cv.setCustId(rs.getInt(1));
				cv.setName(rs.getString(2));
				cv.setAddress(rs.getString(3));
				cv.setPhone(rs.getString(4));	
				customers.add(cv);
			}
			
			close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return customers;
	}
	
	public void updateCustomer(CustomerVO cv) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `customer` set `name`=?, `address`=?, `phone`=? where `custId`=?");
			psmt.setString(1, cv.getName());
			psmt.setString(2, cv.getAddress());
			psmt.setString(3, cv.getPhone());
			psmt.setInt(4, cv.getCustId());
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteCustomer(String custId) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `customer` where `custId`=?");
			psmt.setString(1, custId);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
