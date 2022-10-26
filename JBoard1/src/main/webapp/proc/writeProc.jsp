<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	

	// multipart 전송 데이터 수신
	String savePath = application.getRealPath("/file");
	int maxSize = 1024 * 1024 * 10; // 최대 파일 업로드 허용량 10MG
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());


	String title   = mr.getParameter("title");
	String content = mr.getParameter("content");
	String uid     = mr.getParameter("uid");
	String fname   = mr.getFilesystemName("fname");
	String regip   = request.getRemoteAddr();
	
	
	//System.out.println("savePath : " + savePath);
	//System.out.println("fname : " + fname);
	int parent =0;
	try{
		Connection conn = DBCP.getConnection();
		conn.setAutoCommit(false);
		
		Statement stmt = conn.createStatement();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3, fname == null ? 0 : 1);
		psmt.setString(4, uid);
		psmt.setString(5, regip);
		
		psmt.executeUpdate(); //insert
		ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_NO); //select
		
		//작업확정
		conn.commit();
		
		if(rs.next()){
			parent = rs.getInt(1);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 파일을 첨부했으면 파일처리
	if(fname != null){
		
		// 파일명 수정
		int idx = fname.lastIndexOf(".");
		String ext = fname.substring(idx);
		
		System.out.println("1."+ext);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newFname = now+uid+ext; // 20221026111323_kyhaw103.txt이렇게 년월일 시분초 아이디 확장자가 되어 파일 이름 중복 안됨
		System.out.println("2."+uid);
		System.out.println("3."+newFname);
		
		File oriFile = new File(savePath+"/"+fname);
		File newFile = new File(savePath+"/"+newFname);
		
		oriFile.renameTo(newFile);
		
		// 파일 테이블 저장
		try{
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, newFname);
			psmt.setString(3, fname);
			
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	response.sendRedirect("/JBoard1/list.jsp");
%>