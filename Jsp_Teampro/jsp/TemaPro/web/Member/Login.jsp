<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8" />

<!-- <form action="LoginAction.jsp" method="get"> -->
<!-- 	<div class="container"> -->
<!-- 	<div class="form-group col-lg-3"><div></div></div> -->
<!-- 	<div class="form-group col-lg-3"> -->
<!-- 		<label for="id">아이디</label><input type="text" name="id" id="id" class="form-control"/> -->
<!-- 	</div> -->
<!-- 	<div class="form-group col-lg-3 col-rg-3"> -->
<!-- 		<label for="pw">비밀번호</label> -->
<!-- 		<input type="password" name="pw" id="pw" class="form-control"/> -->
<!-- 	</div> -->
<!-- 	<input type="submit" value="로그인" class="btn btn-primary"/> -->

<!-- 	</div> -->
<!-- </form> -->

<header>
	<h2>로그인</h2>
</header>
<form action="" method="POST">
	<div class="input-box">
	<label for="id">ID </label>
		<input id="id" type="text" name="username" placeholder="아이디">		
	</div>
	<div class="input-box">
	<label for="pw">PW</label>
		<input id="pw" type="password" name="password"	placeholder="비밀번호"> 
	</div>
	<input type="submit" value="로그인">
	<input type="button" value="ID 찾기">
	<input type="button" value="PW 찾기">	
</form>
