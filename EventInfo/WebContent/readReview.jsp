<%@page import="com.event.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/readReview.css">
<title>눈담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>
<%
	Review review = (Review)request.getAttribute("review");
%> 
 <style>
 	table{
 		width
 	}
 </style>
<div class="wrap" align="center">
  <div class="table_div" align="center">
  	<table >
  		<tr>
  			<th colspan="2" align="center" style="background-color: #eeeeee">리뷰 글 보기</th>
  		</tr>
  		<tr>
  			<td colspan="2"><%=review.getTitle()%></td>
  		</tr>
  		<tr>
  			
  			<td colspan="2"><%=review.getWriter() %></td>
  		</tr>
  		<tr>
  			
  			<td colspan="2"><%=review.getRegdate() %></td>
  		</tr>
  		<tr>
  			<td align="center" colspan="1" style="background-color: #eeeeee">조회수</td>
  			<td align="center" colspan="1" style="background-color: #eeeeee">추천수</td>
  		</tr>
  		<tr>
  			<td colspan="1"><%=review.getView_count() %></td>
  			<td colspan="1"><%=review.getRecommend() %></td>
  		</tr>
  	
  		<tr>
  			<td align="center" colspan="2" style="background-color: #eeeeee">글내용</td>
  		</tr>
  		<tr>
  			<td colspan="2"><%=review.getContent() %></td>
  		</tr>
  		<%--<%
  			for(Object img:img){
  		--%>
  		<tr>
  			<td id="img_table"><img src="" alt="이미지"></td>
  		</tr>
  		<%-- <%
  			}
  		--%>
  	</table>
  	<input type="button" value="목록" onclick="history.back()">
  </div>
  	
  
</div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>