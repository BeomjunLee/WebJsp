<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" >
    <title>눈담화</title>
    <link rel="stylesheet" href="front/css/header.css?ver1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href = "https://fonts.googleapis.com/css2? family = Sunflower : wght @ 300 & display = swap" rel = "stylesheet">
<!--바로  font-style -->
    <script src="https://kit.fontawesome.com/eeec69e2c8.js" crossorigin="anonymous">
    </script>
    <script src ="front/js/main.js" defer></script>
  <!--body start-->
  <body style="margin:0px;">

    <nav class = "title">
      <div class="navbar">
        <a href="main.do" class = "main_title">
        <span class="m1">눈</span>
        <span class="m2">담</span>
        <span class="m3">화</span></a>
      </div>

<%
	//세션 체크
	String uid = "";
	if(session.getAttribute("session")!= null){
		uid = session.getAttribute("session").toString();
	}else{
		uid = (String)session.getAttribute("session");
	}
%>
      	<ul class="login">
<%if(uid != null){ %>
        <li><a href="myPage.do" style="color:black;">마이페이지</a></li>
        <li><a href="logout.do" style="color:black;">로그아웃</a></li>
<%}else{%>
        <li><a class ="log" href="login.do" style="color:black;">로그인</a></li>
<%}%>
        <li><a href="#" class="ham"><i class="fas fa-bars" style="color:black"></i></a></li>
      </ul>
    </nav>
    
    
	
    <section class="menu">
      <ul class="menu_men">
        <li><a href="event1.do">남자친구를 위한 EVENT</a></li>
        <!-- <li><a href="#">메뉴1</a></li>
        <li><a href="#">메뉴2</a></li>
        <li><a href="#">메뉴3</a></li> -->
      </ul>

      <ul class="menu_women">
        <li><a href="event2.do">여자친구를 위한 EVENT</a></li>
        <!-- <li><a href="#">메뉴1</a></li>
        <li><a href="#">메뉴2</a></li>
        <li><a href="#">메뉴3</a></li> -->
      </ul>

      <ul class="menu_parents">
        <li><a href="event3.do">부모님을 위한 EVENT</a></li>
        <!-- <li><a href="#">메뉴1</a></li>
        <li><a href="#">메뉴2</a></li>
        <li><a href="#">메뉴3</a></li> -->
      </ul>

      <ul class="menu_review">
        <li><a href="review.do">리뷰 보기</a></li>
        <!-- <li><a href="#">메뉴1</a></li> -->
      </ul>
    </section>
</head>
