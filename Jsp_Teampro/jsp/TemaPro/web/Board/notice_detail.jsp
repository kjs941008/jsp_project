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
	
		int article_idx = Integer.parseInt(request.getParameter("idx"));
		DML_Board dml = new DML_Board();
		Board article = null;
		article = dml.getArticle(article_idx);
	%>
	<!-- article_id | title | content | writer | timestamp(reg) -->
	<!-- article title: title -->
	<div id="wrap" class="">
		<label for="writer">글쓴이</label>
		<div id="writer" class="">
			<%=article.getUname() %>
		</div>
		<%
				if (article.getMod_date() != null) {
			%>
		<label for="date">최종 수정 시간</label>
		<div id="date" class="">
			<%=article.getMod_date()%>
		</div>
		<%
				} else {
			%>
		<label for="date">작성 시간</label>
		<div id="date" class="">
			<%=article.getReg_date()%>
		</div>
		<%
				}
			%>
		<label for="title">제목</label>
		<div id="title" class="">
			<%=article.getTitle()%>
		</div>
		<label for="content">내용</label>
		<div id="content" class="">
			<%=article.getContent()%>
		</div>
	</div>
	<div class="">
		<a href="index.jsp?contentPage=Board/<%=board_name%>main.jsp"><input
			class="btn btn-primary" type="button" value="목록보기" /></a>
		<%
			// TODO 권한 확인 후 수정, 삭제버튼 활성화
			{
		%>
		<a
			href="index.jsp?contentPage=Board/<%=board_name%>update.jsp?idx=<%=article.getArticle_idx()%>"><input
			class="btn btn-primary" type="button" value="수정" /></a> <input
			class="btn btn-primary"
			onclick="<%=board_name%>deleteArticle(<%=article_idx%>)"
			type="button" value="삭제" />
		<%
			}
		%>
	</div>
</body>
</html>