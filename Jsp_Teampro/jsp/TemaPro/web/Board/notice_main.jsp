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
<script src="./js/board.js"></script>
<body>
	<!-- 공지사항은 로그인 여부와 관계없이 목록과 글 내용을 볼 수 있다 -->
	<!-- 다만 글 작성은 관리자(rid = 0)만 가능, 일반회원(rid = 1)은 불가능 -->
	<%
	final int BID = 100;
	
	// TODO session에서 회원정보 확인. 관리자인 경우 아래 글쓰기 버튼 활성화
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
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
					</tr>
				</thead>
				<!-- TODO DB에서 불러온 값 입력 -->
				<!-- TODO detail 링크 -->
				<%
					/* 조건 */
				if (pagination > 0) {
					// 글 있음
					list = dml.select_all(1, ROW_CNT);// default page = 1
					for (Board b : list) {
				%>
				<tbody>
					<tr id="<%=b.getArticle_idx()%>"
						onclick="notice_readArticle(<%=b.getArticle_idx()%>)">
						<td><%=b.getArticle_idx()%></td>
						<td><%=b.getTitle()%></td>
						<td><%=b.getMid()%></td>
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
						<td>No result</td>
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
			<!-- TODO 페이지네이션 -->
			<a href="#"><%=(i + 1)%></a>
			<%
				}
			}
			%>
		</div>
		<%
			// TODO 관리자면 아래 div 활성화
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