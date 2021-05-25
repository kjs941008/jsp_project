<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
Object id = session.getAttribute("id");
Object name = session.getAttribute("name");
Object rid = session.getAttribute("rid");
%>
<body>

	<%if(id != null){
		out.print("안녕하세요 "+name+" 님");
	%>
	<button id="Logout" onclick="location.href='Member/Logout.jsp'">로그아웃
	</button>
	<div>
		<button id="AllMapMarking" onclick="location.href='Map/All_Map.jsp'">충전소
			위치 찾기</button>
	</div>
	<form action="Map/Search_Map.jsp" method="get">
		<div class="form-group">
			<label for="addr">주소 검색</label> <input type="text" name="addr"
				id="addr" class="form-control" /> <input type="submit" value="검색"
				class="btn btn-primary" />
		</div>
	</form>
	<%}%>
	<%if(id == null){ %>
	<button id="SignUp" onclick="location.href='Member/SignUp.jsp'">회원가입</button>
	<button id="Login" onclick="location.href='Member/Login.jsp'">로그인</button>
	<%} %>

</body>
</html>