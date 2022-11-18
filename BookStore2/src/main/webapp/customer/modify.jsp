<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객 수정</title>
	</head>
	<body>
		<h3>고객 수정</h3>
		
		<a href="/BookStore2/">처음으로</a>
		<a href="/BookStore2/customer/list.do">도서 목록</a>
		
		<form action="/BookStore2/customer/modify.do" method="post">
			<table border="1">
				<tr>
					<td>고객번호</td>
					<td><input type="text" name="custId" value="${cv.custId}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>고객명</td>
					<td><input type="text" name="name" value="${cv.name}"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="${cv.address}"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="phone" value="${cv.phone}"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>