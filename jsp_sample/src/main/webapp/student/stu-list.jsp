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
</style>
</head>
<body>
	<%@ include file="../db.jsp"%>
	<%
	String keyword = request.getParameter("keyword");
	String search = !keyword.isEmpty()?" and name like '%"+keyword+"%'":"";
	String sql = "select s.stuno, s.name, s.id, s.grade, d.dname, decode(substr(s.jumin,7,1),1,'남자',2,'여자','몰루') as GENDER"
			+ " from stu s join department d on s.deptno1 = d.deptno where 1=1" + search;
	ResultSet rs = stmt.executeQuery(sql);
	int gradeList[] = {1,2,3,4};
	%>
	<form name="form">
		<div>
			검색어 : <input name="keyword">
			<button onclick="fnSearch()">검색</button>
			<select name="grade">
				<option> :: 전체 :: </option>
				<%
				for(int i = 0; i < gradeList.length; i++){
				%>
					<option value="<%= gradeList[i] %>>"><%= gradeList[i] %>학년</option>
				<%
				}
				%>
			</select>
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
		<div>
			<a href="stu-add.jsp"><button>학생추가</button></a>
		</div>
	</form>

</body>
</html>
<script>
	function fnSearch(){
		let form = document.form;
		location.href="stu-list.jsp?keyword="+form.keyword.value;
	}
</script>