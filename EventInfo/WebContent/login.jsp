<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/login.css">
<jsp:include page="fragment/header.jsp" flush="false"/>

    <section class="로그인">
      <form class="login_all" action="loginOk.do" method="post">
        <ul>
          <p class = "sign_title">로그인하기</p>
          <li><label class ="color" for="name">아이디</label><input class="sign_box"type="text" name="id"></li>
          <li><label class ="color" for="name">비밀번호</label><input class="sign_box" type="password" name="pw"></li>
        </ul>

        <div class="login_btn">
          <button type="submit">로그인</button>
        </div>

        <div class="caption">
          <a class = "signup" href="signUp.do">회원가입</a>
        </div>
	
      </form>
	
    </section>
	
 </body>
 <jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
