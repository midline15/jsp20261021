<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join-result.jsp" method="get">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<label>이름 : <input name="name" type="text"></label>
		</div>
		<div>
			<label>성별 : 
				<input name="gender" type="radio" value="M">남
				<input name="gender" type="radio" value="F">여
			</label>
		</div>
		<div>
			<input type="submit" value="가입">
		</div>
	</form>
</body>
</html>