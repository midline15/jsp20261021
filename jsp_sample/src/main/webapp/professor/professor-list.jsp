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
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
	String sql = "select profno, name, pay, nvl(bonus, 0) as bonus from professor";
	ResultSet rs = stmt.executeQuery(sql);
	
	%>
	<table>
		<tr>
			<th>교수번호</th>
			<th>이름</th>
			<th>급여</th>
			<th>보너스</th>
		</tr>
		<%while(rs.next()) {%>
			<tr>
				<td><%= rs.getString("profno") %></td>
				<td>
					<a href="professor-view.jsp?profNo=<%=rs.getString("profno") %>"><%= rs.getString("name") %></a>
				</td>
				<td><%= rs.getString("pay") %></td>
				<td><%= rs.getString("bonus") %></td>
			</tr>
		<%} %>
	</table>
	<div>
		<button onclick="location.href='professor-add.jsp'">교수추가</button>
	</div>
</body>
</html>