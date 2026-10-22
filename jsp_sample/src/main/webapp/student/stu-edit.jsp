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
		String grade = rs.getString("grade");
		String deptNo = rs.getString("deptno1");
	%>
	
	<form action="stu-edit-result.jsp" name="form">
		<input type="hidden" name="stuNo" value=<%=rs.getString("stuno")%>>
		<table>
			<tr>
				<th>학번</th>
				<td><input value=<%=rs.getString("stuno")%> disabled></td>
				<th>이름</th>
				<td><input name="name" value=<%=rs.getString("name")%>></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="id" value=<%=rs.getString("id")%>></td>
				<th>학년</th>
				<td><select name="grade">
						<option value="1" <%= grade.equals("1")?"selected":""%>>1학년</option>
						<option value="2" <%= grade.equals("2")?"selected":""%>>2학년</option>
						<option value="3" <%= grade.equals("3")?"selected":""%>>3학년</option>
						<option value="4" <%= grade.equals("4")?"selected":""%>>4학년</option>
				</select></td>
			</tr>
			<tr>
				<th>학과</th>
				<td colspan="3"><select name="deptNo">
						<%
						String sql2 = "select * from department where build is not null";
						ResultSet rs2 = stmt.executeQuery(sql2);
						while (rs2.next()) {
							String deptNo2 = rs2.getString("deptno");
						%>
						<option value="<%=deptNo2%>"  <%= deptNo.equals(deptNo2)?"selected":""%>><%=rs2.getString("dname")%></option>
						<%
						}
						%>
				</select></td>
			</tr>
		</table>
		<div>
			<input onclick="fnEdit()" type="button" value="수정" class="btn"> 
		</div>
	</form>
	<%}else{
		out.println("학생어디감");
	} %>
</body>
</html>

<script>
	function fnEdit(){
		let form = document.form;
		console.log(form);
		if(form.stuNo.value.length != 4){
			alert("학번은 4글자입니다");
			return;
		}
		form.submit();
	}
</script>