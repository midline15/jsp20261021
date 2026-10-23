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
	String paramSi = request.getParameter("si") != null ? request.getParameter("si") : "";
	String paramGu = !paramSi.isBlank() ? request.getParameter("gu") : "";
	String paramDong = !paramGu.isBlank() ? request.getParameter("dong") : "";
	String siQuery = "select * from area where gu is null order by si";
	ResultSet rs = stmt.executeQuery(siQuery);
	%>
	<form action="area.jsp" name="form">
		<div>
			<select name="si" onchange="fnSelect()">
				<option value="">::선택::</option>
				<%
				while (rs.next()) {
					String si = rs.getString("si");
					String selected = si.equals(paramSi) ? "selected" : "";
				%>
				<option value="<%=si%>" <%=selected%>><%=si%></option>
				<%
				}
				%>
			</select> <select name="gu" onchange="fnSelect()">
				<option value="">::선택::</option>
				<%
				String guQuery = "select * from area where dong is null and gu is not null";
				guQuery += " and si = '" + paramSi + "'";

				rs = stmt.executeQuery(guQuery);
				while (rs.next()) {
					String gu = rs.getString("gu");
					String selected = gu.equals(paramGu) ? "selected" : "";
				%>
				<option value="<%=gu%>" <%=selected%>><%=gu%></option>
				<%
				}
				%>
			</select> <select name="dong" onchange="fnSelect()">
				<option value="">::선택::</option>
				<%
				String dongQuery = "select * from area where dong is not null";
				dongQuery += " and si = '" + paramSi + "'" + " and gu = '" + paramGu + "'";

				rs = stmt.executeQuery(dongQuery);
				while (rs.next()) {
					String dong = rs.getString("dong");
					String selected = dong.equals(paramDong) ? "selected" : "";
				%>
				<option value="<%=dong%>" <%=selected%>><%=dong%></option>
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