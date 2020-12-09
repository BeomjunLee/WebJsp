<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/signUp.css">
<title>Insert title here</title>
</head>
<body>
<% int result = Integer.parseInt(String.valueOf(request.getAttribute("result")));
	String id = request.getParameter("id");
%>
<%
if(result == 1){%>
<form class = "container1">
	<p class ="p1">중복확인</p>
	<p class = "p2"><%=id %>는 사용 가능한 아이디입니다.</p>
	<div class ="container2"><input class="button1" type="button" value="사용" onclick="idConfirm()"> <input class="button1" type="button" value="취소" onclick="window.close();"></div>
</form>
<%
}else{
%>
	<%=id %>는<br> 사용이 불가능한 아이디입니다.<br>
	<input class="button1" type="button" value="다시 입력하기" onclick="window.close();">
<%
}
%>
</body>
<script>
//아이디 중복체크창에서 사용 클릭시
function idConfirm(){
	var id = "<%=id %>";
	opener.document.getElementById("idCheck").value = id;
	opener.document.getElementById("test").value = 1;
	window.close();
}
</script>
</html>