<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

// 로그인 폼으로 부터 받은 아이디와 패스워드 
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

// web.xml에서 가져온 데이터베이스 연결 정보 

%>