<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
		<!--절대 경로로 변경 -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
        <a href="#3">
            <div class="under-line"></div>
        </a>
    </head>
    <body>
            <div class="wrap">
                    <a class="resume_mng" href="#1">이력서 관리</a>
                    <div class="v-line"></div>
                    <a class="file_mng" href="#2">첨부파일 관리</a>
                <div class="resume">
                    <a id="rsjoin" href="<%=request.getContextPath()%>/resume/create">이력서 등록</a>
                </div>
                <div class="resumesave">
                    <div class="resumetitle">
                        <ul>
                            <li>이력서 제목</li>
                        </ul>
                        <ul>
                            <li>이력서 관리 </li>
                        </ul>
                    </div>
                </div>
            </div>
    </body>
</html>
