<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int result = Integer.parseInt(String.valueOf(request.getAttribute("result"))); 
	//전 페이징 페이지 수
	int nowPage = Integer.parseInt(request.getParameter("page"));
%>
<%if(result == 1){ %>
	<script>
		alert('삭제 성공');
		location.replace('review.do?page=<%=nowPage%>');
	</script>
<%}else{ %>
	<script>
		alert('삭제 실패');
		history.back();
	</script>
<%} %>
</body>
</html>