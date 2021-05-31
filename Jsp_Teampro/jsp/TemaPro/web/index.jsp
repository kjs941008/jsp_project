<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Object id = session.getAttribute("id");
	Object name = session.getAttribute("name");
	Object rid = session.getAttribute("rid");
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null){
        contentPage="FirstView.jsp";
    }
   
%>
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
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

        <style>
 	        #wrap { 
 	            width: 1200px; 
 	            margin : 0 auto 0 auto;
 	        }	         
 	        #header {
 	        	 
 	            text-align: center;
 	            width: 1200px; 
 	            height: 200px; 
 	            
 	        }	         
 	        #main { 
                float: left; 
 	            width: 1200px; 
 	            height: 500px; 
 	            text-align:center; 
 	            vertical-align: bottom;
 	        } 
 	        #footer {
 	            clear: left; 
 	            width: 1200px; 
 	            height: 60px; 
 	        }
        </style>
    </head>
    <body>
    <div id="wrap">
    	<div id="header">
   			<jsp:include page="Header.jsp" />
        </div>    
    	<div id="main">
            <jsp:include page="<%=contentPage%>"/>
    	</div>
    	<div id="footer">
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
     	</div>
     </div>
    </body>
</html>
	