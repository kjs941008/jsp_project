<%@page import="CarSearch.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>전기차 리스트</h2>
	<div>
		<form>
			<fieldset>
				<legend>차량 검색 필드</legend>
				<label>검색분류</label>
					<select name = "f" id="f">
						<option ${(param.f == "sedan")? "selected" : "" } id="승용">승용</option>
						<option ${(param.f == "micro electric")? "selected" : "" } id="초소형" >초소형 전기자동차</option>
						<option ${(param.f == "freight")? "selected" : "" } id="화물">화물</option>
						<option ${(param.f == "micro bike")? "selected" : "" } id="경형" >경형 이륜차</option>
						<option ${(param.f == "small bike")? "selected" : "" } id="소형" >소형 이륜차</option>
						<option ${(param.f == "big bike")? "selected" : "" } id="대형" >대형 이륜차</option>
						<option ${(param.f == "hydro bike")? "selected" : "" } id="수소" >수소 이륜차</option>
						<option ${(param.f == "micro Excavator")? "selected" : "" } id="굴착기" >전기 굴착기</option>
					</select>
					<input type = "submit" value = "검색">
			</fieldset>
		</form>
		<script type="text/javascript">
		$('#f').
		alert($('#승용').val())
		</script>
	</div>
	
	<div>
		<table border = "1">
			<thead>
				<tr>
					<th>차량종류</th>
					<th>차량회사</th>
					<th>차량모델명</th>
					<th>가격</th>			
				</tr>
			</thead>
			
			<%
				CarS_DAO car = new CarS_DAO();
				ArrayList<CarS_DTO>list = car.carS();
				for(CarS_DTO dto:list){
			%>
		<tr>
			<td><%=dto.getDiv() %></td>
			<td><%=dto.getCompany() %></td>
			<td><%=dto.getCartype() %></td>
			<td><%=dto.getPrice() %></td>
		</tr>
		<%
		}
		%>
		</table>
	</div>
</body>

</html>