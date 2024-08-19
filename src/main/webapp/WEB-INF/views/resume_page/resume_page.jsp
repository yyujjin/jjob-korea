<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/resume/resume_page.css">
    <script src="../../resources/js/resume/resume_page.js" defer></script>
</head>

<body>
    <div class="resume_all">
        <div class="resume_sidebar">
            <ul class="resume_slist flex-column">
                <li class="resume_stitle" style="font-weight: bold;">
                    이력서 관리
                </li>
                <li class="resume-item">
                    <a class="resume-link" href="<%=request.getContextPath()%>/resume/create">이력서 등록</a>
                </li>
                <li class="resume-item">
                    <a class="resume-link" href="#">이력서 리스트</a>
                </li>
                <li class="resume-item">
                    <a class="resume-link" href="#">첨부파일 관리</a>
                </li>
            </ul>
        </div>

        <div class="resume_detail">
            <div class="tabs">
                <div class="tab active" href="#1">이력서 관리</div>
                <div class="tab" href="#2">첨부파일 관리</div>
                <button id="add_resume_button" onclick="location.href='<%=request.getContextPath()%>/resume/create'">
                    이력서 등록
                </button>
            </div>

            <script type="text/javascript">
                // 이력서 등록 후 localStorage를 지우는 스크립트
                <c:if test="${not empty clearLocalStorage}">
                    localStorage.removeItem('resumeData');
                </c:if>
            </script>

            <ul class="resume_list">
                <c:choose>
                    <c:when test="${empty resumes}">
                        <p style="text-align: center;">등록된 이력서가 없습니다.</p>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <thead class="resume_title">
                                <tr>
                                    <td>이력서 제목</td>
                                    <td>이력서 관리</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="resume" items="${resumes}">
                                    <tr>
                                        <td>${resume.resumePageTitle}</td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/resume_write/edit" method="get" style="display:inline;">
                                                <input type="hidden" name="id" value="${resume.id}">
                                                <button type="submit">수정</button>
                                            </form>
                                            <form action="${pageContext.request.contextPath}/resume/delete" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${resume.id}">
                                                <button type="submit">삭제</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </ul>

            <div>
                <img class="resume_img" src="../../resources/img/이력서를부탁해.png" alt="이력서 이미지">
            </div>
        </div>
    </div>
</body>

</html>
