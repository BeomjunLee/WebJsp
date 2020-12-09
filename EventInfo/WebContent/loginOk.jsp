<%@page import="com.event.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>
</head>
<body>
<%
	int result = Integer.parseInt(String.valueOf(request.getAttribute("result")));
%>
<%if(result == 1){%>
<script>
	alert('로그인 성공');
	location.replace("main.do");
</script><%}%>
<%if(result == 2){%>
<script>
	alert('아이디가 없습니다');
	location.replace("login.do");
</script><%}%>
<%if(result == 3){%>
<script>
	alert('비밀번호가 일치하지 않습니다');
	history.back();
</script><%}%>
</body>
</html>