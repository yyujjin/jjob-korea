<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!-- jstl을 사용하기 위한 라이브러리 추가 -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <html lang="UTF-8">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>메인 페이지 헤더</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous" />
            <!-- 글꼴 설정 -->
            <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet" />
            <style>
                .navigation {
                    font-family: "NanumBarunGothicBold";
                    font-size: 18px;
                }

                .log-container {
                    margin-left: 380px;
                }

                .nav .form {
                    display: inline-block;
                    margin: 5px;
                    /* 여백이 균일하게 유지되도록 설정 */
                }

                .nav .form a {
                    display: block;
                    text-decoration: none;
                    border: solid 4px white;
                    color: #000;
                    padding: 10px;
                    /* 패딩을 사용하여 클릭 영역 확대 */
                    transition: background-color 0.3s;
                    /* 배경색 전환에 대한 부드러운 전환 효과 */
                }

                .nav .form a:hover {
                    border: solid 4px blue;
                }
                .nav-item{
                    margin-left: 10px;
                }
            </style>
        </head>

        <body>
            <header class="p-0 text-bg-white">
                <div class="container">
                    <div class="d-flex flex-wrap align-items-center ">
                        <a href="/"
                            class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none">
                            <img src="../../resources/img/jjobkorea_logo.png" alt="Logo" width="220" height="110" />
                        </a>

                        <c:set var="userType" value="${user.userType}" />

                        <div class="nav col-12 col-lg-auto mb-2 justify-content:flex-start mb-md-0 navigation">
                            <div class="form">
                                <a href="/jobPosts" class="nav-link px-4 text-dark">채용 정보</a>
                            </div>
                            <div class="form">
                                <a href="/board" class="nav-link px-4 text-dark">취업 톡톡</a>
                            </div>

                            <c:choose>
                                <c:when test="${sessionScope.user.userType == 1}">
                                    <div class="form">
                                        <a href="/resume" class="nav-link px-4 text-dark">이력서 등록</a>
                                    </div>
                                </c:when>

                                <c:when test="${sessionScope.user.userType == 2}">
                                    <div class="form">
                                        <a href="/jobPost/new" class="nav-link px-4 text-dark">공고
                                            등록</a>
                                    </div>
                                </c:when>

                            </c:choose>


                            <div class="text-end log-container">
                                <ul class="nav" style="font-size: 14px;">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.user.name}">
                                            <li class="nav-item">
                                                <span class="nav-link" style="color: black;">
                                                    안녕하세요! 
                                                    <a style="color: blue; text-decoration: underline;"> 
                                                        ${sessionScope.user.name} 
                                                    </a> 님
                                                </span>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/user" class="nav-link link-body-emphasis px-2 text-secondary">회원정보
                                                    수정</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/logout"
                                                    class="nav-link link-body-emphasis px-2 text-secondary">로그아웃</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="nav-item">
                                                <a href="/login"
                                                    class="nav-link link-body-emphasis px-2 text-secondary">로그인</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/register"
                                                    class="nav-link link-body-emphasis px-2 text-secondary">회원가입</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

        </html>