<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 추가</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">기업 추가</h1>
        <form action="/companies/add" method="post" class="mt-3">
            <div class="form-group">
                <label for="cpId">기업 ID</label>
                <input type="text" class="form-control" id="cpId" name="cpId" required>
            </div>
            <div class="form-group">
                <label for="adminId">관리자 ID</label>
                <input type="text" class="form-control" id="adminId" name="adminId" required>
            </div>
            <div class="form-group">
                <label for="cpName">이름</label>
                <input type="text" class="form-control" id="cpName" name="cpName" required>
            </div>
            <div class="form-group">
                <label for="ceoName">CEO 이름</label>
                <input type="text" class="form-control" id="ceoName" name="ceoName" required>
            </div>
            <div class="form-group">
                <label for="cpTel">연락처</label>
                <input type="text" class="form-control" id="cpTel" name="cpTel" required>
            </div>
            <div class="form-group">
                <label for="cpAddress">주소</label>
                <input type="text" class="form-control" id="cpAddress" name="cpAddress" required>
            </div>
            <div class="form-group">
                <label for="cpEmail">이메일</label>
                <input type="email" class="form-control" id="cpEmail" name="cpEmail" required>
            </div>
            <div class="form-group">
                <label for="cpType">유형</label>
                <input type="text" class="form-control" id="cpType" name="cpType" required>
            </div>
            <div class="form-group">
                <label for="regDate">등록일</label>
                <input type="datetime-local" class="form-control" id="regDate" name="regDate" required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">추가</button>
        </form>
    </div>
</body>
</html>
