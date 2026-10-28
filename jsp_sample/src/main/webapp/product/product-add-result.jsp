<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
	String itemName = request.getParameter("itemName");
	String price = request.getParameter("price");
	String sql = "insert into tbl_product values(product_seq.nextval, '"+itemName+"', "+price+")";
	
	stmt.executeUpdate(sql);
	%>
	<div>성공</div>
	<button onclick="location.href='product-list.jsp'">되돌아가기</button>
</body>
</html>