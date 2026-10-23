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
	<%
	
	String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
	String keywordSql = " where name like '%" + keyword + "%'";
	String grade = request.getParameter("grade") != null ? request.getParameter("grade") : "";
	String gradeSql = grade.isEmpty() ? "" : " and grade = " + grade;
	String order = request.getParameter("order") == null? "name" : request.getParameter("order");
	String orderSql = " order by "+order;

	/* 페이징에 사용할 변수 */
	int pageSize = request.getParameter("size") == null || request.getParameter("size").isBlank()? 5 : Integer.parseInt(request.getParameter("size"));
	int currentPage = request.getParameter("page") == null || request.getParameter("page").isBlank()? 1 : Integer.parseInt(request.getParameter("page"));
	int offset = (currentPage - 1) * pageSize;
	String pageSql = " offset " + offset + " rows fetch next " + pageSize + " rows only";

	String cntSql = "select count(*) as total from stu" +keywordSql + gradeSql;
	ResultSet cntRS = stmt.executeQuery(cntSql);
	cntRS.next();
	int total = cntRS.getInt("total");
	int maxPage = (int) Math.ceil((double) total / pageSize);
	/**/

	
	String sql = "select s.stuno, s.name, s.id, s.grade, d.dname, decode(substr(s.jumin,7,1),1,'남자',2,'여자','몰루') as GENDER"
			+ " from stu s join department d on s.deptno1 = d.deptno" 
			+ keywordSql 
			+ gradeSql
			+ orderSql
			+ pageSql;

	ResultSet rs = stmt.executeQuery(sql);
	int gradeList[] = {1, 2, 3, 4};
	%>
	<form name="form" action="stu-list.jsp">
		<div>
			검색어 : <input name="keyword" value=<%=keyword%>>
			<input value="검색" type="button" onclick="fnSearch()">
			<select name="grade" onchange="fnGrade()">
				<option value="">:: 전체 ::</option>
				<%
				for (int i = 0; i < gradeList.length; i++) {
				%>
				<option value="<%=gradeList[i]%>"
					<%=grade.equals(Integer.toString(gradeList[i])) ? "selected" : ""%>><%=gradeList[i]%>학년
				</option>
				<%
				}
				%>
			</select>
		</div>
		<hr>
		<div>
			<select name="size" onchange="fnSize()">
				<%
				int pageArr[] = {5,10,20,50};
				for(int i =0; i<pageArr.length; i++){
				%>
					<option value="<%=pageArr[i]%>" <%= pageSize == pageArr[i]? "selected": "" %>><%= pageArr[i] %>개씩</option>
				<%	
				}
				%>
			</select>|
			<label><input onchange="fnSearch()" type="radio" name="order" value="name" <%= order.equals("name")? "checked":"" %>>이름순</label>
			<label><input onchange="fnSearch()" type="radio" name="order" value="stuNo" <%= order.equals("stuNo")? "checked":"" %>>학번순</label>
			<label><input onchange="fnSearch()" type="radio" name="order" value="dname" <%= order.equals("dname")? "checked":"" %>>학과순</label>
		</div>
		<hr>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>아이디</th>
				<th>학년</th>
				<th>학과명</th>
				<th>성별</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("stuno")%></td>
				<td><a href="stu-view.jsp?stuNo=<%=rs.getString("stuno")%>"><%=rs.getString("name")%></a></td>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("grade")%></td>
				<td><%=rs.getString("dname")%></td>
				<td><%=rs.getString("gender")%></td>
			</tr>
			<%
			}
			%>
		</table>

		<div class="page">
			<a href="javascript:;" onclick="fnPrevPage()" <%= currentPage == 1 ? "hidden": "" %>>◀</a>
			<%
			for (int i = 1; i <= maxPage; i++) {
			%>
					<%-- <a class="active" href="?page=<%=i%>&size=<%= pageSize %>"><%=i%></a> --%>
					<a class="<%=currentPage == i? "active": "" %>" href="javascript:;" onclick="fnPage(<%=i %>)"><%=i%></a>
			
			<%
			}
			%>
			<a href="javascript:;" onclick="fnNextPage()" <%= currentPage == maxPage ? "hidden": "" %>>▶</a>
		</div>

		<div>
			<a href="stu-add.jsp"><button onclick="return false;">학생추가</button></a>
		</div>
		<input name="page" type="hidden">
	</form>

</body>
</html>
<script>
	function fnSearch() {
		let form = document.form;
		form.submit();
	}
	function fnGrade() {
		let form = document.form;
		form.submit();
	}
	function fnSize() {
		let form = document.form;
		form.submit();
	}
	function fnPage(page) {
		let form = document.form;
		form.page.value = page;
		form.submit();
	}
	function fnPrevPage(){
		let form = document.form;
		form.page.value = <%=currentPage%> - 1;
		form.submit();
	}
	function fnNextPage(){
		let form = document.form;
		form.page.value = <%=currentPage%> + 1;
		form.submit();
	}
</script>