<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
	<!-- 공지사항은 로그인 여부와 관계없이 목록과 글 내용을 볼 수 있다 -->
	<!-- 다만 글 작성은 관리자(rid = 0)만 가능, 일반회원(rid = 1)은 불가능 -->

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
					{
				%>
				<tr>
					<td>?</td>
					<td>?</td>
					<td>?</td>
					<td>?</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="pagination" class="">
			<%
				/* 조건 */
				{
			%>
			<!-- TODO 페이지네이션 -->
			<%
				}
			%>
		</div>
		<div id="submit" class="">
			<!-- TODO write 링크 -->
			<a href="#"><input type="button" value="글쓰기"></a>
		</div>
	</div>
</body>
</html>