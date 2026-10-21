<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp 의 핵심 form -->
	<!-- form 태그 내의 submit 버튼 클릭 시 action 속성에 있는 페이지로 이동 -->
	<!-- 이때 form 태그 내의 input 태그(select,textarea 포함) -->
	<!-- request 객체에 담아서 이동 -->
	<!-- input 태그의 name 속성이 키, 입력한 값이 value -->
	
	<!-- method 는 옵션. get or post, 디폴트는 get -->
	<!-- get 방식은 url 에 값을 담아서 보낸다. get 방식은 빠르지만 보안에 취약 -->
	<!-- post 는 숨겨서 보낸다. 패스워드나 개인정보등이 있을 때는 post 를 사용 -->
	
	<!-- 앞으로의 실습은 데이터 확인을 위해 get 을 주로 사용 -->
	
	<form action="result.jsp" method="get">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<input type="submit" value="로그인">
		</div>
	</form>
</body>
</html>