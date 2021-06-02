<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<header>
	<h2>Login</h2>
</header>
<form action="./Member/LoginAction.jsp" method="get">
	<div class="input-box">
	<label for="id">ID&nbsp</label>
		<input id="id" type="text" name="id" placeholder="아이디">
		
	</div>
	<div class="input-box">
	<label for="pw">PW</label>
		<input id="pw" type="password" name="pw"
			placeholder="비밀번호"> 
	</div>
	<input type="submit" value="로그인">
	<input type="button" value="ID찾기">
	<input type="button" value="PW찾기">
</form>
