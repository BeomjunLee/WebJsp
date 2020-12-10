<%@page import="com.event.domain.Pagination"%>
<%@page import="com.event.domain.Review"%>
<%@page import="java.util.List"%>
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

	List<Review> reviews = null;
	reviews = (List<Review>)request.getAttribute("reviews");
	Pagination pagination = (Pagination)request.getAttribute("pagination");
%>

	<div style="width:100%;height:8px;;background-color:#fdf4f4;"></div>
<div style="background-color:#fdf4f4;">
	<div class="mP_wrap">
		<div class="mP_container">
			<span style="font-size: 2em; font-family: 'NIXGONM-Vb';" class="mP_main_title">회원정보</span>
			<hr style="color:grey;">
			<div style="display:flex;">
				<div class="mP_sub_container">
					<div class="mP_info">
						<span>아이디</span><span><%=member.getId() %></span>
					</div>
					<div class="mP_info">
						<span>이름</span><span><%=member.getName() %></span>
					</div>
					<div class="mP_info">
						<span>이메일</span><span><%=member.getEmail() %></span>
					</div>
				</div>
	
				<div class="mP_sub_container">
					<div class="mP_info">
						<span>나이</span><span><%=member.getAge() %></span>
					</div>
					<div class="mP_info">
						<span>성별</span><span><%=member.getGender()%></span>
					</div>
					<div class="mP_info">
						<span>전화번호</span><span style="width:200px;"><%=member.getPhoneNum() %></span>
					</div>
						<div class="mP_info">
						<span>주소</span><span style="width:200px;"><%=member.getAddress() %></span>
					</div>
				</div>
				</div>
					<div class="mP_info">
						<input class="button1" type="button"  value="회원 수정" onclick="location.href='updateMyPage.do'">
					</div>
			</div>

		<div class="mP_container">
		<span style="font-size: 2em; font-family: 'NIXGONM-Vb';" class="mP_main_title">나의리뷰</span>
		<hr style="color:grey;margin-bottom:10px;">
		<table style=" font-family: 'IBMPlexSansKR-Regular'; width:100%; font-size:0.9em;color:#000000;">
           <thead>
               <tr>
                  <th style="width:10%;">카테고리</th>
                  <th style="width:45%;">제목</th>
                  <th style="width:15%;">작성자</th>
                  <th style="width:20%;">작성일</th>
                  <th style="width:10%;">조회수</th>
               </tr>
            </thead>
            <tbody>
          <%for(Review review : reviews) {%>
               <tr style="font-weight:bold; text-align:center;">
                  <td><%if(review.getCategory().equals("men"))%>남자친구를 위한
                    <%if(review.getCategory().equals("women"))%>여자친구를 위한
                 	 <%if(review.getCategory().equals("parents"))%>부모님을 위한
                  </td>
                  <td><a href="readReview.do?uid=<%=review.getReview_uid()%>&page=<%=pagination.getPage()%>"><%=review.getTitle() %></a></td>
                  <td><%=review.getWriter() %></td>
                  <td><%=review.getRegdate() %></td>
                  <td><%=review.getView_count() %></td>
               </tr>
            <%} %> 
            </tbody>
			</table>
   <div align="center">
        <%if(pagination.getTotalListCnt() != 0){
           	if(pagination.getPage() != 1){%>
                <a href="myPage.do?page=1">처음으로</a>
                <%}
            if(pagination.getPage() > pagination.getPageSize()){ %>    
            	<a href="myPage.do?page=<%=pagination.getPreBlock()%>">&laquo;</a>
       		<%}
        }%>
        <%
        	for(int i=pagination.getStartPage(); i <= pagination.getEndPage(); i++) {%>
        		<a href="myPage.do?page=<%=i%>"><%=i%></a>
        <%} 
        	if(pagination.getTotalListCnt() != 0){
            if(pagination.getStartPage() + pagination.getBlockSize() - 1 < pagination.getTotalPageCnt()){%>
                <a href="myPage.do?page=<%=pagination.getNextBlock()%>">&raquo;</a>
            <%}
         	  if(pagination.getPage() != pagination.getTotalPageCnt()){%>
                <a href="myPage.do?page=<%=pagination.getTotalPageCnt()%>">마지막으로</a>
            <%} 
      	}%>
    </div>
		</div>
	</div>
</div>
<div style="width:100%; height:10%; background-color:#fdf4f4; box-shadow:5px 5px #eeeeee;"></div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false" />
</html>