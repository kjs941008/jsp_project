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
				<label for="userid">���̵�</label>
				<input type="text" name="userid" id="userid" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="upasswd">��й�ȣ</label>
				<input type="text" name="upasswd" id="upasswd" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="uname">�̸�</label>
				<input type="text" name="uname" id="uname" class="form-control"/>
			</div>
			<input type="submit" value="ȸ������" class="btn btn-primary"/>
		</form>
</body>
</html>