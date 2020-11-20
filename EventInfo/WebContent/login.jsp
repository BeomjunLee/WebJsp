<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꽃담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>
</head>
<body>
<form action="loginOk.do" method="post">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="pw">
	<input type="submit" value="로그인">
</form>
</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>