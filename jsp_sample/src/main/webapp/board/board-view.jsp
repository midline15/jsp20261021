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
	<!-- 게시글 번호,  제목, 내용, 작성자, 작성일 출력 -->
	<%
	String boardNo = request.getParameter("boardNo");
	String sql = "select * from tbl_board where BOARDNO = '" + boardNo + "'";
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
	%>

	<h3><%=rs.getString("BOARDNO")%></h3>
	<h3><%=rs.getString("TITLE")%></h3>
	<h4><%=rs.getString("CONTENTS")%></h4>
	<h4><%=rs.getString("USERID")%></h4>
	<h4><%=rs.getString("CDATETIME")%></h4>

	<%
	} else {
	out.println("삭제된 게시글 입니다.");
	%>

	<a href="board-list.jsp"><button>되돌아가기</button></a>

	<%
	}
	%>
</body>
</html>