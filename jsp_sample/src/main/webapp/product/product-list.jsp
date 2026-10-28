<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td, th {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
}

td a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>

	<%@ include file="../db.jsp" %>
	<%
	String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
	String sql = "select p.item_no, p.item_name, p.price, nvl(to_char(avg_score), '평점없음') as avg_score"
			+" from tbl_product p"
			+" left join ("
			+" select item_no, round(avg(score),2) as avg_score"
			+" from tbl_review"
		    +" group by item_no"
			+") t on p.item_no = t.item_no"
			+" where item_name like '%" + keyword +"%'"
			+" order by p.item_no";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<form action="product-list.jsp" name="form">
		<div>
				검색어 : <input name="keyword" value=<%=keyword%>>
				<input value="검색" type="button" onclick="fnSearch()">
		</div>
	</form>
	
	<table>
		<tr>
			<th>번호</th>
			<th>제품명</th>
			<th>가격</th>
			<th>평점</th>
		</tr>
		<%while(rs.next()) {%>
		<tr>
			<td><%=rs.getString("item_no") %></td>
			<td><a href="product-view.jsp?itemNo=<%=rs.getString("item_no") %>"><%=rs.getString("item_name") %></a></td>
			<td><%=rs.getString("price") %></td>
			<td><%=rs.getString("avg_score") %></td>
		</tr>
		<%} %>
	</table>
	<div>
		<button onclick="location.href='product-add.jsp'">제품 추가</button>
	</div>

</body>
</html>
<script>
	function fnSearch(){
		let form = document.form;
		form.submit();
	}
</script>