<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송 데이터 수신
		request.setCharacterEncoding("utf-8");
		String custId   = request.getParameter("custId");
		String name     = request.getParameter("name");
		String address  = request.getParameter("address");
		String phone    = request.getParameter("phone");



		try{
	Connection conn = DBHelper.getConnection();
	
	String sql = "UPDATE `customer` SET `name`=?, `address`=?, `phone`=?";
		   		   sql += "WHERE `custId`=?";
		   		   
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, name);
	psmt.setString(2, address);
	psmt.setString(3, phone);
	psmt.setString(4, custId);
	
	// 4단계
	psmt.executeUpdate();
	// 5단계
	// 6단계
	psmt.close();
	conn.close();		
	
		}catch(Exception e){
	e.printStackTrace();
		}
		   
	response.sendRedirect("./list.jsp");
%>