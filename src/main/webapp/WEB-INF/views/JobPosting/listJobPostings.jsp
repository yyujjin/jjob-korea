<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채용 공고 목록</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">채용 공고 목록</h1>
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>기업 이름</th>
                    <th>직무</th>
                    <th>직무 상세</th>
                    <th>직무 유형</th>
                    <th>직무 위치</th>
                    <th>시작일</th>
                    <th>종료일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="jobPosting" items="${jobPostings}">
                    <tr>
                        <td>${jobPosting.cpName}</td>
                        <td>${jobPosting.jobTitle}</td>
                        <td>${jobPosting.jobDetail}</td>
                        <td>${jobPosting.jobType}</td>
                        <td>${jobPosting.jobLocation}</td>
                        <td>${jobPosting.startDate}</td>
                        <td>${jobPosting.endDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-primary" onclick="location.href='/addJobPosting'">채용 공고 추가</button>
    </div>
</body>
</html>
