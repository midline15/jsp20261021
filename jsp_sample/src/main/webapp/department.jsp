<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="db.jsp"%>
	<%
	String param1 = request.getParameter("d1") != null ? request.getParameter("d1") : "";
	String param2 = !param1.isBlank() ? request.getParameter("d2") : "";
	String param3 = !param2.isBlank() ? request.getParameter("d3") : "";
	String sql1 = "select * from department where part is null ";
	ResultSet rs = stmt.executeQuery(sql1);
	%>
	<form action="department.jsp" name="form">
		<div>
			<select name="d1" onchange="fnSelect()">
				<option value="">::선택::</option>
				<%
				while (rs.next()) {
					String d1 = rs.getString("deptno");
					String selected = d1.equals(param1) ? "selected" : "";
				%>
				<option value="<%=rs.getString("deptno")%>" <%=selected%>><%=rs.getString("dname")%></option>
				<%
				}
				%>
			</select> <select name="d2" onchange="fnSelect()">
				<option value="">::선택::</option>
				<%
				String sql2 = "select * from department where build is null and part = '" + param1+ "'";

				rs = stmt.executeQuery(sql2);
				while (rs.next()) {
					String d2 = rs.getString("deptno");
					String selected = d2.equals(param2) ? "selected" : "";
				%>
				<option value="<%=rs.getString("deptno")%>" <%=selected%>><%=rs.getString("dname")%></option>
				<%
				}
				%>
			</select> <select name="d3" onchange="fnSelect()">
				<option value="">::선택::</option>
				<%
				String sql3 = "select * from department where part = '" + param2 + "'";

				rs = stmt.executeQuery(sql3);
				while (rs.next()) {
					String d3 = rs.getString("deptno");
					String selected = d3.equals(param3) ? "selected" : "";
				%>
				<option value="<%=rs.getString("deptno")%>" <%=selected%>><%=rs.getString("dname")%></option>
				<%
				}
				%>
			</select>
		</div>
	</form>

</body>
</html>
<script>
	function fnSelect() {
		let form = document.form;
		form.submit();
	}
</script>