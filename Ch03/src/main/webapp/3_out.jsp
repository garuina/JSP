<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_out</title>
		<%--
			날짜 : 2022/10/05
			이름 : 장인화
			내용 : JSP out 객체
			
			out 내장개체
			 - JSP 출력객체
			 - HTML 태그 및 데이터를 출력
		 --%>
	</head>
	<body>
		<h3>out 내장객체</h3>
		
		<%
			out.print("<ul>");
			out.print("<li>서울</li>");
			out.print("<li>대전</li>");
			out.print("<li>대구</li>");
			out.print("<li>부산</li>");
			out.print("<li>광주</li>");
			out.print("</ul>");
		
		%>
	</body>
</html>