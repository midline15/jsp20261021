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
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionRole = (String) session.getAttribute("sessionRole");
	String boardNo = request.getParameter("boardNo");
	String sql = "select * from tbl_board where BOARDNO = '" + boardNo + "'";
	String updateSql = "update tbl_board set CNT = CNT +1 where BOARDNO = " + boardNo;
	stmt.executeUpdate(updateSql);

	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
	%>

	<h3><%=rs.getString("BOARDNO")%>
		| 조회수 :
		<%=rs.getString("CNT")%></h3>
	<h3><%=rs.getString("TITLE")%></h3>
	<h4><%=rs.getString("CONTENTS")%></h4>
	<h4><%=rs.getString("USERID")%></h4>
	<h4><%=rs.getString("CDATETIME")%></h4>
	<div>
		<%
		if (sessionId.equals(rs.getString("USERID")) || sessionRole.equals("A")) {
		%>
		<input onclick="fnEdit()" type="button" value="수정"> <input
			onclick="fnRemove()" type="button" value="삭제">
		<%
		}
		%>
	</div>
	<%
	} else {
	out.println("삭제된 게시글 입니다.");
	%>

	<a href="board-list.jsp"><button>되돌아가기</button></a>

	<%
	}
	%>
	<hr>
	<%
	String csql = "select * from tbl_comment where boardno = " + boardNo;
	ResultSet crs = stmt.executeQuery(csql);
	while (crs.next()) {
		String commentNo = crs.getString("commentno");
		out.println(crs.getString("userid") + " : ");
		out.println(crs.getString("contents"));
		if (crs.getString("userid").equals(sessionId) || sessionRole.equals("A")) {
			out.println("<button>수정</button>");
			out.println("<button onclick='fnCommentRemove("+commentNo+")'>삭제</button>");
		}
		out.println("<br>");
	}
	%>
	<br>
	<form action="comment-add-result.jsp">
		<div>
			댓글등록 : <input name="contents" required="required">
			<input type="hidden" name="boardNo" value="<%= boardNo %>"> 
			<input type="submit" value="등록">
		</div>
	</form>
</body>
</html>
<script>
	function fnRemove() {
		if (!confirm("삭제?")) {
			return;
		} else {
			location.href = "board-remove-result.jsp?boardNo=<%=boardNo%>";
		}
	}
	function fnEdit() {
		location.href = "board-edit.jsp?boardNo=<%=boardNo%>";
	}
	function fnCommentRemove(commentNo){
		if (!confirm("삭제?")) {
			return;
		} else {
			location.href = "comment-remove-result.jsp?boardNo=<%= boardNo%>&commentNo="+ commentNo;
		}
	}
</script>