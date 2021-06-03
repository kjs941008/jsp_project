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
<body>
	<%
		int article_idx = Integer.parseInt(request.getParameter("idx"));
		DML_Board dml = new DML_Board();
		Board article = null;
		article = dml.getArticle(article_idx);
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
</body>
</html>