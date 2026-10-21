<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- id/pwd 가 test 1234 로그인 성공 아니면 실패 -->
	
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		if(userId.equals("test") && pwd.equals("1234")){
			out.println("로그인 성공!");
		} else {
			out.println("로그인 실패");
		}
	%>
	<%=
		userId 
	%>
	/
	<%=
		pwd 
	%>
</body>
</html>