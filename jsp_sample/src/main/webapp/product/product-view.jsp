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
	String itemNo = request.getParameter("itemNo");
	String sql = "select * from tbl_product where item_no = "+ itemNo;
	
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	out.println("제품명 : " + rs.getString("item_name") + "<br>");
	out.println("가격 : " + rs.getString("price") + "<br>");
	%>
	<hr>
	<div>리뷰</div>
	<%
	String reviewSql = "select * from tbl_review where item_no = "+itemNo;
	ResultSet reviewRS = stmt.executeQuery(reviewSql);
	
	while(reviewRS.next()){
		out.println(reviewRS.getString("contents")+" | "+reviewRS.getString("score") + "<br>");
	}
	%>
	<div>
		<button onclick="fnEdit()">수정</button>
		<!-- 수정 버튼 누르면 "아직 준비중 입니다" 출력 후 메뉴로 이동 -->
		<button onclick="fnRemove()">삭제</button>
	</div>
	
	
</body>
</html>
<script>
	function fnEdit(){
		alert("현재 수정은 불가능합니다.");
		location.href="product-list.jsp";
	}
	function fnRemove(){
		if(!confirm("정말 삭제?")){
			return;
		}
		location.href="product-remove.jsp?itemNo=<%= itemNo %>"
	}
</script>