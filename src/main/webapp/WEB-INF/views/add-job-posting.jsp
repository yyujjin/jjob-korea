<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 정보 입력</title>
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.css' />" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-floating {
            margin-bottom: 1rem;
        }

        .form-floating input,
        .form-floating textarea,
        .form-floating select {
            width: 100%;
            padding: 1rem 0.5rem;
        }

        .form-floating label {
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
            <!-- 채용 정보 섹션 -->
            <div class="card mb-4">
                <div class="card-header">채용 정보</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="채용 제목" required>
                                <label for="jobTitle" class="required">채용 제목</label>
                            </div>
                            <div class="form-floating">
                                <textarea class="form-control" id="jobRequirements" name="jobRequirements" placeholder="채용 요구사항" rows="4" required></textarea>
                                <label for="jobRequirements" class="required">채용 요구사항</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="employmentType" name="employmentType" placeholder="고용 형태" required>
                                <label for="employmentType" class="required">고용 형태</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="salary" name="salary" placeholder="급여" required>
                                <label for="salary" class="required">급여</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control" id="location" name="location" placeholder="근무지" required>
                                <label for="location" class="required">근무지</label>
                            </div>
                            <div class="form-floating">
                                <input type="date" class="form-control" id="applicationDeadline" name="applicationDeadline" placeholder="지원 마감일" required>
                                <label for="applicationDeadline" class="required">지원 마감일</label>
                            </div>
                            <div class="form-floating">
                                <input type="email" class="form-control" id="contactEmail" name="contactEmail" placeholder="연락처 이메일" required>
                                <label for="contactEmail" class="required">연락처 이메일</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating" style="height: 100%;">
                                <textarea class="form-control" id="jobDescription" name="jobDescription" placeholder="채용 설명" rows="20" required></textarea>
                                <label for="jobDescription" class="required">채용 설명</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 제출 버튼 추가 -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">제출</button>
            </div>
        </form>
    </div>

    <script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
    <script src="<c:url value='/resources/css/bootstrap/bootstrap.js' />"></script>
</body>
</html>
