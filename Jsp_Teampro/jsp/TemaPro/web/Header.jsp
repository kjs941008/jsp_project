<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ����</title>
	<link href="CSS/styles.css" rel="stylesheet" />
    <style type="text/css">
        #wrap{
            text-align: center;
            width: 1200px;
            height: 300px;
        }
    </style> 
</head>
<body>
	<%
		String MainPage;
	%>
	<div id="wrap">
		<div class="container px-4 bg-dark py-3">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">������ Ŀ�´�Ƽ</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With clean & new EC</p>
                </div>
            </div>
            <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item ms-lg-2"><a class="nav-link active" aria-current="page" href="index.jsp" onclick="changeView(0)">Home</a></li>
                        <li class="nav-item ms-lg-2"><a class="nav-link" href="#!">������ �˻�</a></li>
                        <li class="nav-item dropdown ms-lg-2">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">������</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">������ ��ȸ</a></li>
                                <li><a class="dropdown-item" href="#!">����ó ��ȸ</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">������ ���� ����</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown ms-lg-2">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">�Խ���</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">������ ����</a></li>                                
                                <li><a class="dropdown-item" href="#!">������ �ǻ���</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button id="login" class="btn btn-outline-dark" type="button">
                        <a href="?MainPage=Member/Login.jsp">LOGIN</a>                            
                        </button>
                    </form>
                    <form class="d-flex">
                        <button id="signup" class="btn btn-outline-dark ms-lg-2" type="button">
                        <a href="?MainPage=Member/SignUp.jsp">SignUp</a>
                        </button>
                    </form>
                </div>
            </div>
        	</nav>
	</div>
</body>
</html>