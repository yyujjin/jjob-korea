<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="./resources/css/resume_css/footer.css">
    <link rel="stylesheet" href="./resources/css/resume_css/center.css">
    <title>Document</title>
</head>
<body>
    <div class="main-container">
        <header>
            <a href="#3">
                <img class="img" src="./resources/img/resume_img_page/advertisement.png">
                <div class="under-line"></div>
            </a>
        </header>
        <div class="content">
            <div class="wrap">
                <ul>
                    <a href="#1"><li>이력서 관리</li></a>
                    <div class="v-line"></div>
                    <a href="#2"><li>첨부파일 관리</li></a>
                </ul>
                <div class="resume">
                    <a id="rsjoin" href="<%=request.getContextPath()%>/resume_write"><li>이력서 등록</li></a>
                </div>
                <div class="resumesave">
                    <div id="resumetitle">
                        <ul>
                            <li>이력서 제목</li>
                            <li>이력서 관리</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <p>입사지원을 한 후 해당 이력서의 내용을 수정해도 이전에 지원한 이력서의 내용은 바뀌지 않으므로 
            회사마다 이력서 내용을 다르게 지원할 수 있습니다.</p>
        </footer>
    </div>
</body>
</html>
