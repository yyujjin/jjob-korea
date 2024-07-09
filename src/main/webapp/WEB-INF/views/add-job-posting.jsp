<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 정보 입력</title>
    <!-- Bootstrap CSS -->
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.css' />" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 0.5rem;
        }
        .form-group label {
            font-size: 0.85rem;
            color: #6c757d;
        }
        .required::after {
            content: "*";
            color: red;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">채용 정보 입력</h2>
        <form action="/jobPostingDetail" method="POST">
            <div class="card mb-4">
                <div class="card-header">채용 정보</div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="jobTitle" class="required">채용 제목</label>
                        <input type="text" class="form-control" id="jobTitle" name="jobTitle" required>
                    </div>
                    <div class="form-group">
                        <label for="jobDescription" class="required">채용 설명</label>
                        <textarea class="form-control" id="jobDescription" name="jobDescription" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="jobRequirements" class="required">채용 요구사항</label>
                        <textarea class="form-control" id="jobRequirements" name="jobRequirements" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="employmentType" class="required">고용 형태</label>
                        <input type="text" class="form-control" id="employmentType" name="employmentType" required>
                    </div>
                    <div class="form-group">
                        <label for="salary" class="required">급여</label>
                        <input type="text" class="form-control" id="salary" name="salary" required>
                    </div>
                    <div class="form-group">
                        <label for="location" class="required">근무지</label>
                        <input type="text" class="form-control" id="location" name="location" required>
                    </div>
                    <div class="form-group">
                        <label for="applicationDeadline" class="required">지원 마감일</label>
                        <input type="date" class="form-control" id="applicationDeadline" name="applicationDeadline" required>
                    </div>
                    <div class="form-group">
                        <label for="contactEmail" class="required">연락처 이메일</label>
                        <input type="email" class="form-control" id="contactEmail" name="contactEmail" required>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">제출</button>
            </div>
        </form>
    </div>
    <script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
    <script src="<c:url value='/resources/css/bootstrap/bootstrap.js' />"></script>
</body>
</html>
