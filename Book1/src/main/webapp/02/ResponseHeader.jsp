<%@ page import="java.util.Collection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 응답 헤더에 추가할 값 준비
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd"); 
long add_date = s.parse(request.getParameter("add_date")).getTime();
int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");

// 응답 헤더에 값 추가
response.addDateHeader("myBrithday", add_date);
response.addDateHeader("myNumber", add_int);
response.addDateHeader("myNumber", 1004);
response.addHeader("myName", add_str);
response.addHeader("myName", "안중근");

%>
<html>
	<head><title>내장 객체 - response</title></head> 
	<body>
		<h2>응답 헤더 정보 출력하기</h2>
		<%
		Collection<String> headerNames = response.getHeaderNames();
		for(String hName : headerNames){
			String hValue = response.getHeader(hName);
		
		%>
			<li><%= hName %> : <%= hValue %></li>
		<%
		}
		%>
		<h2>myNumber만 출력하기</h2>
		<%
		Collection<String> myNumber = response.getHeaders("muNumber");
		for (String myNum : myNumber){
		%>
			<li>myNumber : <%= myNum %></li>
		<%
		}
		%>
		
	</body>
</html>
