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
Long review_uid = Long.parseLong(String.valueOf(request.getAttribute("review_uid")));
int nowPage = Integer.parseInt(String.valueOf(request.getAttribute("page")));
%>
<%if(result == 1) {%>
<script>
	alert('등록 성공');
	location.replace("readReview.do?uid=<%=review_uid%>&page=<%=nowPage%>");
</script>
<%} %>
<%if(result == 0) {%>
<script>
	alert('등록 실패');
	history.back();
</script>
<%} %>
</body>
</html>