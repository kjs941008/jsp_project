<%@page import="Member.MemberInfo"%>
<%@page import="Member.MemberDBManage"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	MemberDBManage mdb = new MemberDBManage();
    	MemberInfo mif = mdb.ckLogin(id,pw);
    	if(mif.getSuc()==1){
    		/*세션에 개인정보 저장  */
    		session.setAttribute("id", id);
    		session.setAttribute("name", mif.getUname());
    		session.setAttribute("rid", mif.getRid());
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("location.href = '../index.jsp'");
    		script.println("</script>");
    	}
    	else if(mif.getSuc()==0){
    		out.print("비밀번호 틀림");
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('비밀번호가 틀립니다.')");
    		script.println("history.back()");
    		script.println("</script>");
    	}
    	else if(mif.getSuc()==-1){
    		out.print("없는 아이디");
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('존재하지 않는 아이디입니다.')");
    		script.println("history.back()");
    		script.println("</script>");
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