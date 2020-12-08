<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="front/css/signUp.css">
<jsp:include page="fragment/header.jsp" flush="false"/>
<body>
    <section class="회원가입">
      <form class="sign_all" name="form" action="signUpOk.do" method="post" onsubmit="return checkAll()">
        <ul>
          <p class = "sign_title">회원가입</p>
          <li><label class="color" for="name">아이디</label><div class="ID"><input class="sign_box" type="text" name="id" id="id"  onchange="checkUserId()"><input class ="check" type="button" onclick="return idDuplicated();" value="중복체크"></li></div>
          <li><label class="color" for="name">비밀번호</label><input class="sign_box" type="password" name="pw1" onchange="checkPassword()"></li>
          <li><label class="color" for="name">비밀번호 확인</label><input class="sign_box" type="password" name="pw" onchange="checkPassword()"><span id="check"></span></li>
          <li><label class="color" for="name">이름</label><input class="sign_box" type="text" name="name" onchange="checkName()"></li>
          <li><label class="color" for="name">이메일</label><input class="sign_box" type="text" name="email" onchange="checkMail()"></li>
          <li><label class="color" for="name">전화번호</label><input class="sign_box" type="text" name="phoneNum" id="tel_input" onchange="checkTel()" placeholder=" '-'없이 적어주세요."></li>
          <div class = "container">
             <div class = "sub_container">
                    <li><label class="color" for="name">나이</label><input class="sign_box" type="text" name="age" onchange="checkAge()"></li>
               </div>
               <div class = "sub_container"> 
                  <li class= "test"><label class="color" for="name">성별</label>
                  <label style="display:flex">
                     <input class ="check1" type="button"   onclick="checkSex_ALL()" name="gender" value="남자">
                     <input class ="check1" type="button"   onclick="checkSex_ALL()" name="gender" value="여자">
                  </label>
                     <!--  라디오 박스 방식
                     <input class="sign_box" style="margin-bottom:20px;" type="radio" name="gender" value="male">남성
                   <input class="sign_box" style="margin-bottom:20px;" type="radio" name="gender" value="female">여성
                   -->
                </li>
             </div>
          </div>
        </ul>
        
          <input type="hidden" id="idCheck" value="">
        <div class="join">
          <button type="submit">회원가입</button>
        </div>
      </form>
    </section>

</body>
<script>


/* 회원가입 눌렀을시 한번 더 체크 하는 구간.*/
 var count = 0; //성별 체킹 카운트.
 
function checkAll() {
   
        if (!checkUserId_ALL()) {
           alert("회원가입 실패 다시 작성해주세요.(아이디)");
            return false;
        } else if (!checkPassword_ALL()) {
           alert("회원가입 실패 다시 작성해주세요.(비번)");
            return false;
        } else if (!checkMail_ALL()) {
           alert("회원가입 실패 다시 작성해주세요.(메일)");
            return false;
        } else if (!checkName_ALL()) {
           alert("회원가입 실패 다시 작성해주세요.(이름)");
            return false;
        } else if (!checkTel_ALL()) {
           alert("회원가입 실패 다시 작성해주세요.(전화번호)");
            return false;
        } else if (!checkSex_ALL()) {
           alert("회원가입 실패 성별을 선택해주세요.(성별)");
           count = 0;
            return false;
        } else if (!checkAge_ALL()) {
           alert("회원가입 실패 다시 작성해주세요.(나이)");
            return false;
        }
        alert("회원가입 성공");
        count = 0;
        return true;
        
    }
    

function checkSex_ALL(){//성별 체크.
   
   count ++;
   
   if(count > 3){
      count = 2;
   }
    
   if(count < 2 ) {
      return false;
   }else
      return true;
}
    
    
function checkExistData_ALL(value) {// 공백체크
    if (value == "") {
        return false;
    }
    return true;
}



function idDuplicated_ALL(){
   
   //Id가 입력되었는지 확인하기
        var id = form.id.value;
        if (!checkExistData(id))
            return false;
 
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            form.id.value = "";
            form.id.focus();
            return false;
        }else{
           url = "idDuplicated.do?id=" + document.getElementById('id').value;
           window.open(url, "ID중복체크",
                 "width=200, height=120, toolbar=no, location=no status=no, menubar=no, scrollbars=no, resizable=no, left=1000, top=300");
        }
}

