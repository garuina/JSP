<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

		String host = "jdbc:mysql://127.0.0.1:3306/java1db";
		String user = "root";
		String pass = "1234";
	
	List<MemberBean> members  = null;
		
	try{
	// 1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
	// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
	// 3단계
		Statement stmt = conn.createStatement();
	// 4단계
		String sql = "SELECT * FROM `member`";
		ResultSet rs = stmt.executeQuery(sql);
	// 5단계
		members = new ArrayList<>();
	
		while(rs.next()){
			MemberBean mb = new MemberBean();
				
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setrDate(rs.getString(6));
			
			members.add(mb);
		}
		
	
	// 6단계
		rs.close();
		stmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}


%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>member::list</title>
	</head>
	<body>
		<h3>member 목록</h3>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
				<th>날짜</th>
				<th>관리</th>
			</tr>
			<%for(MemberBean mb : members){ %>
			<tr>
				<td><%= mb.getUid() %></td>
				<td><%= mb.getName() %></td>
				<td><%= mb.getHp() %></td>
				<td><%= mb.getPos() %></td>
				<td><%= mb.getDep() %></td>
				<td><%= mb.getrDate() %></td>
				<td>
					<a href="./modify.jsp?uid=<%= mb.getUid()%>">수정</a>
					<a href="./delet.jsp?uid=<%= mb.getUid()%>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>