<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String custid  = request.getParameter("custid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String addr  = request.getParameter("addr");
	String rdate  = request.getParameter("rdate");
	
	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java1_Shop";
	String user = "root";
	String pass = "1234";
	
	try{
		// 1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
		String sql = "INSERT INTO `user3` VALUES (?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, addr);
		psmt.setString(5, rdate);
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
	response.sendRedirect("./register.jsp");	
%>