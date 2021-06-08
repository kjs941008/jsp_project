<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="Member.MemberInfo"%>
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
	final String board_name = "notice";

	MemberInfo user = (MemberInfo) session.getAttribute("userinfo");

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
			<%=article.getUname()%>
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
		<a href="index.jsp?contentPage=Board/<%=board_name%>_main.jsp"><input
			class="btn btn-primary" type="button" value="목록보기" /></a>
		<%
			if (user != null) {
				int check = Integer.parseInt(user.getMid());
				if (check == article.getMid()) {
		%>
		<a
			href="index.jsp?contentPage=Board/<%=board_name%>_update.jsp?idx=<%=article.getArticle_idx()%>"><input
			class="btn btn-primary" type="button" value="수정" /></a> <input
			class="btn btn-primary"
			onclick="deleteArticle(<%=board_name%>, <%=article_idx%>)"
			type="button" value="삭제" />
		<%
				}
			}
		%>
	</div>
		<%
			// user정보가 있으면 댓글 달 수 있다.
		%>
	<div id="reply_write_container" class="" style="width: 450px;">
		<textarea id="rp_context" class="" rows="3" cols="50"
			placeholder="댓글 내용을 작성하세요. 댓글은 삭제할 수 없으니 신중하게 작성해주세요."></textarea>
		<input type="button" id="rp_btn" value="작성" onclick="writeReply(<%=board_name%>, <%=article_idx%>, 0)"/>
	</div>
		<%
			
		%>
		
	<div id="reply_view_container" class="" style="width: 450px;">
		<!-- 댓글 뷰어 -->
	</div>
</body>
</html>