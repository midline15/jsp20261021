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
	String sessionId = (String) session.getAttribute("sessionId");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String kind = request.getParameter("kind");

	String sql = "insert into tbl_board values(BOARD_SEQ.NEXTVAL, '" 
			+ title + "', '" + contents + "', '" + sessionId
			+ "', 0, " + kind + ", SYSDATE, SYSDATE)";
	
	String sql2 = String.format("insert into tbl_board values"
			+"(BOARD_SEQ.NEXTVAL, '%s', '%s', '%s', 0, %s, SYSDATE, SYSDATE)",
			title, contents, sessionId, kind);
	System.out.println(sql2);
	int result = stmt.executeUpdate(sql);
	if (result > 0) {
		out.println("게시글이 등록되었습니다.");
	%>
	<div>
		<a href="board-list.jsp"><button>목록으로</button></a>
	</div>
	<%
	} else {
	out.println("에러");
	}
	%>
</body>
</html>