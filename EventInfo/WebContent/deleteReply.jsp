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
Long review_uid = Long.parseLong(request.getParameter("uid"));
int nowPage = Integer.parseInt(request.getParameter("page"));
%>
<%if(result == 1) {%>
<script>
	alert('삭제 성공');
	location.replace("readReview.do?uid=<%=review_uid%>&page=<%=nowPage%>");
</script>
<%} %>
<%if(result == 0) {%>
<script>
	alert('삭제 실패');
	history.back();
</script>
<%} %>
</body>
</html>