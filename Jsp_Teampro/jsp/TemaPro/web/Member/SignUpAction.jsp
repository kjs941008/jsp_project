<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Member.MemberDBManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
        	MemberDBManage su = new MemberDBManage();
        	String sucValue = "";
        	//한글
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
			Date time = new Date();
			String time1 = format1.format(time);
			System.out.println(time1);
        	request.setCharacterEncoding("utf-8");
        	
        	
        	su.SignUp((String)request.getParameter("userid"),
        			(String)request.getParameter("upasswd"),
        			(String)request.getParameter("uname"),
        			time1);
        	
        	PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("location.href = '../index.jsp'");
    		script.println("</script>");
        	
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