<%@page import="Mail.naver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Member.MemberDBManage"%>
<%
	naver mdb = new naver();
	mdb.naverMailsender();
%>