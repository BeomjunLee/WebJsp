<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/login.css">
<jsp:include page="fragment/header.jsp" flush="false"/>

    <section class="로그인">
      <form class="" action="loginOk.do" method="post">
        <ul>
          <li><label for="name">ID</label><input type="text" name="id"></li>
          <li><label for="name">PASSWARD</label><input type="password" name="pw"></li>
        </ul>

        <div class="login_btn">
          <button type="submit">LOGIN</button>
        </div>

        <div class="caption">
          <a href="signUp.do">회원가입</a>
        </div>
	
      </form>
	
    </section>
	
 </body>
 <jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
