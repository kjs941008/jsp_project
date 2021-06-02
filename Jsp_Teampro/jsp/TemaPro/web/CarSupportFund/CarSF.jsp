<%@page import="CarSupportFund.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>시도별 차량 보조금 현황</h2>
	<table border="1">
		<tr>
			<th>시도별</th>
			<th>전기차</th>
			<th>수소차</th>
		</tr>

		<%
		CarSF_DAO car = new CarSF_DAO();
				
				ArrayList<CarSF_DTO>list = car.carSF();
				for(CarSF_DTO dto:list){
		%>
		<tr>
			<td><%=dto.getSido() %></td>
			<td><%=dto.getElec() %></td>
			<td><%=dto.getHydro() %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>