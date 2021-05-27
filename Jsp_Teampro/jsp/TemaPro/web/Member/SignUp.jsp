<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<form action="SignUpAction.jsp" method="get">
			<div class="form-group">
				<label for="userid">아이디</label>
				<input type="text" name="userid" id="userid" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="upasswd">비밀번호</label>
				<input type="password" name="upasswd" id="upasswd" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="uname">이름</label>
				<input type="text" name="uname" id="uname" class="form-control"/>
			</div>
			<input type="submit" value="회원가입" class="btn btn-primary"/>
		</form>
		
</body>
</html>