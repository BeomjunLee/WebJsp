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
%>
<%if(result == 0) {%>
	<script>
		alert('인증 실패하였습니다.');
		history.back();
	</script>
<%}else if(result == 1){%>
	<script>
		alert('비밀번호 변경이 완료되었습니다.');
		location.replace('login.do')
	</script>
<%} %>
</body>
</html>