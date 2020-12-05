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
        <a href="main.html" style="color:#CD1039; font-size:2em;">�ɴ�ȭ</a>
      </div>

      <ul class="login">
        <li><a href="#" style="color:black;">login</a></li>
        <li><a href="#" class="ham"><i class="fas fa-bars" href=""></i></a></li>
      </ul>
    </nav>


    <section class="menu">
      <ul class="menu_men">
        <li><a href="page1.html">�����̺�Ʈ</a></li>

      </ul>

      <ul class="menu_women">
        <li><a href="#">���� �̺�Ʈ</a></li>

      </ul>

      <ul class="menu_parents">
        <li><a href="#">�θ�� �̺�Ʈ</a></li>

      </ul>

      <ul class="menu_������">
        <li><a href="review.html">�� ����</a></li>
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
            111 �����ִ� ���� �ѱ��� 5000�� ���� ���� �츮�� �Բ� �ؿ� ��ȭ�Դϴ�. �ѱ����� ���ݵ� ���� �����ϴ� �������� �˷�������, �����ô� ���ε� ���� ���� ��� ���̴ٰ� ��ϵǾ� �ֽ��ϴ�. �����ô� ������ �Ĵ絵 ����������̶� �Ͽ� ���ְ����� ���� �����̾���, ���������� ������ 60% �̻��� ��ġ ��׵� �������� �����ָ� ���� ���̴ٰ� �մϴ�. �̷��� ��ȭ�� ���������⿡ �� �����ֿ� ������ �ٱ� �����ϸ鼭 ������� �����ߴµ���. �׷� ����ȭ�� �Բ� ���������� ���� �츮���� ������� ���縦 �˾ƺ����?
          </div>
        </div>
        <div id="event_2" style="display:none;">
          <div class="info">
            <img  src="images/img02.jpg" style="width:250px;height:250px" alt=""><br>
            20�� ���������ü Ʈ���������� ������ 3�б� �Ｚ������ D�� ������ �� �б⺸�� 3.1% ������ 72��1õ400�� �޷��� ����ƴ�. SK���̴н��� 3�б� D�� ������ 49��2õ800�� �޷��� �� �б� ��� 4.4% �پ���.

Ʈ���������� "�̱� ����� ���� ȭ���̰� �ݵ�ü �����ſ� �����鼭 D�� ���Ϸ��� �þ�����, ��� �ǸŰ����� �϶��ϸ鼭 �������� ������� �����ߴ�"�� �м��ߴ�.
          </div>
        </div>
        <div id="event_3" style="display: none;">
          <div class="info">
            <img  src="images/img03.jpg" style="width:250px;height:250px" alt=""><br>
            �ݸ� �̱� ����ũ���� 25%�� �������� ���� �б�(21%)���� �����ߴ�. ����ũ���� ȸ��б�(5�� 29��~9�� 3��)�� �������� 3�б� ������ �����ϸ鼭 D�� ���� �϶����� �� �ݿ��� ������ Ǯ�̵ȴ�. �̿� ���� 4�б⿡�� �������� �ٽ� 20% �ʹݴ�� ������ ������ ����ȴ�.

3�б� D�� �������ͷ��� �Ｚ���ڰ� 41%�� ���� ���Ҵ�. SK���̴н��� 29%, ����ũ���� 25%�� ����ߴ�.

Ʈ���������� "������ D�� ���� ���� ������ D�� ��� ������ ��������, ���Ϸ��� ������ ��"�̶�� "4�б� ������� 3�б�� ����� ������ ����� ������ ����ȴ�"�� ���ߴ�.
          </div>
        </div>
      </div>
</div>
      <footer align="left">
        <pre>

          <span><i class="far fa-address-book"></i> 010-2910-4488</span>

          <span><i class="far fa-clock"></i> 10:00~18:00</span>

          <span><i class="fas fa-road"></i> ����� �ƻ�ķ�۽� ȣ�����б�</span>
        </pre>
      </footer>

  </body>
</html>
