<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/jung_signtest.css">
<jsp:include page="fragment/header.jsp" flush="false"/>
<body>
    <section class="회원가입">
      <form name="form" method="post">
        <ul>
          <li><label for="name">ID</label><input type="text" name="id" ><input type="button" placeholde="아이디는 영문 대소문자와 숫자로만 4~12자리로 입력해야합니다!" onclick="checkUserId()" value="중복체크"></li>
          <li><label for="name">PASSWARD</label><input type="password" name="pw1" onchange="checkPassword()"></li>
          <li><label for="name">PASSWARD 확인</label><input type="password" name="pw" onchange="checkPassword()"><span id="check">비밀번호 확인</span></li>
          <li><label for="name">NAME</label><input type="text" name="name" onchange="checkName()"></li>
          <li><label for="name">TEL</label><input type="text" id="tel_input" name="phoneNum" onchange="checkTel()"></li>
          <li><label for="name">AGE</label><input type="text" name="age"></li>
          <li><label for="name">SEX</label><input type="text" name="gender"></li>
        </ul>
          <input type="hidden" id="idCheck" value="">
        <div class="join">
          <button type="submit" >회원가입</button>
        </div>
      </form>
    </section>

</body>


<script>
function checkExistData(value, dataName) {//공백체크
    if (value == "") {
        alert(dataName + " 입력해주세요!");
        return false;
    }
    return true;
}
	
	
//*******************  아이디    **************************//
	function checkUserId() {
        //Id가 입력되었는지 확인하기
        var id = form.id.value;
        if (!checkExistData(id, "아이디를"))
            return false;
 
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            alert("아이디는 영문 대소문자와 숫자로만 4~12자리로 입력해야합니다!");
            form.id.value = "";
            form.id.focus();
            return false;
        }
        alert("사용가능한 아이디입니다.");
        return true; //확인이 완료되었을 때
    }
	
	
	
	
	//*******************  비밀번호    **************************//
	function checkPassword(){
		var pw1 = form.pw1.value;
		var pw2 = form.pw.value;
		var sc = ["!","@","#","$","%"];
		var check_sc = 0;
		
		if(pw1.length < 6 || pw1.length > 16){
			alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.");
			form.pw1.value="";
			form.pw1.focus();
			return false;
		}
		
		for(var i = 0; i < sc.length; i++){//특수문자 확인
			if(pw1.indexOf(sc[i]) != -1){
				check_sc = 1;
			}
		}
		
		if(check_sc == 0){
			alert("!,@,#,$,% 특수문자가 들어가 있지 않습니다.");
			form.pw1.value="";
		}//특수문자 들어갔는지 체크
		
		if(form.pw1.value !="" && form.pw.value != ""){//두가지 비밀번호가 일치하는지 체크.
			if(form.pw1.value == form.pw.value){
				document.getElementById('check').innerHTML = '비밀번호가 일치합니다.';
				document.getElementById('check').style.color='blue';
			
			} else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
		}//pw1,pw2 일치하는지 체크.
			
		}//비밀번호 체크 function end.
	
		
		
		//*******************  이름    **************************//
	function checkName(){
			var name = form.name.value;
			
			if(name.length < 1 || name.length > 8){
				alert("이름은 1글자 이상, 7글자 이하만 이용 가능합니다.");
				form.name.value="";
				form.name.focus();
				return false;
			}
		}
		
		
	function checkTel(){
		
		var tel = form.phoneNum.value;
		
		if(tel.length != 11 && tel.length == 11){
		
		return true;
		}
	}
		
	

</script>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>