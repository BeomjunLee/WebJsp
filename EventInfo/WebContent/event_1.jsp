<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="front/css/event.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/eeec69e2c8.js" crossorigin="anonymous">
    </script>
    <script defer src="js/main.js">

    </script>
  </head>
  <body>

    <nav class="title">
      <div class="navbar">
        <a href="main.html" style="color:#CD1039; font-size:2em;">꽃담화</a>
      </div>

      <ul class="login">
        <li><a href="#" style="color:black;">login</a></li>
        <li><a href="#" class="ham"><i class="fas fa-bars" href=""></i></a></li>
      </ul>
    </nav>


    <section class="menu">
      <ul class="menu_men">
        <li><a href="page1.html">남자이벤트</a></li>

      </ul>

      <ul class="menu_women">
        <li><a href="#">여자 이벤트</a></li>

      </ul>

      <ul class="menu_parents">
        <li><a href="#">부모님 이벤트</a></li>

      </ul>

      <ul class="menu_고객센터">
        <li><a href="review.html">고객 센터</a></li>
      </ul>
    </section>

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

      <hr>
      <div class ="test">
          <video src="front/video/winter.mp4" autoplay loop muted >video</video>
      <div class = "wrap">

        <div id="event_1" style="display:block;">
          <div class="info">
            <img src="images/img01.jpg" style="width:250px;height:250px" alt=""><br>
            111 전통주는 본래 한국의 5000년 역사 내내 우리와 함께 해온 문화입니다. 한국인은 지금도 술을 좋아하는 민족으로 알려졌지만, 조선시대 서민들 또한 술을 즐겨 마셨다고 기록되어 있습니다. 조선시대 최초의 식당도 ‘명월관’이라 하여 음주가무를 즐기는 술집이었고, 가정에서도 국민의 60% 이상이 김치 담그듯 집집마다 가양주를 빚어 마셨다고 합니다. 이러한 문화는 일제강점기에 들어서 가양주에 세금이 붙기 시작하면서 사라지기 시작했는데요. 그럼 술담화와 함께 일제강점기 이후 우리나라 전통술의 역사를 알아볼까요?
          </div>
        </div>
        <div id="event_2" style="display:none;">
          <div class="info">
            <img  src="images/img02.jpg" style="width:250px;height:250px" alt=""><br>
            20일 시장조사업체 트렌드포스에 따르면 3분기 삼성전자의 D램 매출은 전 분기보다 3.1% 감소한 72억1천400만 달러로 집계됐다. SK하이닉스의 3분기 D램 매출은 49억2천800만 달러로 전 분기 대비 4.4% 줄었다.

트렌드포스는 "미국 제재로 인해 화웨이가 반도체 선구매에 나서면서 D램 출하량은 늘었지만, 평균 판매가격이 하락하면서 전반적인 매출액은 감소했다"고 분석했다.
          </div>
        </div>
        <div id="event_3" style="display: none;">
          <div class="info">
            <img  src="images/img03.jpg" style="width:250px;height:250px" alt=""><br>
            반면 미국 마이크론은 25%의 점유율로 지난 분기(21%)보다 증가했다. 마이크론은 회계분기(5월 29일~9월 3일)를 기준으로 3분기 매출을 집계하면서 D램 가격 하락세가 덜 반영된 것으로 풀이된다. 이에 따라 4분기에는 점유율이 다시 20% 초반대로 떨어질 것으로 예상된다.

3분기 D램 영업이익률은 삼성전자가 41%로 가장 높았다. SK하이닉스는 29%, 마이크론은 25%를 기록했다.

트렌드포스는 "서버용 D램 수요 부진 등으로 D램 평균 가격이 내려가고, 출하량은 증가할 것"이라며 "4분기 매출액은 3분기와 비슷한 수준을 기록할 것으로 예상된다"고 말했다.
          </div>
        </div>
      </div>
</div>
      <footer align="left">
        <pre>

          <span><i class="far fa-address-book"></i> 010-2910-4488</span>

          <span><i class="far fa-clock"></i> 10:00~18:00</span>

          <span><i class="fas fa-road"></i> 배방읍 아산캠퍼스 호서대학교</span>
        </pre>
      </footer>

  </body>
</html>
