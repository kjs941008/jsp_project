<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>JSP Project</title>
</head>
<body>
    <form action="Member/LoginAction.jsp" method="get">
		<div class="form-group">
			<label for="id">���̵�</label>
			<input type="text" name="id" id="id" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="pw">��й�ȣ</label>
			<input type="password" name="pw" id="pw" class="form-control"/>
		</div>
		<input type="submit" value="�α���" class="btn btn-primary"/>
	</form>
</body>
</html>