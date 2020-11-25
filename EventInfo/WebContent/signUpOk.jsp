<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int result = Integer.parseInt(String.valueOf(request.getAttribute("result"))); %>
<%if(result == 1) {%>
<script>
	alert('회원가입 성공');
	location.replace("login.do");
</script>
<%} %>
<%if(result == 0) {%>
<script>
	alert('회원가입 실패! 계속될경우 관리자에게 문의해주세요');
	location.replace("signUp.do");
</script>
<%} %>
</body>
</html>