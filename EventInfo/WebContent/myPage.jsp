<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>
	
	<h2>회원 정보</h2>    <br>
	
	아이디 : dwddd<br>
	이름 : 이범준 <br>
	전화번호 : 01000000000<br>
	나이 : 25<br>
	성별 : Men<br>
	
<hr>


<input type="button" value="나의 리뷰 보기"><br> <!-- 나의 리뷰보기 클릭했을때 리뷰 테이블이 나옴 -->
<table>
	<tr>
		<th>제목</th>
		<th>날짜</th>
	</tr>
	<tr>
		<td>안녕하세요</td>
		<td>2020-12-03</td>
	</tr>
</table>

</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>