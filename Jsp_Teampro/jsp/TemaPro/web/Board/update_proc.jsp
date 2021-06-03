<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.DML_Board"%>
<%@ page import="Member.MemberInfo"%>
<%@ page import="java.io.PrintWriter"%>
<%
	Board orgin = null;
	orgin = (Board) request.getAttribute("article");
	
	request.setCharacterEncoding("UTF-8");
	PrintWriter script = response.getWriter();
	int article_idx = orgin.getArticle_idx();
	int bid = Integer.parseInt(request.getParameter("bid"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int mid = -1;
	mid = orgin.getMid();
	DML_Board dml = new DML_Board();
	int result = dml.update_article(article_idx, title, content);
	
	script.println("<script>");
	if (result > 0) {
		// 글쓰기 성공
		script.println("alert('수정 완료!')");
	} else if (result == 0) {
		// 실패
		script.println("alert('수정 실패...')");
	} else {
		// 에러
		script.println("alert('에러.')");
	}
	script.println("location.href = '../index.jsp?contentPage=Board/notice_main.jsp'");
	script.println("</script>");
%>