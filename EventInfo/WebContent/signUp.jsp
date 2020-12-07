<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/signUp.css">
<jsp:include page="fragment/header.jsp" flush="false"/>
<body>
    <section class="회원가입">
      <form class="sign_all" name="form" action="signUpOk.do" method="post">
        <ul>
          <p class = "sign_title">회원가입</p>
          <li><label class="color" for="name">아이디</label><div class="ID"><input class="sign_box" type="text" name="id" id="id" ><input class ="check" type="button" onclick="return idDuplicated();" value="중복체크"></li></div>
          <li><label class="color" for="name">비밀번호</label><input class="sign_box" type="password" name="pw1" onchange="checkPassword()"></li>
          <li><label class="color" for="name">비밀번호 확인</label><input class="sign_box" type="password" name="pw" onchange="checkPassword()"><span id="check"></span></li>
          <li><label class="color" for="name">이름</label><input class="sign_box" type="text" name="name" onchange="checkName()"></li>
          <li><label class="color" for="name">전화번호</label><input class="sign_box" type="text" name="phoneNum" id="tel_input" onchange="checkTel()" placeholder=" '-'없이 적어주세요."></li>
          <li><label class="color" for="name">나이</label><input class="sign_box" type="text" name="age" onchange="checkAge()"></li>
          <li><label class="color" for="name">성별</label>
          <input class="sign_box" style="margin-bottom:20px;" type="radio" name="gender" value="male">남성
          <input class="sign_box" style="margin-bottom:20px;" type="radio" name="gender" value="female">여성</li>
        </ul>
        
          <input type="hidden" id="idCheck" value="">
        <div class="join">
          <button type="submit" onsubmit="checkAll()">회원가입</button>
        </div>
      </form>
    </section>

</body>
<script>

function checkAll() { // 회원가입 누르면 모든 유효성 체크.
    if (!checkUserId(form.userId.value)) {
        return false;
        
    } else if (!checkPassword(form.pw1.value, form.pw.value)) {
        return false;
        
    }  else if (!checkName(form.name.value)) {
        return false;
        
    } else if (!checkBirth(form.identi1.value, form.identi2.value)) {
        return false;
        
    } else if (!checkFavorite()) {
        return false;
        
    } else if (!checkIntro()) {
        return false;
        
    }
    return true;
}
}


출처: https://olsh1108o.tistory.com/entry/JS-회원가입-유효성-검사 [개발하는개발자]




//아이디 중복체크 버튼클릭시
function idDuplicated(){
	
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
        }else{
        	url = "idDuplicated.do?id=" + document.getElementById('id').value;
        	window.open(url, "ID중복체크",
        			"width=200, height=120, toolbar=no, location=no status=no, menubar=no, scrollbars=no, resizable=no, left=1000, top=300");
        }
}


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
			
			if(name.length < 2 || name.length > 8){
				alert("이름은 2글자 이상, 7글자 이하만 이용 가능합니다.");
				form.name.value="";
				form.name.focus();
				return false;
			}
		}
		
		//****************  번호   *****************************//
	function checkTel(){
		
		var tel = form.phoneNum.value;
		
		if(tel.length==11){
			return true;
		}else{
			alert('옳바르지 않는 번호입니다.');
			return false;
		}
			
	}
		
	//****************  나이   *****************************//
	function checkAge(){
		var age = form.age.value;
	
		if(age>0 && age <120){// 1~120세만 적을 수 있음.
			
			return true;
		}else{
			alert('옳바르지 않는 나이입니다.');
			return false;
		}
	}
	
	
	//*********************  성별   *********************//
	function checkSex(){
		var gender = form.gender.values;
		
		if(gender == NULL){
			alert('성별을 체크해 주세요.');
			return false;
		}else
			return true;
	}
</script>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>