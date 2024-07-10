<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 정보 상세</title>
    <!-- Bootstrap CSS -->
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.css' />" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .container {
            max-width: 800px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">채용 정보 상세</h2>

        <!-- 회사 정보 -->
        <div class="card mb-4">
            <div class="card-header">회사 정보</div>
            <div class="card-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th>회사명</th>
                            <td>${signupCp.companyName}</td>
                        </tr>
                        <tr>
                            <th>회사 유형</th>
                            <td>${signupCp.companyType}</td>
                        </tr>
                        <tr>
                            <th>등록 번호</th>
                            <td>${signupCp.companyRegistrationNum}</td>
                        </tr>
                        <tr>
                            <th>대표명</th>
                            <td>${signupCp.companyRepresentativeName}</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>${signupCp.companyAddr}</td>
                        </tr>
                        <tr>
                            <th>사업자 등록번호</th>
                            <td>${signupCp.companyBusinessRegistration}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 채용 정보 -->
        <div class="card mb-4">
            <div class="card-header">채용 정보</div>
            <div class="card-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th>채용 제목</th>
                            <td>${jobPostingDetail.jobTitle}</td>
                        </tr>
                        <tr>
                            <th>채용 설명</th>
                            <td>${jobPostingDetail.jobDescription}</td>
                        </tr>
                        <tr>
                            <th>채용 요구사항</th>
                            <td>${jobPostingDetail.jobRequirements}</td>
                        </tr>
                        <tr>
                            <th>고용 형태</th>
                            <td>${jobPostingDetail.employmentType}</td>
                        </tr>
                        <tr>
                            <th>급여</th>
                            <td>${jobPostingDetail.salary}</td>
                        </tr>
                        <tr>
                            <th>근무지</th>
                            <td>${jobPostingDetail.location}</td>
                        </tr>
                        <tr>
                            <th>지원 마감일</th>
                            <td>${jobPostingDetail.applicationDeadline}</td>
                        </tr>
                        <tr>
                            <th>연락처 이메일</th>
                            <td>${jobPostingDetail.contactEmail}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
    <!-- Bootstrap JS -->
    <script src="<c:url value='/resources/css/bootstrap/bootstrap.js' />"></script>
</body>
</html>
