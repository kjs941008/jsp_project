<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<script>
function passwardCheck(){
	var pw1 = $('#upasswd').val();
	var pw2 = $('#upasswd_check').val();
	if(pw1 != pw2){
		$('#pwMessage').html('비밀번호가 일치 하지 않습니다.');
	}
	else{
		$('#pwMessage').html('');
	}
}
function id_check(){
	window.open("Member/CheckId.jsp", "중복 확인", "width=300, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
}

</script>
<form action="./Member/SignUpAction.jsp" method="get"id="sign">
	<div class="form-group">
		<label for="userid">아이디</label> <input type="text" name="userid"
			id="userid" class="form-control" placeholder ="중복 확인 해주세요" disabled />
			<button type='button' onclick='id_check()'>중복검사</button>
	</div>
	<div class="form-group">
		<label for="upasswd">비밀번호</label> <input type="password"
			name="upasswd" id="upasswd" onkeyup = "passwardCheck();" class="form-control" placeholder ="비밀번호를 입력해 주세요" />
	</div>
		<div class="form-group">
		<label for="upasswd_check">비밀번호 확인</label> 
		<input type="password" name="upasswd_check" onkeyup = "passwardCheck();" id="upasswd_check" class="form-control" placeholder ="비밀번호를 입력해 주세요" />
	</div>
	<font style = "color : red"id="pwMessage" size="2"></font>
	<div>
		남<input name="regState" type="radio" value="남">
		여<input name="regState" type="radio" value="여">
	</div>
	<div class="form-group">
		<label for="uname">이름</label> <input type="text" name="uname"
			id="uname" class="form-control" placeholder ="이름을 입력해 주세요" />
	</div>
	<input type="submit" value="회원가입" class="btn btn-primary" />
</form>