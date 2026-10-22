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
	<%
	String stuNo = request.getParameter("stuNo");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String grade = request.getParameter("grade");
	String deptNo = request.getParameter("deptNo");
	String sql = "update stu set "+
				" name = '" + name +
				"', id = '" + id +
				"', grade = " + grade +
				", deptno1 = " + deptNo +
				" where stuno = " + stuNo;
	int result = stmt.executeUpdate(sql);
	if (result == 1) {
		out.println("성공");

	} else {
		out.println("실패");
	}
	%>
	<a href="stu-list.jsp">목록으로</a>
</body>
</html>