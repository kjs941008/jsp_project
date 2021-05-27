<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>JSP Project</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        <script type="text/javascript">
	        window.onload = function(){
	    		document.getElementById('login').onclick=function(){
	    			location.href = 'Member/Login.jsp';
	    		}
	    		document.getElementById('signup').onclick=function(){
	    			location.href = 'Member/SignUp.jsp';
	    		}		
	    	}	        
        </script>
        <style>
	        #wrap {
	            width: 1200px;
	            margin: 0 auto 0 auto;
	        }	        
	        #header {
	            text-align: center;
	            width: 1200px;
	            height: 300px;
	        }	        
	        #main {
                float: left;
	            width: 1200px;
	            height: 500px;
	            text-align:center;
	            vertical-align: middle;
	        }
	        #footer {
	            clear: left;
	            width: 1200px;
	            height: 100px;
	            text-align:center;
	            padding-top : 30px;
	        }
        </style>
    </head>
    <body>
    
    <%
	    String contentPage=request.getParameter("MainPage");
	    if(contentPage==null)
	        contentPage="FirstView.jsp";
	%>
    
    <div id="wrap">
    	<div id="header">
   			<jsp:include page="Header.jsp" />
        </div>    
    	<div id="main">
            <jsp:include page="<%=contentPage%>"/>
    	</div>      
    	<div id="footer" class="container bg-dark">
    		<p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
    	</div>
     </div>
    </body>
</html>
	