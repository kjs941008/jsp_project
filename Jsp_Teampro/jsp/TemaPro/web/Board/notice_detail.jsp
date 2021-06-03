<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.DML_Board"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<script src="js/board.js"></script>
<body>
	<%
		// 100 = 공지사항
		final String board_name = "notice_";
		final int BID = 100;
	
		int article_idx = Integer.parseInt(request.getParameter("idx"));
		DML_Board dml = new DML_Board();
		Board article = null;
		article = dml.getArticle(article_idx);
		request.setAttribute("test", (Board)article);
	%>
	<!-- article_id | title | content | writer | timestamp(reg) -->
	<!-- article title: title -->
	<div id="wrap" class="">
		<div id="writer" class="">
			<!-- 글쓴이 -->
			관리자
		</div>
		<div id="date" class="">
			<!-- 작성시간(or 수정시간) -->
			<%
				if (article.getMod_date() != null) {
			%>
			<%=article.getMod_date()%>
			<%
				} else {
			%>
			<%=article.getReg_date()%>
			<%
				}
			%>
		</div>
		<div id="title" class="">
			<!-- 제목 -->
			<%=article.getTitle()%>
		</div>
		<div id="content" class="">
			<%=article.getContent()%>
			<!-- 내용 -->
		</div>
	</div>
	<div class="">
		<!-- 버튼: 목록보기, 수정, 삭제... -->
		<a href="index.jsp?contentPage=Board/<%=board_name%>main.jsp"><input
			class="btn btn-primary" type="button" value="목록보기" /></a>
		<%
			// TODO 권한 확인 후 수정, 삭제버튼 활성화
			{
		%>
		<a href="index.jsp?contentPage=Board/<%=board_name%>update.jsp"><input
			class="btn btn-primary" type="button" value="수정" /></a>
		<input
			class="btn btn-primary"
			onclick="<%=board_name%>deleteArticle(<%=article_idx%>)"
			type="button" value="삭제" />
		<%
			}
		%>
	</div>
</body>
</html>