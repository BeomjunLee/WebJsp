<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int result = Integer.parseInt(String.valueOf(request.getAttribute("result")));
	String id = request.getParameter("id");
%>
<%
if(result == 1){%>
<form>
	<%=id %>는<br> 사용 가능한 아이디입니다.<br>
	<input type="button" value="사용" onclick="idConfirm()"> <input type="button" value="취소" onclick="window.close();">
</form>
<%
}else{
%>
	<%=id %>는<br> 사용이 불가능한 아이디입니다.<br>
	<input type="button" value="다시 입력하기" onclick="window.close();">
<%
}
%>
</body>
<script>
//아이디 중복체크창에서 사용 클릭시
function idConfirm(){
	var id = "<%=id %>";
	opener.document.getElementById("idCheck").value = id;
	window.close();
}
</script>
</html>