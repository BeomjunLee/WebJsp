<%@page import="com.event.domain.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/readReview.css">
<title>눈담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>

<body>

<%
	Review review = (Review)request.getAttribute("review");
%> 

<div class="wrap" align="center">
  <div class="table_div" align="center">
    
  	<table style ="width:100%; border:none;">
  		<tbody>
  		<tr class ="review_title">
  			<td class ="td1" colspan="2">
  				<span class ="title1"><%=review.getTitle()%></span>
  				<span class ="title2"><%=review.getWriter() %><div style="border-left: thick solid grey;"></div><%=review.getRegdate() %></span>
  			</td>
  		</tr>
  		<tr align ="center">
  			 <td style="width:100%;" id="img_table"><img src="" onerror="this.style.display='none'" alt=" "></td>
  		</tr>
  		<tr>
  			<td class ="td2"colspan="2"><%=review.getContent() %></td>
  		</tr>
		<tr align="right">
  			<td class ="td3" >조회수: <%=review.getView_count() %>&nbsp;&nbsp;추천: <%=review.getRecommend() %></td>
		</tr>
  		<%--<%
  			for(Object img:img){
  		--%>

  		<%-- <%
  			}
  		--%>
  		</tbody>
  	</table>
  	<input class = "button1" type="button" value="뒤로 가기" onclick="history.back()">
  </div>
  	
  
</div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>