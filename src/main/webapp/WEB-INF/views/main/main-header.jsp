<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="UTF-8">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>메인 페이지 헤더</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous" />
    <link rel="stylesheet" href="../../resources/css/main/main-header.css" />
</head>
<body>
    <header class="p-0 text-bg-white">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none">
                    <img src="../../resources/img/jjobkorea_logo.png" alt="Logo" width="220" height="110" />
                </a>

                <c:set var="role" value="${role}" />

                <div class="nav col-12 col-lg-auto mb-2 justify-content:flex-start mb-md-0 navigation">
                    <div class="form">
                        <a href="/jobPosts?pageNum=1" class="nav-link px-4">채용 정보</a>
                    </div>
                    <div class="form">
                        <a href="/board" class="nav-link px-4">취업 톡톡</a>
                    </div>
                    <c:choose>
                        <c:when test="${role == 'ROLE_JOB_SEEKER'}">
                            <div class="form">
                                <a href="/resume" class="nav-link px-4">이력서 관리</a>
                            </div>
                        </c:when>
                        <c:when test="${role == 'ROLE_COMPANY_USER'}">
                            <div class="form">
                                <a href="/jobPost/create" class="nav-link px-4">공고 등록</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- 여기에 다른 조건의 링크를 추가할 수 있습니다. -->
                        </c:otherwise>
                    </c:choose>
                    <div class="text-end log-container">
                        <ul class="nav" style="font-size: 14px;">
                            <c:choose>
                                <c:when test="${not empty username}">
                                    <li class="nav-item">
                                        <span class="nav-link" style="color: black; font-weight: bold;">
                                            안녕하세요!
                                            <a style="color: blue; text-decoration: underline;">
                                                ${username}
                                            </a> 님
                                        </span>
                                    </li>
                                    <c:if test="${empty registrationId}">
                                        <li class="nav-item">
                                            <a href="/user" class="nav-link link-body-emphasis px-2 text-secondary">회원정보 수정</a>
                                        </li>
                                    </c:if>
                                    <li class="nav-item">
                                        <a href="/logout" class="nav-link link-body-emphasis px-2 text-secondary">로그아웃</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item">
                                        <a href="/login" class="nav-link link-body-emphasis px-2 text-secondary">로그인</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/register" class="nav-link link-body-emphasis px-2 text-secondary">회원가입</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>
