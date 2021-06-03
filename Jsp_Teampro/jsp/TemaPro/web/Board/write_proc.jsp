<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.DML_Board"%>
<%@ page import="Member.MemberInfo"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	PrintWriter script = response.getWriter();
	int bid = Integer.parseInt(request.getParameter("bid"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	// TODO 세션에서 회원 객체 받아와서 회원번호 입력
	int mid = -1;
	MemberInfo user = (MemberInfo) session.getAttribute("member");
	if (user != null)
		mid = Integer.parseInt(user.getMid());
	// 	Board article;
	// 	article = new Board(bid, mid, title, content);
	DML_Board dml = new DML_Board();
	// 	int result = dml.insert_article(bid, mid, title, content);
	int result = dml.insert_article(bid, 0, title, content);

	script.println("<script>");
	if (result > 0) {
		// 글쓰기 성공
		script.println("alert('작성 완료!')");
	} else if (result == 0) {
		// 실패
		script.println("alert('작성 실패...')");
	} else {
		// 에러
		script.println("alert('에러.')");
	}
	script.println("location.href = '../index.jsp?contentPage=Board/notice_main.jsp'");
	script.println("</script>");
%>