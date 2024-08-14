<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>채용 공고 추가</title>
                <!-- Bootstrap CSS -->
                <link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css' />" rel="stylesheet">
                <style>
                    body {
                        background-color: #f4f7fa;
                        padding: 2rem;
                        font-family: 'Arial', sans-serif;
                    }

                    .container-fixed {
                        max-width: 900px;
                        margin: 0 auto;
                    }

                    .card {
                        margin-bottom: 1.5rem;
                        border-radius: 8px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        background-color: #fff;
                        padding: 1.5rem;
                    }

                    .section-title {
                        font-size: 1.25rem;
                        font-weight: bold;
                        color: #007bff;
                        border-bottom: 2px solid #007bff;
                        padding-bottom: 0.75rem;
                        margin-bottom: 1.5rem;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }

                    .form-floating {
                        margin-bottom: 1rem;
                    }

                    .form-floating input,
                    .form-floating textarea,
                    .form-floating select {
                        padding: 1rem;
                        border-radius: 5px;
                        height: auto;
                    }

                    .form-floating label {
                        font-size: 0.9rem;
                        color: #495057;
                    }

                    .required::after {
                        content: "*";
                        color: red;
                    }

                    .btn-primary {
                        padding: 0.75rem 1.5rem;
                        font-size: 1rem;
                        font-weight: bold;
                        background-color: #007bff;
                        border-color: #007bff;
                        border-radius: 5px;
                    }

                    .btn-primary:hover {
                        background-color: #0056b3;
                        border-color: #004085;
                    }
                </style>
            </head>

            <body>
                <div class="container-fixed mt-5">
                    <h2 class="text-center mb-4">채용 공고 등록</h2>
                    <form action="<c:url value='/addJobPosting' />" method="post" enctype="multipart/form-data">
                        <!-- 회사 정보 섹션 -->
                        <div class="card">
                            <div class="section-title">회사 소개</div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="companyName" name="companyName"
                                    placeholder="회사명" value="${signupCp.companyName}" readonly>
                                <label for="companyName" class="required">회사이름</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="representative" name="representative"
                                    placeholder="대표자" value="${signupCp.representative}" readonly>
                                <label for="representative" class="required">대표자</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="companyAddr" name="companyAddr"
                                    placeholder="주소" value="${signupCp.companyAddr}" readonly>
                                <label for="companyAddr" class="required">주소</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="companySize" name="companySize"
                                    placeholder="기업 규모" value="${signupCp.companySize}" readonly>
                                <label for="companySize" class="required">기업 규모</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="industry" name="industry" placeholder="업종">
                                <label for="industry" class="required">업종</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="employeeCount" name="employeeCount"
                                    placeholder="직원 수">
                                <label for="employeeCount" class="required">직원 수</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="establishedYear" name="establishedYear"
                                    placeholder="설립년도">
                                <label for="establishedYear" class="required">설립년도</label>
                            </div>
                        </div>

                        <!-- 근무 조건 섹션 -->
                        <div class="card">
                            <div class="section-title">근무 조건</div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="employmentType" name="employmentType"
                                    placeholder="고용 형태">
                                <label for="employmentType">고용 형태</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="직무">
                                <label for="jobTitle">직무</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="location" name="location"
                                    placeholder="근무 지역">
                                <label for="location">근무 지역</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="experience" name="experience"
                                    placeholder="경력 여부">
                                <label for="experience">경력 여부</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="closingDate" name="closingDate"
                                    placeholder="채용 마감 날짜">
                                <label for="closingDate">채용 마감 날짜</label>
                            </div>
                        </div>
                        <!-- 회사 로고 및 채용 공고 이미지 업로드 -->
                        <div class="card">
                            <div class="card-header section-title">이미지 업로드</div>
                            <div class="card-body">
                                <div class="form-floating">
                                    <input type="file" class="form-control" id="companyLogo" name="companyLogo">
                                    <label for="companyLogo">회사 로고</label>
                                </div>
                                <div class="form-floating">
                                    <input type="file" class="form-control" id="jobPostingImage" name="jobPostingImage">
                                    <label for="jobPostingImage">채용 공고 이미지</label>
                                </div>
                                <div class="form-floating">
                                    <input type="file" class="form-control" id="additionalImages"
                                        name="additionalImages" multiple>
                                    <label for="additionalImages">추가 이미지</label>
                                </div>
                            </div>
                        </div>
                        <!-- 제출 버튼 -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary mt-4">제출</button>
                        </div>
                    </form>
                </div>

                <!-- jQuery -->
                <script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
                <!-- Bootstrap JS -->
                <script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js' />"></script>
            </body>

            </html>