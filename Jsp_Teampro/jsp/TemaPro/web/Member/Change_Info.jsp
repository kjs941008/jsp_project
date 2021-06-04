<%@page import="Member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
<%
MemberInfo userinfo  = (MemberInfo)session.getAttribute("userinfo");
	String id = userinfo.getUserid();%>
function changepw(){
	window.open('Member/Change_Pw.jsp',"_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400")
}
</script>
<form class="col-5 container" action="./Member/Change_InfoAction.jsp" method="get">

	<div class="form-group">
		<label for="userid">아이디</label>
		<input  class = "col-8" type="text" name="userid" id="userid" class="form-control" placeholder ="<%=id %>" disabled/>
	</div>

	<font style = "color : red"id="pwMessage" size="2"></font>
	
	<div class="form-group">
		<label for="uname">이름</label> <input class = "col-8" type="text" name="uname"
			id="uname" class="form-control" placeholder ="이름을 입력해 주세요" />
	</div>
	
	<div class="form-group">
		<label for="uaddr">주소</label> <input class = "col-8" type="text" name="uaddr" id="uaddr" class="form-control" placeholder ="주소를 입력해 주세요" />
	</div>
	<div class="form-group">
		<label for="umail">이메일</label> <input class = "col-8" type="text" name="umail" id="umail" class="form-control" placeholder ="이메일을 입력해 주세요" />
	</div>
	<button class="btn btn-primary" type="button" onclick ="changepw()">비밀번호 변경</button>
	<input type="submit" value="수정하기" class="btn btn-primary" />
</form>