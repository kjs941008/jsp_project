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
    var blank_pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
    if( blank_pattern.test( userid) == true){
        alert(' 한글은 사용할 수 없습니다. ');
        return false;
    }
    
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
<style>
	.main{
		width : 100%;
	}
	.left{
		width:30%;
		float:left;
		text-align:right;
	}
	.right{
		width:70%;
		float:right;
		text-align:left;
	}
	.last{
		text-align:center;
		width:100%;	
 	    clear: both;
	}
</style>
<form class="col-5 container" action="./Member/SignUpAction.jsp" method="get" id="sign">
	<div class="main mt-5 mb-4">
		<h2>회원가입</h2>
	</div>
	<div class="left pe-3">
		<label class="mb-sm-2" for="userid" style="height:30px; vertical-align:middle;">아이디</label><br>
		<label class="mb-sm-2" for="upasswd" style="height:30px; vertical-align:middle;">비밀번호</label><br>
		<label class="mb-sm-2" for="upasswd_check" style="height:30px; vertical-align:middle;">비밀번호 확인</label><br>
		<label class="mb-sm-2" for="uname" style="height:30px; vertical-align:middle;">이름</label><br>
		<label class="mb-sm-2" for="uaddr" style="height:30px; vertical-align:middle;">주소</label><br>
		<label class="mb-sm-2" for="umail" style="height:30px; vertical-align:middle;">이메일</label><br>
	</div>
	<div class="right">	 
		<input class="col-8 mb-sm-2" type="text" name="userid" id="userid" class="form-control" placeholder="중복 확인 필수" />
		<button type='button' class="btn btn-outline-info btn-sm" onclick='idcheck()'>중복검사</button>
		<input class="col-8 mb-sm-2" type="password" name="upasswd" id="upasswd" onkeyup="passwardCheck();" class="form-control"/>
		<input class="col-8 mb-sm-2" type="password" name="upasswd_check" onkeyup="passwardCheck();" id="upasswd_check" class="form-control" placeholder="위와 동일한 비밀번호 입력" />
		<font style="color: red" id="pwMessage" size="1.5" class="mb-sm-2"></font>
		<input class="col-8 mb-sm-2" type="text" name="uname" id="uname" class="form-control"/>
		<input class="col-8 mb-sm-2" type="text" name="uaddr" id="uaddr" class="form-control"/>
		<input class="col-8 mb-sm-2" type="text" name="umail" id="umail" class="form-control" placeholder="OOOO@OOOOOO" />		
	</div>	
	<div class="last my-3">
		<input id="signup" type="submit" value="완료" class="btn btn-info mt-4 btn-lg" />
	</div>
</form>