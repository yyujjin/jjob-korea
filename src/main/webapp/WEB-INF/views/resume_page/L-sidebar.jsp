<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<!--절대경로로 변경-->
</head>
<body>
    <sidebar>
		<div>
			<ul>
                <h3>이력서 관리</h3>
				<div class="underbar-line"></div>
				<p><li><a href="<%=request.getContextPath()%>/resume/create">이력서 등록</a></li><br>
				<li><a href="#">이력서 현황</a></li><br>
				<li><a href="#">첨부파일 관리</a></li></p>
			</ul>
		</div>
	</sidebar>
</body>
</html>