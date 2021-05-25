<%@page import="Member.MemberInfo"%>
<%@page import="Member.MemberDBManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	MemberDBManage mdb = new MemberDBManage();
		
    	if(mdb.ckLogin(id,pw)==1){
    		out.print("성공");
    	}
    	else if(mdb.ckLogin(id,pw)==0){
    		out.print("비밀번호 틀림");
    	}
    	else if(mdb.ckLogin(id,pw)==-1){
    		out.print("업슨아이다");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>