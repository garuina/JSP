<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addUser</title>
	</head>
	<body>
		<h3>사용자 확인</h3>
		
		<jsp:useBean id="n u" class="w kr.co.shop.bean.User2Be">
			<jsp:setProperty property="name" name="ub2"/>
			<jsp:setProperty property="age" name="ub2"/>
			<jsp:setProperty property="hp" name="ub2"/>
			<jsp:setProperty property="addr" name="ub2"/>
		</jsp:useBean>
		
		<p>
			이름: <%= ub2.getName() %><br/>
			나이: <%= ub2.getAge() %><br/>
			전화번호: <%= ub2.getHp() %><br/>
			주소: <%= ub2.getAddr() %><br/>
		
		</p>
		<a href="../3_useBean 액션태그.jsp">뒤로가기</a>
	</body>
</html>