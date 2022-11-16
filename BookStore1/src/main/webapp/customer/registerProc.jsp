<%@page import="config.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String custId   = request.getParameter("custId");
	String name   	= request.getParameter("name");
	String address  = request.getParameter("address");
	String phone 	= request.getParameter("phone");
	
	// 데이터베이스 작업
	try{
		Connection conn = DBCP.getConnection();
		
		// 3단계
		String sql = "INSERT INTO `customer` VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custId);
		psmt.setString(2, name);
		psmt.setString(3, address);
		psmt.setString(4, phone);
		
		// 4단계
		psmt.executeUpdate();
		// 5단계
		// 6단계
		psmt.close();
		conn.close(); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>
