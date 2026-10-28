<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../db.jsp" %>

	<%
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String hobby[] = request.getParameterValues("hobby");
	for(String n : hobby){
		System.out.println(n);
	}
	
	String sql = "insert into tbl_user(USERID, PWD, NAME, CDATETIME, UDATETIME) VALUES('"
	+userId+"', '"+pwd+"', '"+name+"', SYSDATE, SYSDATE)";
	//System.out.println(sql);
	
	int result = stmt.executeUpdate(sql);
	if(result == 1){
		out.println("가입완료");
	}else{
		out.println("가입실패");
	}
	%>
</body>
</html>