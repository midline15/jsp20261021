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
	String profNo = request.getParameter("profNo");
	String name = request.getParameter("name");
	String sql = "insert into professor(profno, name) values("+profNo+", '"+name+"')";
	
	stmt.executeUpdate(sql);
	%>
	<div>성공</div>
	<button onclick="location.href='professor-list.jsp'">되돌아가기</button>
</body>
</html>