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
	String boardNo = request.getParameter("boardNo");
	String contents = request.getParameter("contents");
	String userId = (String)session.getAttribute("sessionId");
	
	String sql = "insert into tbl_comment values(comment_seq.nextval, "+boardNo+", '"+contents+"', '"+ userId+"', sysdate, sysdate)";
	//System.out.println(sql);
	
	stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	alert("추가되었습니다.");
	location.href="board-view.jsp?boardNo=<%= boardNo %>";
</script>