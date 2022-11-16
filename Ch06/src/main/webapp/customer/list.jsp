<%@page import="kr.co.farmstory1.bean.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

		String host = "jdbc:mysql://127.0.0.1:3306/java1_shop";
		String user = "java1_admin1";
		String pass = "1234";
	
	List<CustomerBean> cs  = null;
		
	try{
	// 1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
	// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
	// 3단계
		Statement stmt = conn.createStatement();
	// 4단계
		String sql = "SELECT * FROM `customer`";
		ResultSet rs = stmt.executeQuery(sql);
	// 5단계
		cs = new ArrayList<>();
	
		while(rs.next()){
			CustomerBean cb = new CustomerBean();
				
			cb.setCustid(rs.getString(1));
			cb.setName(rs.getString(2));
			cb.setHp(rs.getString(3));
			cb.setAddr(rs.getNString(4));
			cb.setRdate(rs.getString(5));
			
			
			cs.add(cb);
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
		<title>customer::list</title>
	</head>
	<body>
		<h3>customer 목록</h3>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
			<%for(CustomerBean cb : cs){ %>
			<tr>
				<td><%= cb.getCustid() %></td>
				<td><%= cb.getName() %></td>
				<td><%= cb.getHp() %></td>
				<td><%= cb.getAddr() %></td>
				<td><%= cb.getRdate() %></td>
				<td>
					<a href="./modify.jsp?uid=<%= cb.getCustid()%>">수정</a>
					<a href="./delet.jsp?uid=<%= cb.getCustid()%>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>