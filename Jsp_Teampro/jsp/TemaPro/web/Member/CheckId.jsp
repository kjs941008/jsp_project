<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).on('click','#useId', function () {
	var Id = $('#userid').val();
    alert("테스트 : "+Id);
   // window.close();
});
console.log(id+"gd");
</script>
</head>
<body>
<form action="CheckIdAction.jsp" method="get"id="sign">
	<div class="form-group">
		<label for="userid">아이디</label> <input type="text" name="userid"
			id="userid" class="form-control" placeholder ="아이디를 입력해 주세요" />
	</div>
	<input type="submit" value="중복 확인" class="btn btn-primary" />
	<button type="button" id="useId">사용하기</button>
</form>
</body>
</html>