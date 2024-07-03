<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 추가</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">관리자 추가</h1>
        <form action="addAdmin" method="post" class="mt-3">
            <div class="form-group">
                <label for="adminId">관리자 ID</label>
                <input type="text" class="form-control" id="adminId" name="adminId" required>
            </div>
            <div class="form-group">
                <label for="adminName">이름</label>
                <input type="text" class="form-control" id="adminName" name="adminName" required>
            </div>
            <div class="form-group">
                <label for="adminEmail">이메일</label>
                <input type="email" class="form-control" id="adminEmail" name="adminEmail" required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">추가</button>
        </form>
    </div>
</body>
</html>
