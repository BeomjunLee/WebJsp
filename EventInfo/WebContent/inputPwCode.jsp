<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/login.css">
<jsp:include page="fragment/header.jsp" flush="false"/>

    <section class="로그인">
      <form class="login_all" action="sendEmailOk.do" method="post">
        <ul>
          <p class = "sign_title">비밀번호 찾기</p>
          <li><label class ="color" for="name">인증번호 입력</label><input class="sign_box"type="text" name="id"></li>
        </ul>

        <div class="login_btn">
          <button type="submit">확인</button>
        </div>
	
      </form>
	
    </section>
	
 </body>
 <jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
