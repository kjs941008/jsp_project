<%@page import="Member.MemberDBManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<% MemberDBManage mdb = new MemberDBManage();
System.out.println(mdb.IdCheck("4453"));
if(mdb.IdCheck("4453") == 1){
	System.out.println("사용 불가능");
}
else{
	System.out.println("사용 가능");
}

%>
	<div class="form-group">
		<label for="userID">아이디</label>
		<input type="text" class="form-control" id="userID" name="userID" placeholder="ID" required>
		<div class="check_font" id="id_check"></div>
		<button onclick =""></button>
	</div>
	<div class="btn-group" data-toggle="buttons">
		<label>
			<input type="radio" name = "userGender" autocomplete="off" value="남자" checked>남자
		</label>
		<label>
			<input type="radio" name = "userGender" autocomplete="off" value="여자">여자
		</label>
	</div>
</body>
</html>