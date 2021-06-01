<%@page import="Member.MemberDBManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
    <input type='text' id='userID' name='userID' placeholder='아이디를 입력하세요...' >
    <input type='submit' id='checkBtn' onclick="idcheck()" value='중복확인' >
<div id='message'></div>

<script>
	function idcheck(){
        var userID = $('#userID').val();
        $.ajax({
            type:'post',
            url:'./MemberDAO ',
            dataType:'text',
            data:{userID : userID},
            success: function(reuslt) {
                if(reuslt == 0) {
                    $('#message').text('사용할 수 있는 ID입니다.')      
                    $('#checkBtn').prop('disabled', true) // 사용할 수 있는 ID면 버튼을 비활성화 시킨다.
                } else {
                    $('#message').text('이미 사용 중인 아이디입니다.')
                }
            }
        })    //ajax
	}
</script>
</body>
</html>