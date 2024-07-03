<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채용 공고 추가</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">채용 공고 추가</h1>
        <form action="/jobPostings" method="post" class="mt-3">
            <div class="form-group">
                <label for="cpId">기업</label>
                <select class="form-control" id="cpId" name="cpId" required>
                    <c:forEach var="company" items="${companies}">
                        <option value="${company.cpId}">${company.cpName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="adminId">관리자 ID</label>
                <input type="text" class="form-control" id="adminId" name="adminId" required>
            </div>
            <div class="form-group">
                <label for="jobTitle">직무</label>
                <input type="text" class="form-control" id="jobTitle" name="jobTitle" required>
            </div>
            <div class="form-group">
                <label for="jobDetail">직무 상세</label>
                <input type="text" class="form-control" id="jobDetail" name="jobDetail" required>
            </div>
            <div class="form-group">
                <label for="jobType">직무 유형</label>
                <input type="text" class="form-control" id="jobType" name="jobType" required>
            </div>
            <div class="form-group">
                <label for="jobLocation">직무 위치</label>
                <input type="text" class="form-control" id="jobLocation" name="jobLocation" required>
            </div>
            <div class="form-group">
                <label for="startDate">시작일</label>
                <input type="datetime-local" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">종료일</label>
                <input type="datetime-local" class="form-control" id="endDate" name="endDate" required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">추가</button>
        </form>
    </div>
</body>
</html>
