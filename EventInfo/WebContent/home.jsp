<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;600&display=swap" rel="stylesheet">

<style>
	html, body{
		margin:0;
		padding:0;
		height: 100%;
	}
	header{
		width:60%;
		height: 61;
		float:left;
		margin-top:10px;
		margin-bottom: 10px;
		
	}
	header>a{
		text-decoration: none;
		margin-left: 20px;
		
	}
	header>a>span{
		font-family: 'Nanum Pen Script', cursive;
		font-size: 2.5em;
		color: lightpink;
		
	}
	
	nav{
		width:40%;
		height:10 %;
		float: left;
		margin-bottom: 10px;
	}
	
	nav>.nav_1>.nav_login>span{
		font-family: 'Nanum Pen Script', cursive;
	}
	nav>.nav_1>.nav_login{
		text-decoration: none;
		float: right;
		margin: 20px;
	}
	
	section{
		width:100%;
		height:50%;
		float: left;
	
	}
	section>.section_h2{
		position: absolute;
		text-align: center-bottom;

	}
	section>.section_h2>p{
		text-align: center;
		
	}
	
	video{
		margin:0;
		padding:0;
		width: 100%;
		
	}
	
</style>
</head>
<body>
	<header>
		<!--img src="D:\잡것들/꽃.png" width="100" height="70"-->
		<a href="/"><span>꽃을 주다</span></a>
		<!--img src="D:\잡것들/꽃.png" width="100" height="70"-->
	</header>
	<nav>
		<div class="nav_1">
			<a href="/" class="nav_login"><span>회원가입</span></a>
			<a href="/" class="nav_login"><span>로그인</span></a>
		</div>
	</nav>
	<section>
		<h2 class ="section_h2">
		<p>그 날은

		특별하고 의미있게</p>
		</h2>
		<video muted autoplay ">
			<source src="영상.mp4" type="video/mp4">
		</video>
	</section>
	<aside></aside>
	<footer></footer>
</body>
</html>
    