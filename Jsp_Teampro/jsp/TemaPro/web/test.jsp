<%@page import="Mail.Naver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Member.MemberDBManage"%>
<%
	Naver mdb = new Naver();
	mdb.FindIDMail();
%>