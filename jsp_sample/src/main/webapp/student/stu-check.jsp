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
 	String sql = "select * from stu where stuno = "+ stuNo;
 	String flg = "";
 	ResultSet rs = stmt.executeQuery(sql);
 	if(rs.next()){
 		out.println("이미 사용중인 학번");
 		flg = "Y";
 	} else {
 		out.println("사용가능");
 		flg = "N";
 	}
 	%>
	<div>
		<button onclick="fnClose()">되돌아가기</button>
	</div>
</body>
</html>
<script>
	function fnClose(){
		window.opener.fnReturn("<%=flg%>");
		window.close();	
	}
	
</script>