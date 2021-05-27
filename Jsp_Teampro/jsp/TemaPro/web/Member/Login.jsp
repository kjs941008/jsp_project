<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<form action="LoginAction.jsp" method="get">
	<div class="form-group">
		<label for="id">아이디</label>
		<input type="text" name="id" id="id" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="pw">비밀번호</label>
		<input type="password" name="pw" id="pw" class="form-control"/>
	</div>
	<input type="submit" value="로그인" class="btn btn-primary"/>
</form>