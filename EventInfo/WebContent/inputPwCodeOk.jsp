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
	String id = String.valueOf(request.getAttribute("id"));
%>
<form id="form" action="inputNewPw.do" method="post">
<input type="hidden" id="id" name="id" value="<%=id %>">
</form>
<%if(result == 1) {%>
	<script>
		alert('인증 성공. 새로운 비밀번호를 입력해주세요');
		document.getElementById('form').submit();
	</script>
<%}else{%>
	<script>
		alert('인증 실패하였습니다.');
		history.back();
	</script>
<%} %>
</body>
</html>