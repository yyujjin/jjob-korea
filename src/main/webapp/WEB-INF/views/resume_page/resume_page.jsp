<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/resume_css/resume_css.css">
	
    <style>
        .scroll{
            width: 100%;
            overflow-x: auto;
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <%
		String select = request.getParameter("pageChange");
	%>

    <div class="scroll">
		
		
		<!--메인 헤더와 코드 중복으로 주석처리-->
		<!-- 
        <header>
                <div class="content">
                    <div class="logo">
                        <img src="./resources/img/jjobkorea_logo.png">
                    </div>
                    <div class="head-nav">
                        <ul>
                            <img src="./resources/img/resume_img_page/membername.png">
                            <li><a href="#">회원명</a></li>
                            <img src="./resources/img/resume_img_page/logout.png">
                            <li><a href="#">로그아웃</a></li>
                        </ul>
                    </div> 
                </div>
            </header>
			-->
			
			
			
			
            <!-- L-sidebar -->
            <jsp:include page="L-sidebar.jsp"></jsp:include>
            <!-- end L-sidebar -->
            
            <!-- R-sidebar -->
            
            <jsp:include page="R-sidebar.jsp"></jsp:include>
            <!-- end R-sidebar -->
            
            <!-- center -->
            <jsp:include page="center.jsp"></jsp:include>
            <!-- end center -->
            
            <!-- content -->
            <jsp:include page="content.jsp"></jsp:include>
            <!-- end content -->

             <!-- footer -->
            <jsp:include page="footer.jsp"></jsp:include>
            <!-- end footer -->
        </div>
        </body>
        </html>