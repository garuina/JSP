<%@ page import="java.util.Collection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 응답 헤더에 추가할 값 준비
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd"); 
long add_date = s.parse(request.getParameter("add_date")).getTime();



%>