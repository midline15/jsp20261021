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
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");

	String sql = "SELECT * FROM TBL_USER WHERE USERID = '" + userId + "'";

	//String query ="SELECT * FROM TBL_USER WHERE USERID = '"+userId+"' AND PWD = '"+pwd+"'";
	/* out.println(query); */
	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		if (pwd.equals(rs.getString("PWD"))) {
			
			
			response.sendRedirect("board-list.jsp");
		} else {
			out.println("비밀번호를 확인해주세요");
		}
	} else {
		out.println("아이디가 존재하지 않습니다.");
	}
	%>
</body>
</html>