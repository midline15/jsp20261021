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
	String stuNo = request.getParameter("stuNo");
	String sql = "delete from stu where stuno = "+stuNo;
	System.out.println(sql);
	int result = stmt.executeUpdate(sql);
	if(result == 1){
		out.println("삭제됨");
	}else{
		out.println("실패");
	}
	%>
	<a href="stu-list.jsp">목록으로</a>

</body>
</html>