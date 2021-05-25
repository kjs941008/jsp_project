<%@page import="Map.MapInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Map.MapDBManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String addr = request.getParameter("addr");
out.println(addr);
	MapDBManage mdb = new MapDBManage();
	ArrayList<String> list = mdb.SearchMap(addr);
	for(int i = 0; i < list.size(); i++){
	out.println(list.get(i));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>