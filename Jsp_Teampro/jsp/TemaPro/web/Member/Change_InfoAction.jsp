<%@page import="java.io.PrintWriter"%>
<%@page import="Member.MemberDBManage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Object id = session.getAttribute("id");
String userid = id+"";
String uname = (String)request.getParameter("uname");
String uaddr = (String)request.getParameter("uaddr");
String umail = (String)request.getParameter("umail");

PrintWriter script = response.getWriter();
MemberDBManage mdb = new MemberDBManage();

if(mdb.ChangeInfo(userid, uname, uaddr, umail)){

	script.println("<script>");
	script.println("alert('성공')");
	script.println("location.href = '../index.jsp'");
	script.println("</script>");
	
}else{
	
	script.println("<script>");
	script.println("alert('실패')");
	script.println("history.back()");
	script.println("</script>");
	
}


%>
