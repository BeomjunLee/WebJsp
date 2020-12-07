<%@page import="com.event.domain.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.domain.Pagination"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="front/css/event.css">
<jsp:include page="fragment/header.jsp" flush="false"/>    

          <!--     ""if(document.querySelector('#event1').value === 'event1'){
                  document.querySelector('#event_1').style.display='block';
                  document.querySelector('#event_2').style.display='none';
                  document.querySelector('#event_3').style.display='none';}" -->
<%
	Event findEvent = (Event)request.getAttribute("event");
%>
      <section class ="content">

        <ul class="first_icon">
     	<input type="button" value="이전으로" onclick="history.back()">
     	<input type="button" value="추천하기" onclick="">
        </ul>
      </section>

      <hr>
      <div class ="test">
          <video src="front/video/winter.mp4" autoplay loop muted >video</video>
      <div class = "wrap">

        <div id="event_1" style="display:block;">
          <div class="info">
            <img src="" style="width:250px;height:250px" alt="이미지"><br>
            <%=findEvent.getContent() %>
          </div>
			조회수 : <%=findEvent.getView_count() %>
			추천수 : <%=findEvent.getRecommend() %>
			등록일 : <%=findEvent.getRegdate() %>
        </div>
      </div>
</div> 
  </body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
