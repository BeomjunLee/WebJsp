<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/signUp.css">
<jsp:include page="fragment/header.jsp" flush="false"/>
<body>
    <section class="회원가입">
      <form class="" action="idDuplicated.do" method="post">
        <ul>
          <li><label for="name">ID</label><input type="text" name="id"><input type="submit" onclick="idDuplicated();" value="중복체크"></li>
          <li><label for="name">PASSWARD</label><input type="password" name="pw1"></li>
          <li><label for="name">PASSWARD 확인</label><input type="password" name="pw"></li>
          <li><label for="name">NAME</label><input type="text" name="name"></li>
          <li><label for="name">TEL</label><input type="text" name="phoneNum"></li>
          <li><label for="name">AGE</label><input type="text" name="age"></li>
          <li><label for="name">SEX</label><input type="text" name="gender"></li>
        </ul>
        <div class="join">
          <button type="submit" >회원가입</button>
        </div>
      </form>


    </section>


</body>
<script>
	function idDuplicated(){
		location.href="idDuplicated.do";
	}
</script>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>