//*******************  아이디    **************************//
   function checkUserId_ALL() {
        //Id가 입력되었는지 확인하기
        var id = form.id.value;
        if (!checkExistData(id))
            return false;
 
        var idRegExp = /^[a-zA-z0-9]{4,20}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            
            form.id.value = "";
            form.id.focus();
            return false;
        }
        
        return true; //확인이 완료되었을 때
    }
   
   
   
   
   //*******************  비밀번호    **************************//
   function checkPassword_ALL(){
      var pw1 = form.pw1.value;
      var pw2 = form.pw.value;
      var sc = ["!","@","#","$","%"];
      var check_sc = 0;
      
   
      if(pw1.length < 6 || pw1.length > 20){
         
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
         
         form.pw1.value="";
      }//특수문자 들어갔는지 체크
      
      if(form.pw1.value !="" && form.pw.value != ""){//두가지 비밀번호가 일치하는지 체크.
         if(form.pw1.value == form.pw.value){
            return true;
         
         } else{
                return false;
            }
      }//pw1,pw2 일치하는지 체크.
         
      }//비밀번호 체크 function end.
   
      
      
      //*******************  이름    **************************//
   function checkName_ALL(){
         var name = form.name.value;
         
         var nameRegExp = /^[가-힣]{2,4}$/; 
         
         if(!nameRegExp.test(name)){

            form.name.value="";
            form.name.focus();
            return false;
         }else
            return true;
      }
      
   

      //****************  번호   *****************************//

   function checkTel_ALL(){
      
      var tel = form.phoneNum.value;

      if(/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/.test(tel)){//숫자외 나머지 들어오면 오류. 또한 올바르지 않는 번호입력.
         return true;
      }else{
         return false;
      }
         
   }
      
   //****************  나이   *****************************//
   function checkAge_ALL(){
      var age = form.age.value;
   
      if(age>7 && age <120){// 7~120세만 적을 수 있음.
         
         return true;
      }else{
         return false;
      }
   }

   
   //*********************  이메일   *********************//
   function checkMail_ALL() {
        //mail이 입력되었는지 확인하기
        
        var mail = form.email.value;
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        
        if (!emailRegExp.test(mail)) {

            return false;
        }
        return true; //확인이 완료되었을 때
    }

   
   
   
   
   

/* -end- 회원가입 눌렀을시 한번 더 체크 하는 구간. -end-*/






/* 기본적인 유효성 검사 구간*/


function checkExistData(value, dataName) {// 공백체크
    if (value == "") {
        alert(dataName + " 입력해주세요!");
        return false;
    }
    return true;
}

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



   
   
//*******************  아이디    **************************//
   function checkUserId() {
        //Id가 입력되었는지 확인하기
        var id = form.id.value;
        if (!checkExistData(id, "아이디를"))
            return false;
 
        var idRegExp = /^[a-zA-z0-9]{4,20}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            alert("아이디는 영문 대소문자와 숫자로만 4~20자리로 입력해야합니다!");
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
      
   
      if(pw1.length < 6 || pw1.length > 20){
         alert("비밀번호는 6글자 이상, 20글자 이하만 이용 가능합니다.");
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
         var nameRegExp = /^[가-힣]{2,4}$/;
         if(!checkExistData(name,"이름을"))
            return false;
         if(!nameRegExp.test(name)){
            alert("올바르지 않는 이름입니다.");
            form.name.value="";
            form.name.focus();
            return false;
         }else
            return true;
      }
      
   

      //****************  번호   *****************************//

   function checkTel(){
      
      var tel = form.phoneNum.value;
      if(!checkExistData(tel,"번호를"))
         return false;
      if(/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/.test(tel)){//숫자외 나머지 들어오면 오류. 또한 올바르지 않는 번호입력.
         return true;
      }else{
         alert('올바르지 않는 번호입니다.');
         return false;
      }
         
   }
      
   //****************  나이   *****************************//
   function checkAge(){
      var age = form.age.value;
      if(!checkExistData(age,"나이를"))
      if(age>7 && age <120){// 1~120세만 적을 수 있음.
         
      }else{
         alert('올바르지 않는 나이입니다.');
         
      }
   }

   
   //*********************  이메일   *********************//
   function checkMail() {
        //mail이 입력되었는지 확인하기
        
        var mail = form.email.value;
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        
        if(!checkExistData(mail,"이메일을"))
           return false;
        
     
        if (!emailRegExp.test(mail)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.email.value = "";
            form.email.focus();
        }
      
    }
   

</script>
<jsp:include page="fragment/footer.jsp" flush="false"/>
</html>