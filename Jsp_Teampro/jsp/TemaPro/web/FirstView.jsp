<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>첫 화면</title>
</head>
<body>       
    <%
        if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { 
    %>
            <br><br><br>
            <b><font size="6" color="gray">첫화면</font></b>            
    <%
        }
        else // 로그인 했을 경우
        {
    %>
            <br><br><br>
            <font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
            <font size=6>님 환영합니다.</font>
    <%    } %>
</body>
</html>