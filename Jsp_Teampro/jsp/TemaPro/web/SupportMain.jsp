<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.btn-info{
		width:150pt;
		height:120pt;
		font-size : 28px;
	}
	#area{
		padding : 200px;
	}
</style>
</head>
<body>
<%
        String contentPage;
%>
<div id="area">
	<input type="button" class="btn btn-info mr-5" value="차종별" onclick="location.href='index.jsp?contentPage=CarSearch/CarS.jsp'">
	<input type="button" class="btn btn-info" value="시도별" onclick="location.href='index.jsp?contentPage=CarSupportFund/CarSF.jsp'">
</div>


</body>
</html>