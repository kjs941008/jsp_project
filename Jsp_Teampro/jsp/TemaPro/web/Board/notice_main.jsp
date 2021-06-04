<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.DML_Board"%>
<%-- <%@ page import="user.Member_List"%> --%>
<%@ page import="Member.MemberInfo"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<script src="js/board.js"></script>
<body>
	<!-- 공지사항은 로그인 여부와 관계없이 목록과 글 내용을 볼 수 있다 -->
	<!-- 다만 글 작성은 관리자(rid = 0)만 가능, 일반회원(rid = 1)은 불가능 -->
	<%
		// 100 = 공지사항
		final String board_name = "notice_";
		final int BID = 100;
		int pg;
		if (request.getParameter("pg") != null)
			pg = Integer.parseInt(request.getParameter("pg"));
		else
			pg = 1;
	
		int ROW_CNT = 10;
		DML_Board dml = new DML_Board();
		int pagination = dml.select_pageCount(ROW_CNT);
		ArrayList<Board> list = null;
	%>
	<!-- table title: board_name -->
	<!-- table columns -->
	<!-- article_id | title | writer | timestamp(reg) -->
	<div id="container" class="">
		<div id="board_table" class="">
			<table class="table table-striped">
				<thead class="thead-light">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<%
					/* 조건 */
					if (pagination > 0) {
						// 글 있음
						list = dml.select_all(pg, ROW_CNT);// default page = 1
						for (Board b : list) {
				%>
				<tbody>
					<tr id="<%=b.getArticle_idx()%>"
						onclick="<%=board_name%>readArticle(<%=b.getArticle_idx()%>)">
						<th scope="row"><%=b.getArticle_idx()%></th>
						<td><%=b.getTitle()%></td>
						<td><%=b.getUname()%></td>
						<td><%=b.getReg_date()%></td>
					</tr>
				</tbody>
				<%
						}
					} else {
					// 글 없음
				%>
				<tbody>
					<tr>
						<td colspan="4">No result</td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
		</div>

		<div id="pagination" class="">
			<%
				/* 조건 */
				if (pagination > 0) {
					for (int i = 0; i < pagination; i++) {
				%>
				<%
					// TODO 페이지네이션(pre, next)
				%>
				<a
					href="index.jsp?contentPage=Board/<%=board_name%>main.jsp?pg=<%=(i + 1)%>"><%=(i + 1)%></a>
				<%
					}
				}
			%>
		</div>
		<%
			MemberInfo user = (MemberInfo)session.getAttribute("userinfo");
			if (user != null) {
				if (user.getRid() == 1) {
		%>
		<div id="submit" class="">
			<a href="index.jsp?contentPage=Board/<%=board_name%>write.jsp"><input
				type="button" class="btn btn-primary" value="글쓰기"></a>
		</div>
		<%
				}
			}
		%>
	</div>
</body>
</html>