<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.DML_Board"%>
<%@ page import="board.Board_Info"%>
<%@ page import="board.DML_BoardInfo"%>
<%@ page import="Member.MemberInfo"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	// TODO 게시판 별 바뀌어야 할 정보
	// 100 = 공지사항, 200 = 자유게시판
	int BID = 200;
	
	DML_BoardInfo info = new DML_BoardInfo();
	Board_Info this_board = null;
	this_board = info.get_board_info(BID);
	String bcode = this_board.getBcode();
	String board_name_kor = this_board.getBname_kor();
	
	int pg;
	if (request.getParameter("pg") != null)
		pg = Integer.parseInt(request.getParameter("pg"));
	else
		pg = 1;
	
	int ROW_CNT = 10;
	DML_Board dml = new DML_Board();
	int pagination = dml.select_pageCount(BID, ROW_CNT);
	ArrayList<Board> list = null;
%>
<title><%=board_name_kor%></title>
</head>
<script src="js/board.js"></script>
<body>
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
					list = dml.select_all(BID, pg, ROW_CNT);// default page = 1
					for (Board b : list) {
				%>
				<tbody>
					<tr id="<%=b.getArticle_idx()%>"
						onclick="readArticle('<%=bcode%>', <%=b.getArticle_idx()%>)">
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
				// TODO 페이지네이션(pre, next)?
			%>
			<a
				href="index.jsp?contentPage=Board/<%=bcode%>_main.jsp?pg=<%=(i + 1)%>"><%=(i + 1)%></a>
			<%
				}
			}
			%>
		</div>
		<%
			MemberInfo user = (MemberInfo) session.getAttribute("userinfo");
		if (user != null) {
		%>
		<div id="submit" class="">
			<a href="index.jsp?contentPage=Board/article_write.jsp?bid=<%=BID%>"><input
				type="button" class="btn btn-primary" value="글쓰기"></a>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>