<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
function idcheck(){
    var userid = $('#userid').val();
    
    if( userid == '' || userid == null ){
        alert( '값을 입력해주세요' );
        return false;
    }
    var blank_pattern = /^\s+|\s+$/g;
    if( userid.replace( blank_pattern, '' ) == "" ){
        alert(' 공백만 입력되었습니다 ');
        return false;
    }
    //공백 금지
    //var blank_pattern = /^\s+|\s+$/g;(/\s/g
    var blank_pattern = /[\s]/g;
    if( blank_pattern.test( userid) == true){
        alert(' 공백은 사용할 수 없습니다. ');
        return false;
    }

    var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
    if( special_pattern.test(userid) == true ){
        alert('특수문자는 사용할 수 없습니다.');
        return false;
    }
    $.ajax({
        type:'post',
        url:'./idcheck ',
        dataType:'text',
        data:{userid : userid},
        success: function(reuslt) {
            if(reuslt == 0) {
               // $('#message').text('사용할 수 있는 ID입니다.')
               alert('사용 가능한 ID 입니다')
            } else {
               // $('#message').text('이미 사용 중인 아이디입니다.')
               alert('이미 사용중인 ID 입니다.')
            }
        }
    })    //ajax
    
}

</script>
<form class="col-5 container" action="./Member/SignUpAction.jsp" method="get"id="sign">

	<div class="form-group">
		<label for="userid">아이디</label>
		<input  class = "col-8" type="text" name="userid" id="userid" class="form-control" placeholder ="중복 확인 해주세요"/>
		<button type='button' onclick='idcheck()'>중복검사</button>
	</div>
	
	<div class="form-group" >
	<label for="upasswd">비밀번호</label> <input class = "col-8" type="password"
			name="upasswd" id="upasswd" class="form-control" placeholder ="비밀번호를 입력해 주세요" />
	</div>
		<div class="form-group">
		<label for="upasswd_check">비밀번호 확인</label> 
		<input class = "col-8" type="password" name="upasswd_check" onkeyup = "passwardCheck();" id="upasswd_check" class="form-control" placeholder ="비밀번호를 입력해 주세요" />
	</div>
	<font style = "color : red"id="pwMessage" size="2"></font>
	
	<div class="form-group">
		<label for="uname">이름</label> <input class = "col-8" type="text" name="uname"
			id="uname" class="form-control" placeholder ="이름을 입력해 주세요" />
	</div>
	
	<div class="form-group">
		<label for="uaddr">주소</label> <input class = "col-8" type="text" name="uaddr" id="uaddr" class="form-control" placeholder ="주소를 입력해 주세요" />
	</div>
	
	<div class="form-group">
		<label for="umail">이메일</label> <input class = "col-8" type="text" name="umail"
			id="umail" class="form-control" placeholder ="이메일을 입력해 주세요" />
	</div>
	
	<input type="submit" value="회원가입" class="btn btn-primary" />
</form>