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
	<h2>Login</h2>
</header>
<form action="" method="POST">
	<div class="input-box">
	<label for="username">ID </label>
		<input id="username" type="text" name="username" placeholder="아이디">
		
	</div>
	<div class="input-box">
	<label for="password">PW</label>
		<input id="password" type="password" name="password"
			placeholder="비밀번호"> 
	</div>
	<div id="forgot">비밀번호 찾기</div>
	<input type="submit" value="로그인">
</form>
