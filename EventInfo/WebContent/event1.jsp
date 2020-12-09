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
	<div style="width:100%;height:100px;">
      <section class ="content">
        <ul class="first_icon">
          <li><i class="fas fa-gift">&nbsp;<input class="button" id="event1" type="button" value="event1" onclick="
              if(document.querySelector('#event1').value === 'event1'){
                  document.querySelector('#event_1').style.display='block';
                  document.querySelector('#event_2').style.display='none';
                  document.querySelector('#event_3').style.display='none';
              }
            "></i></li>
          <li><i class="fas fa-gift">&nbsp;<input class="button" id="event2" type="button" value="event2" onclick="
            if(document.querySelector('#event2').value === 'event2'){
                  document.querySelector('#event_2').style.display='block';
                document.querySelector('#event_1').style.display='none';
                document.querySelector('#event_3').style.display='none';
            }
            "></i></li>
          <li><i class="fas fa-gift">&nbsp;<input class="button" id="event3" type="button" value="event3" onclick="
            if(document.querySelector('#event3').value === 'event3'){
                document.querySelector('#event_3').style.display='block';
                document.querySelector('#event_1').style.display='none';
                document.querySelector('#event_2').style.display='none';
            }
            "></i></li>
        </ul>

      </section>
      </div>

		
      <div class = "wrap">
      <div class = "sub_wrap">
        <div id="event_1" style="display:block;">
        <div class="info">
        <div class="block1">
             <h3> 호텔 이벤트 </h3><br>#기념일 #이벤트 #야경<br><br>  
             여자친구와 기념일을 맞아 특별한 날을 선물해 드리고 싶으시다면 야경이 아름다운 호텔에서 꽃과 함께 스테이크를 해주는것은 어때요?
            <img src="front/img/event/man/man1_1.jpg" alt="" x><br>
              	  야경과 분위기가 좋은 호텔을 예약합니다.<br>
             	  한강 쪽에 야경이 좋은 호텔이 많으니 참고하세요!<br>
		</div>
		<div class = "block1">
            <img src="front/img/event/man/man1_2.jpg" alt="" ><br>
          		   미리 준비해둔 꽃다발과 진심이 담긴 손편지를 건네줍니다<br>
		</div>
		<div class = "block1">
            <img src="front/img/event/man/man1_3.jpg" alt="" ><br>
                                 마지막으로 여자친구와 직접 요리한 맛있는 스테이크를 먹으면서 행복한 시간을 보냅니다 >_<
		</div>
        </div>      
        </div>
	
        <div id="event_2" style="display:none;">
        <div class="info">
        <div class="block1">
            <h3> 책편지 </h3><br>#기념일 #이벤트 #책편지<br><br>  
            	여자친구에게 감동을 주고 싶다면 진심을 담은 손편지를 책으로 만들어서 주는건 어떨까요?
        </div>
		<div class="block1">
            <img src="front/img/event/man/man2_1.jpg" alt="" ><br>
                            여자친구를 위한 정성스러운 손 편지를 기념일까지 매일 한장씩 작성합니다.<br>
                            작성한 손편지들을 모아서 책 형식으로 만들어 줍니다.<br>
		</div>
		<div class="block1">
            <img src="front/img/event/man/man2_2.jpg" alt="" ><br>
                            미리 준비해둔 꽃다발과 진심이 담긴 손편지를 건네줍니다
        </div>
        </div>
        </div>
        
        <div id="event_3" style="display: none;">
        <div class="info">
        <div class="block1">
          <h3> 레스토랑 </h3><br>#기념일 #이벤트 #레스토랑<br><br>  
         	 여자친구와 특별한 시간을 보내고 싶으면 분위기 좋은 레스토랑은 어떨까요?
		</div>
		<div class ="block1">
          <img src="front/img/event/man/man3_1.jpg" alt="" ><br>
              	특별한 날에 분위기 좋은 레스토랑을 예약합니다.<br>
		</div>
		<div>
          <img src="front/img/event/man/man3_2.jpg" alt="" ><br>
            	여자친구와 맛있는 음식을 함께 먹으면서 <br>
            	여자 친구가 평소에 같고 싶어 했던 선물을 줍니다.
        </div>
        </div>
        </div>
       </div>
       </div>
       
  </body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
