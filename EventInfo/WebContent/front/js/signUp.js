//아이디 중복체크 버튼클릭시
function idDuplicated(){
	url = "idDuplicated.do?id=" + document.getElementById('id').value;
	window.open(url, "ID중복체크",
			"width=200, height=120, toolbar=no, location=no status=no, menubar=no, scrollbars=no, resizable=no, left=1000, top=300");
}


