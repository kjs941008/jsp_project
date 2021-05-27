<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상단 영역</title>
	<link href="CSS/styles.css" rel="stylesheet" />
    <style type="text/css">
        #wrap{
            text-align: center;
            width: 1200px;
            height: 300px;
        }
    </style>
    <script type="text/javascript">        
/*          function changeView(value){            
            if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
            {
                location.href="index.jsp";
            }
            else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
            {
            	page = Member/Login.jsp
                location.href='index.jsp?contentPage='+page
            }
            else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
            {
                location.href="http://localhost:9001/TemaPro/index.jsp?contentPage=Member/SignUp.jsp"
            }
            else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
            {
                location.href="Member/Logout.jsp";
            }
        } */
    	$('document').ready(function(){
    		$('#login').on('click',function(){
    			location.href='index.jsp?contentPage=Member/Login.jsp';
    		})
    		$('#signup').on('click',function(){
    			location.href='index.jsp?contentPage=Member/SignUp.jsp';
    		})
    	})

    </script>    
</head>
<body>
	<div id="wrap">
		<div class="container px-4 bg-dark py-3">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">전기차 커뮤니티</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With clean & new EC</p>
                </div>
            </div>
            <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item ms-lg-2"><a class="nav-link active" aria-current="page" href="index.jsp" onclick="changeView(0)">Home</a></li>
                        <li class="nav-item ms-lg-2"><a class="nav-link" href="#!">충전소 검색</a></li>
                        <li class="nav-item dropdown ms-lg-2">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">보조금</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">보조금 조회</a></li>
                                <li><a class="dropdown-item" href="#!">문의처 조회</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">보조금 관련 문의</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown ms-lg-2">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">충전소 건의</a></li>                                
                                <li><a class="dropdown-item" href="#!">전기차 실사용기</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button id="login" class="btn btn-outline-dark" type="button">
                            LOGIN
                        </button>
                    </form>
                    <form class="d-flex">
                        <button id="signup" class="btn btn-outline-dark ms-lg-2" type="button">
                            SIGN UP
                        </button>
                    </form>
                </div>
            </div>
        	</nav>
	</div>
</body>
</html>