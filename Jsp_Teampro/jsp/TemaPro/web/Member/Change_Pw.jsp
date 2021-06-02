<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function passwardCheck(){
	var pw1 = $('#upasswd').val();
	var pw2 = $('#upasswd_check').val();
	if(pw1 != pw2){
		$('#pwMessage').html('비밀번호가 일치 하지 않습니다.');
		$('#submit').prop('disabled',true);
	}
	else{
		$('#pwMessage').html('');
		$('#submit').prop('disabled',false);
	}
}
</script>
<title>비밀번호 변경</title>
</head>
<body>
	<form action="./Member/Change_PwAction.jsp" method="get">
		<div class="form-group" >
			<label for="nowpw">현재 비밀번호</label>
			<input class = "col-8" type="password" name="nowpw" id="nowpw" class="form-control" placeholder ="비밀번호를 입력해 주세요" />
		</div>
		<div class="form-group" >
			<label for="upasswd">변경할 비밀번호</label>
			<input class = "col-8" type="password" name="upasswd" id="upasswd" class="form-control" onkeyup = "passwardCheck();" placeholder ="비밀번호를 입력해 주세요" />
		</div>
		<div class="form-group">
			<label for="upasswd_check">비밀번호 확인</label> 
			<input class = "col-8" type="password" name="upasswd_check" onkeyup = "passwardCheck();" id="upasswd_check" class="form-control" placeholder ="비밀번호를 입력해 주세요" />
		</div>
		<input id="submit" type="submit" value="변경하기" class="btn btn-primary" disabled />
	</form>
</body>
</html>