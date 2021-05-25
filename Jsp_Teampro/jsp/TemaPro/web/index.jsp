<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f2742810f51fd185f367e60d19d4d07"></script>
		<h1>헤더</h1>
	</header>
	<section>
		<h1>섹션</h1>
	</section>
	<aside>
		<button id = "SignUp" onclick = "location.href='Member/SignUp.jsp'">회원가입</button>
		<button id = "Login" onclick = "location.href='Member/Login.jsp'">로그인</button>
		<button id = "AllMapMarking" onclick = "location.href='Map/All_Map.jsp'">충전소 위치 찾기</button>
	</aside>
	<footer>
		<form action="Map/Search_Map.jsp" method="get">
			<div class="form-group">
				<label for="addr">주소 검색</label> <input type="text" name="addr" id="addr"
					class="form-control" />
			</div>
			<input type="submit" value="검색" class="btn btn-primary" />
		</form>
		</form>
	</footer>
</body>
</html>