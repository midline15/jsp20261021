<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join-result.jsp" name="form">
		<div>
			아이디<input name="userId">
		</div>
		<div>
			비밀번호<input name="pwd" type="password">
		</div>
		<div>
			이름<input name="name">
		</div>
		<div>
			<input onclick="fnJoin()" type="button" value="가입">
		</div>
	</form>
</body>
</html>
<script>
	function fnJoin(){
		let form = document.form;
		if(form.userId.value.length == 0 ||form.pwd.value.length == 0 ||form.name.value.length == 0 ){
			alert('빈칸채워');
			return;
		}
		form.submit();
	}
</script>