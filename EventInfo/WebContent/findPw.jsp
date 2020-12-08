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
          <li><label class ="color" for="name">아이디</label><input class="sign_box"type="text" name="id"></li>
          <li><label class ="color" for="name">핸드폰 번호</label><input class="sign_box" type="text" name="phoneNum"></li>
        </ul>

        <div class="login_btn">
          <button type="submit">이메일 전송</button>
        </div>
	
      </form>
	
    </section>
	
 </body>
 <jsp:include page="fragment/footer.jsp" flush="false"/>
</html>
