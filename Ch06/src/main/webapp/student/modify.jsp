<%@page import="bean.StudentBean"%>
<%@page import="bean.UserBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java1db";
	String user = "root";
	String pass = "1234";
	
	StudentBean sb = null;
	
	try{
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	//3단계
	Statement stmt = conn.createStatement();
	//4단계
	ResultSet rs = stmt.executeQuery("SELECT * FROM `student` WHERE `no`='"+no+"'");
	//5단계
	if(rs.next()){
		sb = new StudentBean();
		sb.setStdNo(rs.getString(1));
		sb.setStdName(rs.getString(2));
		sb.setStdHp(rs.getString(3));
		sb.setStdYear(rs.getInt(4));
		sb.setStdAddress(rs.getString(5));
		
	}
	//6단계
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
		<title>user::register</title>
	</head>
	<body>
		<h3>student 수정하기</h3>
		
		<a href="./list.jsp">student 목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="no" readonly="readonly" value="<%= sb.getStdNo()%>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= sb.getStdName()%>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= sb.getStdHp()%>"/></td>
				</tr>
				<tr>
					<td>학년</td>
					<td><input type="number" name="year" value="<%= sb.getStdYear()%>"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="number" name="address" value="<%= sb.getStdAddress()%>"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기"/>
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>