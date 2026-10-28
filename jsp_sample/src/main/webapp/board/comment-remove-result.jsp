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
	String commentNo = request.getParameter("commentNo");
	String boardNo = request.getParameter("boardNo");
	
	String sql = "delete from tbl_comment where commentno = " + commentNo;
	//System.out.println(sql);
	
	stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	alert("삭제되었습니다.");
	location.href="board-view.jsp?boardNo=<%= boardNo %>";
</script>