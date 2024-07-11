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
        .filter-box-ul{
            border: solid black 1px;
            width: 100%;
            height: 100px;
            border-color:#eceff7 ;
            display: flex;
            flex-direction: row; /* 수평으로 배치 */
            padding: 0; /* 내부 패딩 제거 */
        }
        .filter-box-ul li{
            list-style-type: none;
            color: #6db6ff;
            padding: 5px 10px; /* 각 요소의 패딩 설정 */
            flex-wrap: wrap; /* 자동 줄 바꿈 설정 */
        }
        .delete-button {
            color: #d2d2d3;
            border: none;
            background-color: #ffffff;
        }
        
    </style>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous"
    />
	<script src="../../resources/js/jobPosting/searchFilter.js" defer></script> <!--js연결-->
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
                        <ul class="dropdown-menu dropdown-menu-white job-title">
                            <li class="filter" id="프론트엔드">
                               프론트엔드
                            </li>
                            <li class="filter" id="백엔드">
                                백엔드
                            </li>
                            <li class="filter" id="풀스택">
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
                        <ul class="dropdown-menu dropdown-menu-white work-location">
                            <li class="filter" id="서울">
                                서울특별시
                            </li>
                            <li class="filter" id="부산">
                                부산광역시
                            </li>
                            <li class="filter" id="대구">
                                대구광역시
                            </li>
                            <li class="filter" id="인천">
                                인천광역시
                            </li>
                            <li class="filter" id="광주">
                                광주광역시
                            </li>
                            <li class="filter" id="대전">
                                대전광역시
                            </li>
                            <li class="filter" id="울산">
                               울산광역시
                            </li>
                            <li class="filter" id="세종">
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
                        <ul class="dropdown-menu dropdown-menu-white employment-type">
                            <li class="filter" id="정규직">
                               정규직
                            </li>
                            <li class="filter" id="계약직">
                                계약직
                            </li>
                            <li class="filter" id="인턴">
                                인턴
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="filter-box">
    <ul class="filter-box-ul"></ul>
    </div>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
    ></script>
</body>
</html>