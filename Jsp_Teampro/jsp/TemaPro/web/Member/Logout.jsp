<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 정보 삭제
	session.invalidate();
	response.sendRedirect("../index.jsp");
%>