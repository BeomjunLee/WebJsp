<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>눈담화</title>
<link rel="stylesheet" href="front/css/myPage.css">
<jsp:include page="fragment/header.jsp" flush="false" />


	<div style="width:100%;height:8px;;background-color:#fdf4f4;"></div>
<div style="background-color:#fdf4f4;">
	<div class="mP_wrap">
		<div class="mP_container">
			<span style="font-size: 2em; font-family: 'NIXGONM-Vb';" class="mP_main_title">회원정보</span>
			<hr style="color:grey;">
			<div style="display:flex;">
				<div class="mP_sub_container">
					<div class="mP_info">
						<span>아이디</span><span>cksgh2064</span>
					</div>
					<div class="mP_info">
						<span>이름</span><span>김찬호</span>
					</div>
					<div class="mP_info">
						<span>이메일</span><span>cksgh2064@naver.com</span>
					</div>
				</div>
	
				<div class="mP_sub_container">
					<div class="mP_info">
						<span>나이</span><span>25</span>
					</div>
					<div class="mP_info">
						<span>성별</span><span>남자</span>
					</div>
					<div class="mP_info">
						<span>전화번호</span><span style="width:200px;">010-3936-2064</span>
					</div>
				</div>
				</div>
			</div>

		<div class="mP_container">
		<span style="font-size: 2em; font-family: 'NIXGONM-Vb';" class="mP_main_title">나의리뷰</span>
		<hr style="color:grey;margin-bottom:10px;">
		<table style=" font-family: 'IBMPlexSansKR-Regular'; width:100%; font-size:0.9em;color:#000000;">
           <thead>
               <tr>
                  <th style="width:10%;">추천수</th>
                  <th style="width:45%;">제목</th>
                  <th style="width:15%;">작성자</th>
                  <th style="width:20%;">작성일</th>
                  <th style="width:10%;">조회수</th>
               </tr>
            </thead>
            <tbody>
            	<tr>
				  <th align =center>0</th>
                  <th align =center>와우</th>
                  <th align =center>김찬호</th>
                  <th align =center>2020-12-09</th>
                  <th align =center>1</th>
            	</tr>	
            </tbody>
			</table>
		</div>
	</div>
</div>
<div style="width:100%; height:10%; background-color:#fdf4f4; box-shadow:5px 5px #eeeeee;"></div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false" />
</html>