<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<!-- <form action="SignUpAction.jsp" method="get"id="sign"> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label for="userid">아이디</label> <input type="text" name="userid" -->
<!-- 			id="userid" class="form-control" /> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label for="upasswd">비밀번호</label> <input type="password" -->
<!-- 			name="upasswd" id="upasswd" class="form-control" /> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label for="uname">이름</label> <input type="text" name="uname" -->
<!-- 			id="uname" class="form-control" /> -->
<!-- 	</div> -->
<!-- 	<input type="submit" value="회원가입" class="btn btn-primary" /> -->

<header>
	<h2>회원가입</h2>
</header>
<form action="" method="POST">
	<div class="input-box">
	<label for="id">ID </label>
		<input id="id" type="text" name="username" placeholder="아이디">		
	</div>
	<div class="input-box">
	<label for="pw">PW</label>
		<input id="pw" type="password" name="password" placeholder="비밀번호"> 
	</div>
	<div class="input-box">
		<label for="name">이름</label> 
		<input id="name" type="text" name="name" placeholder="이름">
	</div>
	<input type="submit" value="회원가입">
	<input type="button" value="뒤로가기">
</form>