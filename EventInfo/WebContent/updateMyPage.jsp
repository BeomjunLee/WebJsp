<%@page import="com.event.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈담화</title>
<link rel="stylesheet" href="front/css/myPage.css">
<jsp:include page="fragment/header.jsp" flush="false" />
<%
	Member member = (Member)request.getAttribute("member");
%>

	<div style="width:100%;height:8px;;background-color:#fdf4f4;"></div>
<div style="background-color:#fdf4f4;">
	<div class="mP_wrap">
		<div class="mP_container">
			<span style="font-size: 2em; font-family: 'NIXGONM-Vb';" class="mP_main_title">회원정보</span>
			<hr style="color:grey;">
			<form action="updateMyPageOk.do" method="post">
			<div style="display:flex;">
				<div class="mP_sub_container">
					<div class="mP_info">
						<span>아이디</span><span><%=member.getId() %></span>
					</div>
					<div class="mP_info">
						<span>이름</span><input type="text" name="name" value="<%=member.getName()%>">
					</div>
					<div class="mP_info">
						<span>이메일</span><input type="text" name="email" value="<%=member.getEmail()%>">
					</div>
				</div>
	
				<div class="mP_sub_container">
					<div class="mP_info">
						<span>나이</span><input type="text" name="age" value="<%=member.getAge()%>">
					</div>
					<div class="mP_info">
						<span>성별</span><span><%=member.getGender()%></span>
					</div>
					<div class="mP_info">
						<span>전화번호</span><input type="text" name="phoneNum" value="<%=member.getPhoneNum()%>">
					</div>
						<div class="mP_info">
						<span>주소</span><span style="width:200px;"><input type="text" size="60" name="address" value="<%=member.getAddress() %>"></span>
					</div>
				</div>
				</div>
					<div class="mP_info">
						<input class="button1" type="submit"  value="수정하기">
						<input class="button1" type="button"  value="취소" onclick="history.back()">
					</div>
			</form>
			</div>

<div style="width:100%; height:10%; background-color:#fdf4f4; box-shadow:5px 5px #eeeeee;"></div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false" />
</html>