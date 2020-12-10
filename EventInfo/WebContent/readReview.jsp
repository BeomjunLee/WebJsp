<%@page import="java.util.List"%>
<%@page import="com.event.domain.Reply"%>
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
	//Review 객체 받기
	Review review = (Review)request.getAttribute("review");
	//Reply 받기
	List<Reply> replys = (List<Reply>)request.getAttribute("replys");

	//전 페이징 페이지 수
	int nowPage = Integer.parseInt(request.getParameter("page"));
	//세션 체크
	Long uid = 0L;
	if(session.getAttribute("session") != null){
		uid = Long.parseLong(session.getAttribute("session").toString());
	}
	String review_uid = request.getParameter("uid");
	
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

  			 <td style="width:100%; height:auto;" id="img_table"><img src="upload/<%=review.getImg()%>" onerror="this.style.display='none'" alt=" "></td>

  		</tr>
  		<tr>
  			<td class ="td2"colspan="2"><%=review.getContent() %></td>
  		</tr>
		<tr align="right">
  			<td class ="td3" >조회수: <%=review.getView_count() %>&nbsp;&nbsp;</td>
		</tr>
  		<%--<%
  			for(Object img:img){
  		--%>

  		<%-- <%
  			}
  		--%>
  		</tbody>
  	</table>

<div style="width:100%;height:35px;">
  	<input class = "button1" type="button" value="뒤로 가기" onclick="location.replace('review.do?page=<%=nowPage%>')">
<!-- 글의 회원uid값이랑 세션값이랑 같은지 확인 -->
<%if(uid == review.getMember_uid()) {%>
  	<input class = "button1" type="button" value="수정" onclick="location.href='updateReview.do?uid=<%=review_uid%>'">
  		<input class = "button1" type="button" value="삭제" onclick="deleteBtn()">
</div>
<%} %>
	<%for(Reply reply : replys){%>	
	<div style ="display:flex; width:100%;height:auto; color:#727272;" >
		<span style="display:block; width:10%;">[<%=reply.getWriter() %>]</span> 
		<span style="display:block; width:50%;"><%=reply.getContent()%></span>    
		<span style="display:block; font-size:0.9em;width:35%;">[<%=reply.getRegdate() %>]</span>

		<%if(uid == reply.getMember_uid()) {%>
		<a style="text-align:top; vertical-align:top; display:block; width:5%;height:5px; font-size:0.9em;" href="deleteReply.do?uid=<%=review_uid %>&page=<%=nowPage %>&reply_uid=<%=reply.getReply_uid()%>">삭제</a><br>
	</div>
		<%} %>
	<%} %>
	<%if(session.getAttribute("session") != null) {%>
	<form action="replyOk.do" method="post">
	<textarea rows="5" cols="150" placeholder="댓글을 남겨주세요" name="content"></textarea>
	<input type="hidden" name="review_uid" value="<%=review_uid %>">
	<input type="hidden" name="page" value="<%=nowPage%>">
	<input type="submit" class="button1" value="작성">
	</form>
	<%} %>
  </div>
</div>
</body>
<script>
	function deleteBtn(){
		 if(confirm("정말 삭제하시겠습니까??") == true){    //확인
			 location.href='deleteReview.do?uid=<%=review_uid%>&page=<%=nowPage%>';
			}else{   //취소
			    return;
		}
	}
</script>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>