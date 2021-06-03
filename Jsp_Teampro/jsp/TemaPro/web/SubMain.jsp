<%@page import="Ask.AskInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Ask.AskDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지자체 문의처</title>
<%
	AskDBManager adb = new AskDBManager();
	ArrayList<AskInfo> list = adb.select("건설기계");
%>
</head>
<body>
	<%
        String contentPage;
    %>
    <h3>저공해차 구매보조금 관련 문의처</h3>
<!-- A:전기승용, B:전기화물, C:전기승합, D:전기이륜차, E:수소연료전지차, F:건설기계 -->
	<button class='cartype' id="전기승용" onclick="reply_click(this.id)">전기승용</button>
	<button class='cartype' id="전기화물" onclick="reply_click(this.id)">전기화물</button>
	<button class='cartype' id="전기승합" onclick="reply_click(this.id)">전기승합</button>
	<button class='cartype' id="전기이륜차" onclick="reply_click(this.id)">전기이륜차</button>
	<button class='cartype' id="수소연료전지차" onclick="reply_click(this.id)">수소연료전지차</button>
	<button class='cartype' id="건설기계" onclick="reply_click(this.id)">건설기계</button>

	<div class="container my-5 text-center">    
		<table class="table table-bordered my-3">
   			<thead>
     			<tr>
			        <th>시도</th><th>지역구분</th><th>담당부서</th><th>연락처</th>        
			    </tr>
			</thead>
   			<tbody>
		      <%for(int i=0; i<list.size(); i++){
		    	  AskInfo info_list = list.get(i); %>
		      <tr>
		      	<td><% out.print(info_list.getCity()); %></td>
		      	<td><% out.print(info_list.getSido()); %></td>
		      	<td><% out.print(info_list.getDep()); %></td>
		      	<td><% out.print(info_list.getPn()); %></td>
		      </tr>
		      <% } %>
		    </tbody>
		</table>
	</div>
</body>
</html>