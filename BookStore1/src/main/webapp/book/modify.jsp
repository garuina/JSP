<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.shop.bean.BookBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	String bookId = request.getParameter("bookId");
	
	BookBean bb = null;
	
	try{
		Connection conn = DBHelper.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `book` WHERE `bookId`='"+bookId+"'");
		
		
		
		if(rs.next()){
	bb = new BookBean();
	bb.setBookId(rs.getInt(1));
	bb.setBookName(rs.getString(2));
	bb.setPublisher(rs.getString(3));
	bb.setPrice(rs.getInt(4));
		}
		
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
		<title>book::modify</title>
	</head>
	<body>
		<h3>도서수정</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">도서 목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>도서번호</td>
					<td><input type="text" name="bookId" value="<%= bb.getBookId() %>" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="bookName" value="<%= bb.getBookName() %>"/></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="publisher" value="<%= bb.getPublisher() %>"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" value="<%= bb.getPrice() %>"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>

