<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String no  = request.getParameter("no");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String year  = request.getParameter("year");
	String address  = request.getParameter("address");


	// 데이터베이스 처리
		String host = "jdbc:mysql://127.0.0.1:3306/java1db";
		String user = "root";
		String pass = "1234";		   
		   
		   
		try{
			// 1단계
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(host, user, pass);
			// 3단계
			String sql = "UPDATE `student` SET `name`=?, `hp`=?, `year`=?, `address`=?";
		   		   sql += "WHERE `no`=?";
		   		   
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, hp);
			psmt.setString(3, year);
			psmt.setString(4, address);
			psmt.setString(5, no);
			
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