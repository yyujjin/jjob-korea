<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-white">
	       <div class="container-fluid">
	         <a class="navbar-brand" href="#">

	           <!-- 이미지 추가 -->
	           <img src="../../resources/img/jjobkorea_logo.png" alt="Logo" width="200" height="100" class="d-inline-block align-text-top">

	         </a>
	        
	         <div class="collapse navbar-collapse" id="navbarNav">
	           <ul class="navbar-nav">
	             <li class="nav-item">
	               <!-- aria-current=>현재 상태를 나타내는 역할 -->
				  <!--/requestPage/main/main-content 이런식으로 경로 하려니까 요청 경로 자체가 바껴서 컨트롤러 단에서 해줘야 함 --> 
	               <a class="nav-link active" aria-current="page" href="/requestPage/main">Home</a>
	             </li>
	             <li class="nav-item">
	               <a class="nav-link" href="/requestPage/jobPosting">채용 정보</a>
	             </li>
	             <li class="nav-item">
	               <a class="nav-link" href="/requestPage/jobSeekerBoard">구직자 게시판</a>
	             </li>
	             <li class="nav-item">
	               <a class="nav-link" href="/requestPage/companyBoard">기업 게시판</a>
	             </li>
	             <li class="nav-item">
					<!--파라미터 넘기기-->
	               <a class="nav-link" href="/requestPage/login">로그인</a>
	             </li>
	             <li class="nav-item">
	               <a class="nav-link" href="/requestPage/mypage">마이 페이지</a>
	             </li>
	           </ul>
	         </div>
	       </div>
	     </nav>
	     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
	
</html>

