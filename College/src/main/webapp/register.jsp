<%@page import="kr.co.college.db.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.college.bean.registerBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
			String regLecNo = request.getParameter("regLecNo");
			String regMidScore = request.getParameter("regMidScore");
			String regFinalScore = request.getParameter("regFinalScore");
			String regTotalScore = request.getParameter("regTotalScore");
			String regGrade = request.getParameter("regGrade");
			
			
			List<registerBean> registers = new ArrayList<>(); 	
			
			try{
				Connection conn = DBCP.getConnection();
				
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(Sql.Select_register);
				
			while(rs.next()){
				registerBean rb = new registerBean();
				
				rb.setRegStdNo(rs.getString(1));
				rb.setRegLecNo(rs.getInt(2));
				rb.setRegMidScore(rs.getInt(3));
				rb.setRegFinalScore(rs.getInt(4));
				rb.setRegTotalScore(rs.getInt(5));
				rb.setRegGrade(rs.getString(6));
				rb.setStdName(rs.getString(7));
				rb.setLecName(rs.getString(8));
				
				registers.add(rb);
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
		<title>register</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
		
		$(function(){
			
			$('.btnSin').click(function(){
				$('section').show();
			});
			
			
			$('.btnClose').click(function(){
				$('section').hide();
			});
			
			
			
			
			
			// 수강신청하기
			
				$('input[type=submit]').click(function(){
				
				let regStdNo     = $('input[name=regStdNo]').val();
				let stdName   = $('input[name=stdName]').val();
				let lecName = $('select[name=lecName]').val();
				let regLecNo = $('select[name=stdYear]').val();
				let regMidScore = $('input[name=stdAddress]').val();
				let regFinalScore = $('input[name=stdAddress]').val();
				let regTotalScore = $('input[name=stdAddress]').val();
				let regGrade = $('input[name=stdAddress]').val();
				
				let jsonData = {
					"stdNo": stdNo,
					"stdName": stdName,
					"stdHp": stdHp,
					"stdYear": stdYear,
					"stdAddress": stdAddress
				};
				
				console.log('jsonData : ' + jsonData);
				
				$.ajax({
					url: './registerProc.jsp',
					type: 'POST',
					data: jsonData,
					dataType: 'json',
					success:function(data){
						
						location.reload();
					}
				});
				
			});
			
		})
		
		
		
		
		</script>
	</head>
	<body>
		<h3>수강 관리</h3>
		
		<a href="/College/lecture.jsp">강좌관리</a>
		<a href="/College/register.jsp">수강관리</a>
		<a href="/College/student.jsp">학생관리</a>
		
		
		<h4>수강현황</h4>
		
		<input type="text" placeholder="학번입력"> <button class="btnSerch">검색</button>  <button class="btnSin">수강신청</button>
		<table border="1">
			<tr>
			<th>학번</th>
			<th>이름</th>
			<th>강좌명</th>
			<th>강좌코드</th>
			<th>중간시험</th>
			<th>기말시험</th>
			<th>총점</th>
			<th>등급</th>
			</tr>
			<%for(registerBean rb : registers){ %>
			<tr>
				<td><%= rb.getRegStdNo() %></td>
				<td><%= rb.getStdName() %></td>
				<td><%= rb.getLecName() %></td>
				<td><%= rb.getRegLecNo() %></td>
				<td><%= rb.getRegMidScore() %></td>
				<td><%= rb.getRegFinalScore() %></td>
				<td><%= rb.getRegTotalScore() %></td>
				<td><%= rb.getRegGrade() %></td>
				
			</tr>
			
			<%} %>
			
		</table>
		
		
		
		<section style="display: none" >
		<h4>수강신청</h4>
		
		<button class="btnClose">닫기</button>
		<table border="1">
			<tr>
				<td>학번</td>
				<td><input type="text" name="regStdNo"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="stdName"></td>
			</tr>
			<tr>
				<td>신청강좌</td>
				<td>
				<select name="lecName">
				 	<option value="운영체제론">운영체제론</option>
				 	<option value="무역영문">무역영문</option>
				 	<option value="세법개론">세법개론</option>
				 	<option value="빅데이터개론">빅데이터개론</option>
				 	<option value="컴퓨팅사고와 코딩">컴퓨팅사고와 코딩</option>
				 	<option value="사회복지 마케팅">사회복지 마케팅</option>
				 	<option value="컴퓨터 구조론">컴퓨터 구조론</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="신청"></td>
			</tr>
		</table>
		</section>
		
		
	</body>
</html>