<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.Reply"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Member.MemberInfo"%>
<%@ page import="board.DML_Board"%>
<%@ page import="user.DML_Member"%>
<%@ page import="board.Board_Info"%>
<%@ page import="board.DML_BoardInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	DML_BoardInfo info = new DML_BoardInfo();
	Board_Info this_board = null;
	
	MemberInfo user = (MemberInfo) session.getAttribute("userinfo");
	
	int article_idx = Integer.parseInt(request.getParameter("idx"));
	DML_Board dml = new DML_Board();
	DML_Member dml_user = new DML_Member();
	Board article = null;
	ArrayList<Reply> rp_list = null;
	rp_list = dml.show_rp(article_idx);
	article = dml.getArticle(article_idx);
	
	this_board = info.get_board_info(article.getBid());
	String bcode = this_board.getBcode();
	String board_name_kor = this_board.getBname_kor();
%>
<title><%=board_name_kor%></title>
</head>
<script src="js/board.js"></script>
<body class="">
	<!-- article_id | title | content | writer | timestamp(reg) -->
	<!-- article title: title -->
	<div id="wrap" class="container" style="width: 720px;">
		<div class="row">
			<div id="writer" class="col-3">
				<label class="">글쓴이</label>
				<label class="form-control"><%=article.getUname()%></label>
			</div>
			<div id="title" class="col-6">
				<label>제목</label>
				<label class="form-control">
					<%=article.getTitle()%>
				</label>
			</div>
		<%
			if (article.getMod_date() != null) {
		%>
			<div id="date" class="col-3">
				<label class="" for="date">최종 수정 시간</label>
				<label class="form-control"><%=article.getMod_date()%></label>
			</div>
		<%
			} else {
		%>
			<div id="date" class="col-3">
				<label class="" for="date">작성 시간</label>
				<label class="form-control"><%=article.getReg_date()%></label>
			</div>
		<%
			}
		%>
		</div>
		<div class="row">
			<div id="content" class="">
				<label class="">내용</label>
				<label class="form-control">
					<%=article.getContent()%>
				</label>
			</div>
		</div>
	</div>
	<div class="">
		<a href="index.jsp?contentPage=Board/<%=bcode%>_main.jsp"><input
			class="btn btn-primary" type="button" value="목록보기" /></a>
		<%
			if (user != null) {
			int check = Integer.parseInt(user.getMid());
			if (check == article.getMid()) {
		%>
		<a
			href="index.jsp?contentPage=Board/article_update.jsp?idx=<%=article.getArticle_idx()%>"><input
			class="btn btn-primary" type="button" value="수정" /></a> <input
			class="btn btn-primary"
			onclick="deleteArticle('<%=bcode%>', <%=article_idx%>)" type="button"
			value="삭제" />
		<%
			}
		}
		%>
	</div>
	<%
		if (user != null) {
		// 				System.out.printf(user.getMid());
	%>
	<div id="reply_write_container" class="container" style="width: 700px;">
		<textarea id="rp_context" class="form-control" rows="3" cols="50"
			placeholder="댓글 내용을 작성하세요. 댓글은 삭제할 수 없으니 신중하게 작성해주세요."></textarea>
		<input type="button" id="rp_btn" value="작성" class="form-control btn btn-primary"
			onclick="writeReply('<%=bcode%>', <%=article_idx%>, <%=user.getMid()%>, 0)" />
	</div>
	<%
		}
	%>
	<div id="reply_view_container" class="container" style="width: 700px;">
		<!-- 댓글 뷰어 -->
		<div>
			<table class="table table-striped">
				<thead class="thead-light">
					<tr>
						<th scope="col">작성자</th>
						<th scope="col">내용</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<%
					if (rp_list != null) {
					MemberInfo temp = null;
					for (Reply rp : rp_list) {
						temp = dml_user.getUser(rp.getMid());
				%>
				<tbody>
					<tr>
						<td><%=temp.getUname()%></td>
						<td><%=rp.getRp_context()%></td>
						<td><%=rp.getReg_date()%></td>
					</tr>
				</tbody>
				<%
					}
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>