<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.DML_Board"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
	<!-- 공지사항은 로그인 여부와 관계없이 목록과 글 내용을 볼 수 있다 -->
	<!-- 다만 글 작성은 관리자(rid = 0)만 가능, 일반회원(rid = 1)은 불가능 -->
	<%
		DML_Board dml = new DML_Board();
		int pagination = dml.select_pageCount(10);
		ArrayList<Board> list = null;
	%>
	<!-- table title: board_name -->
	<!-- table columns -->
	<!-- article_id | title | writer | timestamp(reg) -->
	<div id="container" class="">
		<div id="board_table" class="">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				</tr>
				<!-- TODO DB에서 불러온 값 입력 -->
				<!-- TODO detail 링크 -->
		<%
			/* 조건 */
		if (pagination > 0) {
		// 글 있음
			list = dml.select_all(1, 10);// default page = 1
			for (Board b : list) {
		%>
				<tr>
					<td><%=b.getArticle_idx()%></td>
					<td><%=b.getTitle()%></td>
					<td><%=b.getMid()%></td>
					<td><%=b.getReg_date()%></td>
				</tr>
		<%
			}
		} else {
				// 글 없음
		%>
				<tr>
					<td>No result</td>
				</tr>
		<%
		}
		%>
			</table>
		</div>

		<div id="pagination" class="">
			<%
				/* 조건 */
			if (pagination > 0) {
				for(int i=0; i<pagination; i++) {
			%>
			<!-- TODO 페이지네이션 -->
				<a href="#"><%=(i+1) %></a>
			<%
				}
			}
			%>
		</div>
		<%
			/* 조건(rid==1) */
			{
		%>
		<div id="submit" class="">
			<!-- TODO write 링크 -->
			<a href="#"><input type="button" value="글쓰기"></a>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>