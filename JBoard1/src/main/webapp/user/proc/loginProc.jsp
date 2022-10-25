<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");

	UserBean ub = null;	
	
	// 데이터베이스 작업 (있는지 조회하기!)
	try{
		Connection conn = DBCP.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_USER);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			ub = new UserBean();
			ub.setUid(rs.getString(1));
			ub.setPass(rs.getString(2));
			ub.setName(rs.getString(3));
			ub.setNick(rs.getString(4));
			ub.setEmail(rs.getString(5));
			ub.setHp(rs.getString(6));
			ub.setGrade(rs.getInt(7));
			ub.setZip(rs.getString(8));
			ub.setAddr1(rs.getString(9));
			ub.setAddr2(rs.getString(10));
			ub.setRegip(rs.getString(11));
			ub.setRdate(rs.getString(12));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(ub != null){
		// 회원이 맞을경우
		session.setAttribute("sessUser", ub);
		response.sendRedirect("/JBoard1/list.jsp");
	}else{
		// 회원이 아닌 경우
		response.sendRedirect("/JBoard1/user/login.jsp?success=100");
	}
	
	
	
	
	
	
%>