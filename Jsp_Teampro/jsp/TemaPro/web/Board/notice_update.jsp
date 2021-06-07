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
		Board orgin = null;
		int article_idx = Integer.parseInt(request.getParameter("idx"));
		DML_Board dml = new DML_Board();
		orgin = dml.getArticle(article_idx);
	%>
	<!-- writer | title | content | timestamp(reg) -->
	<form name="form" id="form" role="form" method="post"
		action="Board/proc_update.jsp">
		<div class="mb-3" style="visibility: hidden;">
			<label for="idx">게시글 id</label> <input type="number"
				class="form-control" name="idx" id="idx" value="<%=orgin.getArticle_idx()%>">
			<label for="bid">게시판 id</label> <input type="number"
				class="form-control" name="bid" id="bid" value="<%=orgin.getBid()%>">
		</div>
		<div class="mb-3">
			<label for="title">제목</label> <input type="text" class="form-control"
				name="title" id="title" placeholder="제목을 입력해 주세요" value="<%=orgin.getTitle()%>">
		</div>
		<div class="mb-3">
			<label for="content">내용</label>
			<textarea class="form-control" rows="5" name="content" id="content"
				placeholder="내용을 입력해 주세요"><%=orgin.getContent()%></textarea>
		</div>
		<div class="mb-3">
			<input class="btn btn-primary" type="submit" value="수정" />
		</div>
	</form>
</body>
</html>