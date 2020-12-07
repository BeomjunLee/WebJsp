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

<%-- <%List<Review> reviews = new ArrayList<>();
reviews = (List<Review>)request.getAttribute("reviews");
%> --%>
    <div class="container">
      <div class = "row">
      <h3>리뷰 게시판</h3>
      <select class="review_select" name="rivew_sel">
        <option value="all">모두보기</option>
        <option value="men">남자친구를 위한</option>
        <option value="women">여자친구를 위한</option>
        <option value="parents">부모님을 위한</option>
      </select>
	 
         <table class="table-striped">
            <thead>
               <tr>
                  <th style="background-color: #eeeeee; text-align: center;">제목</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                  <th style="background-color: #eeeeee; text-align: center;">조회수</th>
                  <th style="background-color: #eeeeee; text-align: center;">추천수</th>
               </tr>
            </thead>
            <tbody>
    		<%--  <%for(Review review : reviews) {%>
               <tr>
                  <td><%=review.getTitle() %></td>
                  <td><%=review.getWriter() %></td>
                  <td><%=review.getRegdate() %></td>
                  <td><%=review.getView_count() %></td>
                  <td><%=review.getRecommend() %></td>
               </tr>
            <%} %> --%>
             <tr>
                  <td>안녕하세요 %></td>
                  <td>이범준</td>
                  <td>2020-12-03</td>
                  <td>2</td>
                  <td>7</td>
               </tr>
            </tbody>
         </table>

      <ul class="review_ul">
         <li><a href="#">1</a></li>
         <li><a href="#">2</a></li>
         <li><a href="#">3</a></li>
         <li><a href="#">4</a></li>
         <li><a href="#">5</a></li>
         <li><a href="#">6</a></li>
      </ul>

         <a href = "writeReview.do" class="write_review">글쓰기</a>
      </div>
   </div>

</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>