<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dropdowns</title>
	<link
	           href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	           rel="stylesheet"
	       />
    <style>
        .navbar-nav {
            display: flex;
            gap: 80px; /* 드롭다운 사이의 간격 설정 */
			font-family: "NanumBarunGothicBold";  /* 글꼴 설정 */
			font-size: 18px;
        }

        .btn {
            width: 180px; /* 버튼의 너비를 150px로 설정 */
        }
    </style>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous"
    />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">채용공고 상세검색</a>
            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown"
                aria-controls="navbarNavDarkDropdown"
                aria-expanded="false"
                aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div
                class="collapse navbar-collapse"
                id="navbarNavDarkDropdown"
            >
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button
                            class="btn btn-Light dropdown-toggle"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            직무
                        </button>
                        <ul class="dropdown-menu dropdown-menu-white">
                            <li>
                               프론트엔드
                            </li>
                            <li>
                                백엔드
                            </li>
                            <li>
                               풀스택
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button
                            class="btn btn-Light dropdown-toggle"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            근무지역
                        </button>
                        <ul class="dropdown-menu dropdown-menu-white">
                            <li>
                                서울특별시
                            </li>
                            <li>
                                부산광역시
                            </li>
                            <li>
                                대구광역시
                            </li>
                            <li>
                                인천광역시
                            </li>
                            <li>
                                광주광역시
                            </li>
                            <li>
                                대전광역시
                            </li>
                            <li>
                               울산광역시
                            </li>
                            <li>
                                세종특별자치시
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button
                            class="btn btn-Light dropdown-toggle"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            기업형태
                        </button>
                        <ul class="dropdown-menu dropdown-menu-white">
                            <li>
                               대기업
                            </li>
                            <li>
                                중·소기업
                            </li>
                            <li>
                                스타트업
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button
                            class="btn btn-Light dropdown-toggle"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            고용형태
                        </button>
                        <ul class="dropdown-menu dropdown-menu-white">
                            <li>
                               정규직
                            </li>
                            <li>
                                계약직
                            </li>
                            <li>
                                인턴
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
    ></script>
</body>
</html>