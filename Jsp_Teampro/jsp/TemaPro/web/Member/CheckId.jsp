<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
<% Object check = session.getAttribute("check");
	String Idv =" ";
	Idv = request.getParameter("Idv");
	System.out.println(check);
%>
function setText(){
    opener.document.getElementById("userid").value = document.getElementById("userid").value
    <%session.invalidate();%>
    window.close();
}
</script>
</head>
<body>
<form action="CheckIdAction.jsp" method="get"id="sign">
	<div class="form-group">
		<label for="userid">아이디</label> <input type="text" name="userid"
			id="userid" class="form-control" value ="<%=Idv %>" />
	</div>
	<input type="submit" value="중복 확인" class="btn btn-primary" />
	<%if(check != null){%>
	<button type="button" id="useId" onclick="setText()">사용하기</button>
	<%}else{%>
	<button type="button" id="useId" onclick="setText()" disabled>사용하기</button>
	<%}%>
</form>
</body>
</html>