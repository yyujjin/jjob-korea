<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>메인 페이지 헤더</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
        />
        <!-- 글꼴 설정 -->
        <link
            href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
            rel="stylesheet"
        />
        <style>
            .navigation {
                font-family: "NanumBarunGothicBold";
				font-size: 18px;
            }
        </style>
    </head>
    <body>
        <header class="p-0  text-bg-white">
            <div class="container" >
                <div
                    class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start my-0 "
                >
				<!--/requestPage/main/main-content 이런식으로 경로 하려니까 요청 경로 자체가 바껴서 컨트롤러 단에서 해줘야 함 --> 
                    <a
                        href="/requestPage/main"
                        class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none"
                    >
                        <svg
                            class="bi me-2"
                            width="220"
                            height="220"
                            role="img"
                            aria-label="Bootstrap"
                        >
                            <image
                                href="../../resources/img/jjobkorea_logo.png"
                                x="0"
                                y="0"
                                width="220"
                                height="220"
                            />
                        </svg>
                    </a>
                    <form
                        class="col-12 col-lg-6 mb-3 mb-lg-0 me-lg-3 border border-primary border-2 rounded"
                        role="search"
                    >
                        <input
                            type="search"
                            class="form-control"
                            placeholder="#백엔드 채용"
							autofocus
                            aria-label="Search"
                        />
                    </form>
                </div>
                <div class="container">
                    <div
                        class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start "
                    >
                        <ul
                            class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-start mb-md-0 navigation"
                        >
                            <li>
                                <a href="/requestPage/jobPosting" class="nav-link px-4 text-dark"
                                    >채용 정보</a
                                >
                            </li>
                            <li>
                                <a href="/requestPage/jobSeekerBoard" class="nav-link px-4 text-dark"
                                    >취업 톡톡
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-4 text-dark"
                                    >이력서 등록</a
                                >
                            </li>
                            <li>
                                <a href="#" class="nav-link px-4 text-dark"
                                    >공고 등록</a
                                >
                            </li>
                        </ul>

                        <div class="text-end">
                            <ul class="nav">
                                <li class="nav-item"><a href="/requestPage/login" class="nav-link link-body-emphasis px-2 text-secondary">로그인</a></li>
                                <li class="nav-item"><a href="/requestPage/register" class="nav-link link-body-emphasis px-2 text-secondary">회원가입</a></li>
                              </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
    ></script>
</html>