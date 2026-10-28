<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="product-add-result.jsp" name = "form">
		<div>
			제품명 : <input name="itemName">
		</div>
		<div>
			가격 : <input name="price">
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>

</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		if(form.itemName.value.length == 0 || form.price.value.length == 0){
			alert("제품명/가격을 입력하세요");
			return;
		}
		if(parseInt(form.price.value) < 0){
			alert("가격은 양수");
			return;
		}
		form.submit();
	}
</script>