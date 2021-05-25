<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Member.MemberDBManage"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%
        	MemberDBManage su = new MemberDBManage();
        	String sucValue = "";
        	//한글
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
			Date time = new Date();
			String time1 = format1.format(time);
			System.out.println(time1);
        	request.setCharacterEncoding("utf-8");
        	
//        	String p_userid = (String)request.getParameter("userid");
//        	String p_upasswd = (String)request.getParameter("upasswd");
 //       	String p_uname = (String)request.getParameter("uname"); 
        	
        	su.SignUp((String)request.getParameter("userid"),
        			(String)request.getParameter("upasswd"),
        			(String)request.getParameter("uname"),
        			time1);
        	sucValue = "<a class='btn btn-primary' href='../index.jsp'>로그인페이지이동</a>";
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
			<% out.print(sucValue); %>
</body>
</html>