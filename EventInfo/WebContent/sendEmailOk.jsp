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
	String code = String.valueOf(request.getAttribute("code"));
	String id = String.valueOf(request.getAttribute("id"));
%>
<form id="form" action="inputPwCode.do" method="post">
<input type="hidden" id="code" name="code" value="<%=code %>">
<input type="hidden" id="id" name="id" value="<%=id %>">
</form>
<%if(result == 2) {%>
	<script>
		alert('아이디가 존재하지 않습니다.');
		history.back();
	</script>
<%}else if(result == 0){%>
	<script>
		alert('전화번호가 존재하지 않습니다.');
		history.back();
	</script>
<%}else if(result == 3){ %>
	<script>
		alert('이메일 전송 오류');
		history.back();
	</script>
<%} else{%>
	<script>
		alert('이메일 전송 성공. 메일함을 확인해주세요');
		document.getElementById('form').submit();
	</script>
<%} %>
</body>
</html>