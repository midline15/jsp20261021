<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[readonly]{
	background-color: #eee;
}
</style>
</head>
<body>
	<form action="join-result.jsp" name="form">
		<div>
			아이디<input name="userId">
			<input type="button" value="중복체크" onclick="fnCheck()">
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
	let form = document.form;
	let addFlg = false;
	function fnJoin(){
		if(!addFlg){
			alert("중복체크 확인 후 추가해주세요");
			return;
		}
		if(form.userId.value.length == 0 ||form.pwd.value.length == 0 ||form.name.value.length == 0 ){
			alert('빈칸채워');
			return;
		}
		form.submit();
	}
	function fnCheck(){
		if(form.userId.value.length == 0){
			alert('아이디 입력');
			return;
		}
		let userId = form.userId.value;
		window.open(`user-check.jsp?userId=\${userId}`, "check", "width=500, height=500");
	}
	function fnReturn(flg){
		//console.log(flg);
		if(flg == "N"){
			form.userId.readOnly = true;
			addFlg = true;
		}
	}
</script>