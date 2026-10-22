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
	<%@ include file="../db.jsp"%>
	<%
	String sql = "select * from department where build is not null";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<form action="stu-add-result.jsp" name="form">
		<table>
			<tr>
				<th>학번</th>
				<td><input name="stuNo"></td>
				<th>이름</th>
				<td><input name="stuName"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="stuId"></td>
				<th>학년</th>
				<td><select name="stuGrade">
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
				</select></td>
			</tr>
			<tr>
				<th>학과</th>
				<td colspan="3"><select name="deptNo">
						<%
						while (rs.next()) {
						%>
						<option value="<%=rs.getString("deptno")%>"><%=rs.getString("dname")%></option>
						<%
						}
						%>
				</select></td>
			</tr>
		</table>
		<div>
			<input onclick="fnAdd()" type="button" value="학생추가" class="btn"> 
			<input type="reset" value="초기화" class="btn"> 
			<a href="stu-list.jsp"><button class="btn">목록으로</button></a>
		</div>
	</form>

</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		console.log(form);
		if(form.stuNo.value.length != 4){
			alert("학번은 4글자입니다");
			return;
		}
		form.submit();
	}
</script>