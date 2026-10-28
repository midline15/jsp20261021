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
	String itemNo = request.getParameter("itemNo");
	String itemSql = "delete from tbl_product where item_no = " + itemNo;
	String reviewSql = "delete from tbl_review where item_no = " + itemNo;
	
	stmt.executeUpdate(itemSql);
	stmt.executeUpdate(reviewSql);
	
	%>
	<div>삭제되었습니다.</div>
	<button onclick="location.href='product-list.jsp'">되돌아가기</button>
</body>
</html>