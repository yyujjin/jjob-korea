<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 정보</title>
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.css' />" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">채용 정보</h2>
        <div class="card mb-4">
            <div class="card-header">채용 정보 목록</div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>채용 제목</th>
                            <th>채용 설명</th>
                            <th>채용 요구사항</th>
                            <th>고용 형태</th>
                            <th>급여</th>
                            <th>근무지</th>
                            <th>지원 마감일</th>
                            <th>연락처 이메일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobPosting" items="${jobPostings}">
                            <tr>
                                <td>${jobPosting.jobTitle}</td>
                                <td>${jobPosting.jobDescription}</td>
                                <td>${jobPosting.jobRequirements}</td>
                                <td>${jobPosting.employmentType}</td>
                                <td>${jobPosting.salary}</td>
                                <td>${jobPosting.location}</td>
                                <td>${jobPosting.applicationDeadline}</td>
                                <td>${jobPosting.contactEmail}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">회사 정보 목록</div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>회사 유형</th>
                            <th>사업자 등록 번호</th>
                            <th>회사 이름</th>
                            <th>대표자 이름</th>
                            <th>회사 주소</th>
                            <th>사업자 등록</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="company" items="${signupCpList}">
                            <tr>
                                <td>${company.companyType}</td>
                                <td>${company.companyRegistrationNum}</td>
                                <td>${company.companyName}</td>
                                <td>${company.companyRepresentativeName}</td>
                                <td>${company.companyAddr}</td>
                                <td>${company.companyBusinessRegistration}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
    <script src="<c:url value='/resources/css/bootstrap/bootstrap.js' />"></script>
</body>
</html>
