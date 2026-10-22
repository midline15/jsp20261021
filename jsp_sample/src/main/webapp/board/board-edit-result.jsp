<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp"%>
	<%
	String boardNo = request.getParameter("boardNo");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String kind = request.getParameter("kind");
	String sql = "update tbl_board set TITLE='" + title + "', CONTENTS='" + contents + "', KIND=" + kind +
			" where BOARDNO = "+boardNo;
	System.out.println(sql);
	int result = stmt.executeUpdate(sql);
	if (result == 1) {
		out.println("수정 완료");
	%>
	<a href="board-view.jsp?boardNo=<%=boardNo%>">돌아가기</a>
	<%
	} else {
	out.println("수정 실패");
	%>
	<a href="board-edit.jsp?boardNo=<%=boardNo%>">다시수정</a>
	<%
	} 
	%>
</body>
</html>