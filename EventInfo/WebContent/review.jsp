<%@page import="com.event.domain.Pagination"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.event.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta charset="UTF-8">
 <title>눈담화</title>
 <link rel="stylesheet" href="front/css/review.css">
<jsp:include page="fragment/header.jsp" flush="false"/>

<%	
	List<Review> reviews = new ArrayList<>();
	reviews = (List<Review>)request.getAttribute("reviews");
	Pagination pagination = (Pagination)request.getAttribute("pagination");
//세션 체크
	String uid = "";
	if(session.getAttribute("session")!= null){
		uid = session.getAttribute("session").toString();
	}else{
		uid = (String)session.getAttribute("session");
	}
%> 
    <div class="container">
      <div class = "row">
      	<div class = "sub_container">
      		<span class = "main_title">리뷰 게시판</span>
      	</div>
      <select class="review_select" name="rivew_sel">
        <option value="all">모두보기</option>
        <option value="men">남자친구를 위한</option>
        <option value="women">여자친구를 위한</option>
        <option value="parents">부모님을 위한</option>
      </select>
	 
         <table class="table-striped">
            <thead>
               <tr>
                  <th class = "table_color" >추천수</th>
                  <th class = "table_color" >제목</th>
                  <th class = "table_color" >작성자</th>
                  <th class = "table_color" >작성일</th>
                  <th class = "table_color" >조회수</th>
               </tr>
            </thead>
            <tbody>
     		 <%for(Review review : reviews) {%>
               <tr>
                  <td><%=review.getRecommend() %></td>
                  <td><a href="readReview.do?uid=<%=review.getReview_uid()%>"><%=review.getTitle() %></a></td>
                  <td><%=review.getWriter() %></td>
                  <td><%=review.getRegdate() %></td>
                  <td><%=review.getView_count() %></td>
               </tr>
            <%} %> 
         <!--   	 <tr>
                  <td>안녕하세요 </td>
                  <td>이범준</td>
                  <td>2020-12-03</td>
                  <td>2</td>
                  <td>7</td>
           	 </tr> --> 
            </tbody>
         </table>

   <div align="center" >
        <%if(pagination.getTotalListCnt() != 0){
           	if(pagination.getPage() != 1){%>
                <a href="review.do?page=1">처음으로</a>
                <%}
            if(pagination.getPage() > pagination.getPageSize()){ %>    
            	<a href="review.do?page=<%=pagination.getPreBlock()%>">&laquo;</a>
       		<%}
        }%>
        <%
        	for(int i=pagination.getStartPage(); i <= pagination.getEndPage(); i++) {%>
        		<a href="review.do?page=<%=i%>"><%=i%></a>
        <%} 
        	if(pagination.getTotalListCnt() != 0){
            if(pagination.getStartPage() + pagination.getBlockSize() - 1 < pagination.getTotalPageCnt()){%>
                <a href="review.do?page=<%=pagination.getNextBlock()%>">&raquo;</a>
            <%}
         	  if(pagination.getPage() != pagination.getTotalPageCnt()){%>
                <a href="review.do?page=<%=pagination.getTotalPageCnt()%>">마지막으로</a>
            <%} 
      	}%>
    </div>
    
		<%if(uid != null){ %>
         <a href = "writeReview.do" class="write_review">글쓰기</a>
        <%} %>
      </div>
   </div>

</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>