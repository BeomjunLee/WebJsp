<%@page import="com.event.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>
</head>
<body>
<%
	Member member = (Member)request.getAttribute("member");	
%>
<%=member.getId() %><br>
	
</body>
</html>