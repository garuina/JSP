<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서 수정</title>
	</head>
	<body>
		<h3>도서수정</h3>
		
		<a href="/BookStore2/">처음으로</a>
		<a href="/BookStore2/book/list.do">도서 목록</a>
		
		<form action="/BookStore2/book/modify.do" method="post">
			<table border="1">
				<tr>
					<td>도서번호</td>
					<td><input type="text" name="bookId" value="${bv.bookId}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="bookName" value="${bv.bookName}"/></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="publisher" value="${bv.publisher}"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" value="${bv.price}"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>