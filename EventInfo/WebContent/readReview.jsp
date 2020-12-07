<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/readReview.css">
<title>눈담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>
  
 <style>
 	table{
 		width
 	}
 </style>
<div class="wrap" align="center">
  <div class="table_div" align="center">
  	<table >
  		<tr>
  			<th colspan="2" align="center" style="background-color: #eeeeee">게시판 글 보기</th>
  		</tr>
  		<tr>
  			
  			<td colspan="2">제목입니다.</td>
  		</tr>
  		<tr>
  			
  			<td colspan="2">작성자 이름</td>
  		</tr>
  		<tr>
  			
  			<td colspan="2">2020-12-06 00:24</td>
  		</tr>
  		
  		<tr>
  			<td align="center" colspan="2" style="background-color: #eeeeee">글내용</td>
  		</tr>
  		<tr>
  			<td colspan="2">리뷰에 대한 글들 네이버 애드포스트는 블로그에 게재할 수 있는 네이버 블로그 전용 광고입니다.

​

타사 CPC광고 대비 수익률은 현저히 떨어지지만, 네이버 블로그에는 자사 광고 외에 타사 배너광고는 등록할 수 없게끔 시스템을 만들어 놨기때문에

​

울며 겨자먹기로 모든 블로그들이 애드포스트를 다는 편입니다. 한번 등록해놓으면 따로 관리할게 없어서 편하긴 하네요.</td>
  		</tr>
  		<%--<%
  			for(Object img:img){
  		--%>
  		<tr>
  			<td id="img_table"><img src="front/img/하트향초.jpg"><img src="front/img/하트향초.jpg"></td>
  		</tr>
  		<%-- <%
  			}
  		--%>
  	</table>
  	<a href="#">목록</a>
  </div>
  	
  
</div>
</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>