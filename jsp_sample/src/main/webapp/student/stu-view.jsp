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

td {
	width: 300px;
	text-align: left;
	padding: 10px;
}

th {
	background-color: #eee;
	padding: 10px 20px;
}

td input {
	width: 270px;
	height: 25px;
}
.btn {
	margin: 10ps 3ps;
}
</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
	<%
	String stuNo = request.getParameter("stuNo");
	String sql = "select * from stu s join department d on s.deptno1=d.deptno where stuno="+stuNo;
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()){
	%>
	
	<table>
		<tr>
			<th>학번</th>
			<td><%=rs.getString("stuno") %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=rs.getString("name") %></td>
		</tr>
		<tr>
			<th>학년</th>
			<td><%=rs.getString("grade") %></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%=rs.getString("jumin").substring(0, 6)%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=rs.getString("tel") %></td>
		</tr>
		<tr>
			<th>학과</th>
			<td><%=rs.getString("dname") %></td>
		</tr>
	</table>
	<div>
		<button onclick="fnRemove()">삭제</button>
		<a href="stu-edit.jsp?stuNo=<%=stuNo%>"><button>수정</button></a>
	</div>
	<%}else{
		out.println("학생어디감");
	} %>
</body>
</html>

<script>
	function fnRemove(){
		if(!confirm("삭제?")){
			return;
		}
		location.href="stu-remove-result.jsp?stuNo=<%=stuNo%>";
	}
</script>