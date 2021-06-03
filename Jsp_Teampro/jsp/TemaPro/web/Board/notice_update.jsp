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
		// TODO 왜 orgin이 null이지...?
		orgin = (Board)request.getAttribute("test");
		System.out.println(orgin.toString());
	%>
	<!-- writer | title | content | timestamp(reg) -->
	<form name="form" id="form" role="form" method="post"
		action="Board/update_proc.jsp">
		<div class="mb-3" style="visibility: hidden;">
			<label for="bid">게시판 id</label> <input type="number"
				class="form-control" name="bid" id="bid" value="100">
		</div>
		<div class="mb-3" style="visibility: hidden;">
			<label for="member">작성자</label> <input type="text"
				class="form-control" name="member" id="member"
				value="<%=orgin.getUname()%>">
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