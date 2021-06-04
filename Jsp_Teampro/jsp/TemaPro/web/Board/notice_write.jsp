<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="user.Member_List"%> --%>
<%@ page import="Member.MemberInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
	<%
		final int BID = 100;
		MemberInfo user = (MemberInfo) session.getAttribute("userinfo");
	%>
	<!-- writer | title | content | timestamp(reg) -->
	<form name="form" id="form" role="form" method="post"
		action="Board/proc_write.jsp">
		<div class="mb-3" style="visibility: hidden;">
			<label for="bid">게시판 id</label> <input type="number"
				class="form-control" name="bid" id="bid" value="<%=BID%>"> <label
				for="mid">게시자 id</label> <input type="number" class="form-control"
				name="mid" id="mid" value="<%=user.getMid()%>">
		</div>
		<div class="mb-3">
			<label for="title">제목</label> <input type="text" class="form-control"
				name="title" id="title" placeholder="제목을 입력해 주세요">
		</div>
		<div class="mb-3">
			<label for="content">내용</label>
			<textarea class="form-control" rows="5" name="content" id="content"
				placeholder="내용을 입력해 주세요"></textarea>
		</div>
		<div class="mb-3">
			<input class="btn btn-primary" type="submit" value="작성" />
		</div>
	</form>
</body>
</html>