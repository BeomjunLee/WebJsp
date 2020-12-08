<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/main.css">
<title>눈담화</title>
<jsp:include page="fragment/header.jsp" flush="false"/>
  <article>
      <pre>더 이상 오지 않을
특별한 날에
<span style ="font-size:0.8em";>당신의 마음을 전하세요</span>
<input class ="main_button" type = button value="자세히보기"onclick=""/>
</pre>
      <video src="front/video/winter.mp4" autoplay loop muted >video</video>

  </article>
  <div class = "m_container">
	　
  </div>
  <div class = "m_container2">
  	<div class = "s_container1">
  	<span class = "m_title">눈담화란?</span><br>
  	눈 담화는 사랑하는 사람에게 선물을 준비할 수 있도록 도와주기 위해 만든 웹페이지입니다.<br>
  	</div>
  	<div class = "line">
  	</div>
  	<div class = "s_container2">
  		<img src="front/img/main_img01.png">
  	</div>
  </div>
  
    <div class = "m_container2">
  	<div class = "s_container2">
		<img src="front/img/main_img02_1.jpg">
  	</div>
  	<div class = "line">
  	</div>
  	<div class = "s_container1">
  	<span class = "m_title">이벤트</span><br>
  	<p>사랑하는 연인을 위해, 고마우신 부모님을 위한 이벤트들이 준비되어 있습니다.</p>
  	<div class ="s_container1_1">
  		<a href="event1.do" class ="main_button1">남자친구 이벤트</a>
  		<a href="event2.do" class ="main_button1">여자친구 이벤트</a>
  		<a href="event3.do" class ="main_button1">부모님 이벤트</a>
  	</div>
  	</div>
  </div>
  
    <div class = "m_container2">
  	<div class = "s_container1">
       <p class="m_p1">추운 겨울 이지만 <span style ="color:#ff7276;">사랑하는 사람</span>의 <span style ="color:#ff7276;">마음</span>은 따뜻하게 해주세요!</p>
  	</div>
  	<div class = "line">
  	</div>
  	<div class = "s_container2">
  		<img src="front/img/main_img03_1.jpg">
  	</div>
  </div>
  
</body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>