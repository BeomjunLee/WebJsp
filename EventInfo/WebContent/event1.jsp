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
             <h3> ȣ�� �̺�Ʈ </h3><br>#����� #�̺�Ʈ #�߰�<br><br>  
             ����ģ���� ������� �¾� Ư���� ���� ������ �帮�� �����ôٸ� �߰��� �Ƹ��ٿ� ȣ�ڿ��� �ɰ� �Բ� ������ũ�� ���ִ°��� ���?
            <img src="front/img/event/man/man1_1.jpg" alt="" x><br>
              	  �߰�� �����Ⱑ ���� ȣ���� �����մϴ�.<br>
             	  �Ѱ� �ʿ� �߰��� ���� ȣ���� ������ �����ϼ���!<br>
		</div>
		<div class = "block1">
            <img src="front/img/event/man/man1_2.jpg" alt="" ><br>
          		   �̸� �غ��ص� �ɴٹ߰� ������ ��� �������� �ǳ��ݴϴ�<br>
		</div>
		<div class = "block1">
            <img src="front/img/event/man/man1_3.jpg" alt="" ><br>
                                 ���������� ����ģ���� ���� �丮�� ���ִ� ������ũ�� �����鼭 �ູ�� �ð��� �����ϴ� >_<
		</div>
        </div>      
        </div>
	
        <div id="event_2" style="display:none;">
        <div class="info">
        <div class="block1">
            <h3> å���� </h3><br>#����� #�̺�Ʈ #å����<br><br>  
            	����ģ������ ������ �ְ� �ʹٸ� ������ ���� �������� å���� ���� �ִ°� ����?
        </div>
		<div class="block1">
            <img src="front/img/event/man/man2_1.jpg" alt="" ><br>
                            ����ģ���� ���� ���������� �� ������ ����ϱ��� ���� ���徿 �ۼ��մϴ�.<br>
                            �ۼ��� ���������� ��Ƽ� å �������� ����� �ݴϴ�.<br>
		</div>
		<div class="block1">
            <img src="front/img/event/man/man2_2.jpg" alt="" ><br>
                            �̸� �غ��ص� �ɴٹ߰� ������ ��� �������� �ǳ��ݴϴ�
        </div>
        </div>
        </div>
        
        <div id="event_3" style="display: none;">
        <div class="info">
        <div class="block1">
          <h3> ������� </h3><br>#����� #�̺�Ʈ #�������<br><br>  
         	 ����ģ���� Ư���� �ð��� ������ ������ ������ ���� ��������� ����?
		</div>
		<div class ="block1">
          <img src="front/img/event/man/man3_1.jpg" alt="" ><br>
              	Ư���� ���� ������ ���� ��������� �����մϴ�.<br>
		</div>
		<div>
          <img src="front/img/event/man/man3_2.jpg" alt="" ><br>
            	����ģ���� ���ִ� ������ �Բ� �����鼭 <br>
            	���� ģ���� ��ҿ� ���� �;� �ߴ� ������ �ݴϴ�.
        </div>
        </div>
        </div>
       </div>
       <div class = "sub_wrap1"></div>
       </div>
       
  </body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
