<%@page import="Mail.Naver"%>
<%@page import="Member.MemberInfo"%>
<%@page import="Member.MemberDBManage"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String uname = (String)request.getParameter("uname");
String umail = (String)request.getParameter("umail");

PrintWriter script = response.getWriter();
MemberDBManage mdb = new MemberDBManage();
MemberInfo mif = mdb.FindID(uname, umail);
String userid = mif.getUserid();

if(mif.getSuc() == 1){
	Naver.FindIDMail(umail,userid);
	script.println("<script>");
	script.println("alert('메일확인')");
	script.println("window.close()");
	script.println("</script>");
}else{
	script.println("<script>");
	script.println("alert('이메일, 이름이 틀렸습니다')");
	script.println("history.back()");
	script.println("</script>");
}

%>