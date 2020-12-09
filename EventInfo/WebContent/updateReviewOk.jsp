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
	//Long review_uid = Long.parseLong(String.valueOf(request.getAttribute("review_uid")));
%>
<%if(result == 1){ %>
	<script>
		alert('수정 성공');
		location.replace('review.do');
	</script>
<%}else{ %>
	<script>
		alert('수정 실패');
		history.back();
	</script>
<%} %>
</body>
</html>