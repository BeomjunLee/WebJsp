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
<%
	List<Event> events = new ArrayList<>();
	events = (List<Event>)request.getAttribute("events");
	Pagination pagination = (Pagination)request.getAttribute("pagination");
%>
      <section class ="content">

        <ul class="first_icon">
        <%if(pagination.getTotalListCnt() != 0){
           	if(pagination.getPage() != 1){%>
                <a href="event_1.do?page=<%=pagination.getPreBlock()%>">��������</a>
       		<%}
        }
        for(Event event : events) {%>
          <li><i class="fas fa-gift">&nbsp;<input class="button" id="event1" type="button" value="<%=event.getTitle() %>" onclick="
              if(document.querySelector('#event1').value === 'event1'){
                  document.querySelector('#event_1').style.display='block';
                  document.querySelector('#event_2').style.display='none';
                  document.querySelector('#event_3').style.display='none';
              }"></i></li>
        <%} 
        	if(pagination.getTotalListCnt() != 0){
         	  if(pagination.getPage() != pagination.getTotalPageCnt()){%>
                <a href="event_1.do?page=<%=pagination.getNextBlock()%>">��������</a>
            <%}
      	}%>    

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
  </body>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
