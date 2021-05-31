<%@page import="Member.MemberDBManage"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MemberDBManage mdb = new MemberDBManage();
	PrintWriter script = response.getWriter();
	
	
	if(mdb.IdCheck((String)request.getParameter("userid"))==1){
		script.println("<script>");
		script.println("alert('이미 있는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		script.println("<script>");
		script.println("alert('사용 할수 있는 아이디입니다.')");
		script.println("</script>");
		script.close();
	}
	
	%>