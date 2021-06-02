<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
</script>
<form class="col-5 container" action="./Member/SignUpAction.jsp" method="get"id="sign">

	<div class="form-group">
		<label for="uname">이름</label> <input class = "col-8" type="text" name="uname"
			id="uname" class="form-control" placeholder ="이름을 입력해 주세요" />
	</div>
	<div class="form-group">
		<label for="umail">이메일</label> <input class = "col-8" type="text" name="umail" id="umail" class="form-control" placeholder ="이메일을 입력해 주세요" />
	</div>
	<input type="submit" value="회원가입" class="btn btn-primary" />
</form>