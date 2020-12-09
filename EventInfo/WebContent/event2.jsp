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
      <div class = "sub_wrap1"></div>
      <div class = "sub_wrap">
        <div id="event_1" style="display:block;">
        <div class="info">
        <div class="block1">
             <h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">아이폰 편지</span></h3>
            <img src="front/img/event/women/women1_1.JPG" alt="" x><br>
          	 <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#기념일 #이벤트 #아이폰 편지<br></span>          	   
          		 남자친구를 위해 아이폰 편지를 만들어 보는것은 어떨까요?<br>
          		 SNS나 웹사이트의 이미지를 출력을 합니다.<br>
           
             	  
		</div>
		<div class = "block1">
			<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#둘</span></h3>
            <img src="front/img/event/women/women1_2.JPG" alt="" ><br>
            <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#오려오려 #코팅<br></span>
          		  출력한 이미지를 코팅을 한후 예쁘게 오려 줍니다.<br>
		</div>
		<div class = "block1">
			<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#셋</span></h3>
            <img src="front/img/event/women/women1_3.png" alt="" ><br>
            <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#뿌듯 #완성<br></span>
                                오려준 것을 정렬 후에 예쁘게 이어 주고 난뒤에 남자친구에게 선물해줍니다.
		</div>
        </div>      
        </div>
	
        <div id="event_2" style="display:none;">
        <div class="info">
        <div class="block1">
            <h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">깜짝 도시</span></h3>
            <img src="front/img/event/women/women2_1.PNG" alt="" >
            <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#기념일 #이벤트 #도시락<br></span>
            	스트레를 받아 힘든 남자친구를 위해 할 수 있는 일이 무엇이 있을까요?
      			사랑을 담은 도시락은 어떠세요!
      			지친 남자친구가 집에서 돌아오면 정성스럽게 준비한 도시락을 보여줍니다.
		</div>
		<div class="block1">
			<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#둘</span></h3>
            <img src="front/img/event/women/women2_2.JPG" alt="" ><br>
            <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#사랑 #만남 <br></span>
                            미리 준비해둔 꽃다발과 진심이 담긴 손편지를 건네줍니다
        </div>
        </div>
        </div>
        
        <div id="event_3" style="display: none;">
        <div class="info">
        <div class="block1">
          <h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">선물</span></h3>	
          <img src="front/img/event/women/women3_1.JPG" alt="" ><br>
          <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#기념일 #이벤트 #선물<br></span> 
         	내 남자친구에게는 어떤 선물이 어울릴까요?
         	남자들은 패션 아이템이 다양하지 않기 때문에, 포인트를 줄 수 있는 시계 어떤가요? 
		</div>
		<div class="block1">
		<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#둘</span></h3>
          <img style="width:100%; object-fit:cover;"src="front/img/event/women/women3_2.JPG" alt="" ><br>
          <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#향수<br></span> 
            	내 남자친구에서 좋은 향기가 나길 원한다면 향수를 추천해요!<br>
        </div>
        <div class="block1">
		<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#셋</span></h3>
          <img style="width:100%; object-fit:cover;"src="front/img/event/women/women3_3.JPG" alt="" ><br>
          <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#커플티 <br></span> 
            	평소에 옷을 입기 귀찮아 하는 남자친구를 위해서
             	 커플티도 추천해요!
        </div>
        </div>
        </div>
       </div>
       <div class = "sub_wrap1"></div>
       </div>
       
  </body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
