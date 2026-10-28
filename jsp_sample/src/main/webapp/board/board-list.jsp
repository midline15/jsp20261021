<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td, th {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
}

td a {
	text-decoration: none;
	color: black;
}

.page a {
	text-decoration: none;
	color: black;
	margin-right: 3px;
}

.active {
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../db.jsp"%>
	<h4 style="display: inline-block;"><%=session.getAttribute("sessionName")%>님이
		접속중입니다
	</h4>
	<a href="login.jsp"><button>로그아웃</button></a>
	<hr>
	<h2>게시글 목록</h2>
	<hr>
	<%
	String sessionRole = (String) session.getAttribute("sessionRole");
	String sessionId = (String) session.getAttribute("sessionId");
	String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
	String keywordSql = " where title like '%" + keyword + "%'";
	String kind = request.getParameter("kind") != null ? request.getParameter("kind") : "";
	String kindSql = kind.isEmpty() ? "" : " and kind = " + kind;
	String order = request.getParameter("order") == null? "boardNo" : request.getParameter("order");
	String orderSql = " order by b."+order;
	
	/* 페이징에 사용할 변수 */
	int pageSize = request.getParameter("size") == null || request.getParameter("size").isBlank()
			? 5
			: Integer.parseInt(request.getParameter("size"));
	int currentPage = request.getParameter("page") == null || request.getParameter("page").isBlank()
			? 1
			: Integer.parseInt(request.getParameter("page"));
	int offset = (currentPage - 1) * pageSize;
	String pageSql = " offset " + offset + " rows fetch next " + pageSize + " rows only";

	String cntSql = "select count(*) as total from tbl_board" + keywordSql + kindSql;
	ResultSet cntRS = stmt.executeQuery(cntSql);
	cntRS.next();
	int total = cntRS.getInt("total");
	int maxPage = (int) Math.ceil((double) total / pageSize);
	/**/

	ResultSet rs = null;
	String sql = "select b.*, nvl(cc, 0) as cc from tbl_board b left join (" +
			" select boardno,"+
	        " count(*) cc" +
	    " from tbl_comment" +
	    " group by boardno"+
	" ) t on b.boardno = t.boardno " + keywordSql + kindSql + orderSql + pageSql;
	//System.out.println(sql);
	rs = stmt.executeQuery(sql);
	int kindList[] = {1, 2, 3};
	%>
	<form action="" name="form">
		<div>
			검색어 : <input name="keyword" value=<%=keyword%>>
			<input value="검색" type="button" onclick="fnPage(1)">
			<select name="kind" onchange="fnPage(1)">
				<option value="">:: 전체 ::</option>
				<%
				for (int i = 0; i < kindList.length; i++) {
				%>
				<option value="<%=kindList[i]%>" <%=kind.equals(Integer.toString(kindList[i])) ? "selected" : ""%>>
				<%=kindList[i] == 1 ? "공지" : kindList[i] == 2? "자유" : kindList[i] == 3 ? "질문" : ""%>
				</option>
				<%
				}
				%>
			</select>
		</div>
		<hr>
		<div>
			<select name="size" onchange="fnPage(1)">
				<%
				int pageArr[] = {5,10,20,50};
				for(int i =0; i<pageArr.length; i++){
				%>
					<option value="<%=pageArr[i]%>" <%= pageSize == pageArr[i]? "selected": "" %>><%= pageArr[i] %>개씩</option>
				<%	
				}
				%>
			</select>|
			<label><input onchange="fnPage(1)" type="radio" name="order" value="boardNo" <%= order.equals("boardNo")? "checked":"" %>>번호순</label>
			<label><input onchange="fnPage(1)" type="radio" name="order" value="title" <%= order.equals("title")? "checked":"" %>>제목순</label>
		</div>
		<hr>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>삭제</th>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<%
			while (rs.next()) {
				//out.println("<li>" + rs.getString("CONTENTS") + "</li>");
			%>
			<tr>
				<td><%=rs.getString("BOARDNO")%></td>
				<td><a
					href="board-view.jsp?boardNo=<%=rs.getString("BOARDNO")%>"><%=rs.getString("TITLE")%>
					<%
					if(rs.getInt("cc") !=0){
						out.println("<span style='color: orange;'>["+ rs.getInt("cc") +"]</span>");
					}
					%></a></td>
				<td><%=rs.getString("USERID")%></td>
				<td><%=rs.getString("CNT")%></td>
				<td>
					<%
					if (sessionId.equals(rs.getString("USERID")) || sessionRole.equals("A")) {
					%>
					<button onclick="fnRemove(<%=rs.getString("BOARDNO")%>)">삭제</button>
					<%
					}
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<div class="page">
			<a href="javascript:;" onclick="fnPage(<%=currentPage - 1 %>)"
				<%=currentPage == 1 ? "hidden" : ""%>>◀</a>
			<%
			for (int i = 1; i <= maxPage; i++) {
			%>
			<%-- <a class="active" href="?page=<%=i%>&size=<%= pageSize %>"><%=i%></a> --%>
			<a class="<%=currentPage == i ? "active" : ""%>" href="javascript:;"
				onclick="fnPage(<%=i%>)"><%=i%></a>

			<%
			}
			%>
			<a href="javascript:;" onclick="fnPage(<%=currentPage +1 %>)"
				<%=currentPage == maxPage ? "hidden" : ""%>>▶</a>
		</div>
		<input type="hidden" name="page">
		<div>
			<a href="board-add.jsp"><button onclick="return false;">글쓰기</button></a>
		</div>
	</form>
</body>
</html>

<script>
let form = document.form;
	function fnView(boardNo){
		location.href="board-view.jsp?boardNo="+boardNo;
	}
	function fnRemove(boardNo){
		if (!confirm("삭제?")) {
			return;
		} else {
			location.href = "board-remove-result.jsp?boardNo=" +boardNo;
		}
	}
	function fnPage(page) {
		form.page.value = page;
		form.submit();
	}
</script>