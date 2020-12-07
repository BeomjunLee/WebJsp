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
	List<Event> events = new ArrayList<>();
	events = (List<Event>)request.getAttribute("events");
	Pagination pagination = (Pagination)request.getAttribute("pagination");
%>
      <section class ="content">

        <ul class="first_icon">
        <%if(pagination.getTotalListCnt() != 0){
           	if(pagination.getPage() != 1){%>
                <a href="event1.do?page=<%=pagination.getPreBlock()%>">이전으로</a>
       		<%}
        }
        for(Event event : events) {%>
          <li><i class="fas fa-gift">&nbsp;<input class="button" id="event1" type="button" value="<%=event.getTitle() %>" 
          		onclick="location.href='readEvent1.do?uid=<%=event.getEvent_uid()%>&&page=<%=pagination.getPage()%>'"></i></li>
        <%} 
        	if(pagination.getTotalListCnt() != 0){
         	  if(pagination.getPage() != pagination.getTotalPageCnt()){%>
                <a href="event1.do?page=<%=pagination.getNextBlock()%>">다음으로</a>
            <%}
      	}%>    

        </ul>
      </section>

      <hr>
          <video src="front/video/winter.mp4" autoplay loop muted >video</video>
      <div class = "wrap">
</div> 
  </body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
