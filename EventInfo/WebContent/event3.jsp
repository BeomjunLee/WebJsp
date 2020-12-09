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
             <h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">결혼 기념일</span></h3>
            <img src="front/img/event/parent/parent1_1.JPG" alt="" x><br>
          	 <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#기념일 #이벤트 #결혼기념일<br></span>
          	 부모님 결혼 기념일을 맞아 이벤트를 준비하고 싶으시다면<br>
   			 예쁜 꽃과 부모님이 좋아하시는 음식을 사드리면 어떨까요?<br>
                      인터넷에 부모님 꽃이라고만 치면 부모님께 드릴 꽃을 전문적으로 판매하는 업체들이 많이 나옵니다.<br>
                      부모님이 좋아 하실만한 것을 골라 주문을 해요!<br>  
		</div>
		<div class = "block1">
			<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#둘</span></h3>
            <img src="front/img/event/parent/parent1_2.JPG" alt="" ><br>
            <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#부모님 #사랑해요<br></span>
          		   주문한 꽃을 드리고 부모님이 좋아하시는 음식을 사드립니다!<br>
		</div>
        </div>      
        </div>
	
        <div id="event_2" style="display:none;">
        <div class="info">
        <div class="block1">
            <h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">가족사진</span></h3>
            <img src="front/img/event/parent/parent2_1.JPG" alt="" >
            <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#기념일 #이벤트 #가족사진<br></span>
				시간이 점점 흘러가면서 저희들은 성장하여 성인이 되었지만 부모님은 점점 늙어가시는게 보입니다...<br>
     			 내 앞으로의 인생에 가장 젊은날은바로 지금이란 말이 있듯이 가족사진으로 부모님의 삶 중에서 제일 아름다운 시절을 담아드려요!
		</div>
		<div class="block1">
			<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#둘</span></h3>
            <img src="front/img/event/parent/parent2_2.JPG" alt="" ><br>
            <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#화목함#행복<br></span>
                                            인터넷에 가족사진이라고 치면 전문적인 스튜디오가 많이 나옵니다.<br>
                		많은 후기들이 있으니 서로 비교해보고 마음에 드는 곳이 있으면 바로 찾아 가시면 됩니다!<br>
        </div>
        </div>
        </div>
        
        <div id="event_3" style="display: none;">
        <div class="info">
        <div class="block1">
          <h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">효도관광</span></h3>	
          <img src="front/img/event/parent/parent3_1.JPG" alt="" ><br>
          <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#기념일 #이벤트 #효도관광<br></span> 
         	 평소에 바쁘셔서 여행을 못가는 부모님들을 위해서 제주도 효도관광을 준비해드려요!<br>
         	 숙소 검색을 하면 좋은 호텔들이 많이 나와 있어요<br>
                      부모님이 좋아 하실 숙소로 잡아주세요!<br>
		</div>
		<div class="block1">
		<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#둘</span></h3>
          <img style="width:100%; object-fit:cover;"src="front/img/event/parent/parent3_2.JPG" alt="" ><br>
          <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#한식 #푸짐<br></span> 
            	여행에 빠질 수 없는 것은 맛있는 음식이겠죠!<br>
        </div>
		<div class="block1">
		<h3 style=""font-size:1.2em;" align="left">&nbsp;&nbsp;<span style ="border-bottom:3px solid #ff7276;">#셋</span></h3>
          <img style="width:100%; object-fit:cover;"src="front/img/event/parent/parent3_3.JPG" alt="" ><br>
          <span style="text-align:left; font-weight:bold;" align="left">&nbsp;&nbsp;#한라산#상쾌<br></span> 
         	   겨울에 꼭 봐야 한다는 한라산 1100고지!<br>
         	   아름다운 풍경을 부모님한테 보여주세요.
        </div>        
        </div>
        </div>
       </div>
       <div class = "sub_wrap1"></div>
       </div>
       
  </body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
