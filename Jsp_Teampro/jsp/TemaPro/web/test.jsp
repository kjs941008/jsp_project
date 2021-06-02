<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Member.MemberDBManage"%>
<%
	MemberDBManage mdb = new MemberDBManage();
	mdb.ChangePw("123b", "123", "123a");
%>