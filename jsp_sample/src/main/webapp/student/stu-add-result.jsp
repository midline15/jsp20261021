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
	String stuName = request.getParameter("stuName");
	String stuId = request.getParameter("stuId");
	String stuGrade = request.getParameter("stuGrade");
	String deptNo = request.getParameter("deptNo");
	String sql = "insert into stu(stuno, name, id, grade, deptno1)" 
			+ " values("+stuNo+", '"+stuName+"', '"+stuId+"', "+stuGrade+", "+deptNo+")";
	System.out.println(sql);
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