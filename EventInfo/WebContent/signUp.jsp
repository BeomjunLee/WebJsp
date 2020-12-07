<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/signUp.css">
<jsp:include page="fragment/header.jsp" flush="false"/>
<body>
    <section class="회원가입">
      <form class="sign_all" action="signUpOk.do" method="post">
        <ul>
          <p class = "sign_title">회원가입</p>
          <li><label class="color" for="name">아이디</label><div class="ID"><input class="sign_box" type="text" name="id" id="id"><input class ="check" type="button" onclick="return idDuplicated();" value="중복체크"></li></div>
          <li><label class="color" for="name">비밀번호</label><input class="sign_box" type="password" name="pw1"></li>
          <li><label class="color" for="name">비밀번호 확인</label><input class="sign_box" type="password" name="pw"></li>
          <li><label class="color" for="name">이름</label><input class="sign_box" type="text" name="name"></li>
          <li><label class="color" for="name">전화번호</label><input class="sign_box" type="text" name="phoneNum"></li>
          <li><label class="color" for="name">나이</label><input class="sign_box" type="text" name="age"></li>
          <li><label class="color" for="name">성별</label><input class="sign_box" style="margin-bottom:20px;" type="text" name="gender"></li>
        </ul>
        
          <input type="hidden" id="idCheck" value="">
        <div class="join">
          <button type="submit" >회원가입</button>
        </div>
      </form>
    </section>

</body>
<script src="front/js/signUp.js">

</script>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>