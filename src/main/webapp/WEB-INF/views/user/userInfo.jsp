<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <!-- jQuery 라이브러리 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <!-- CSS 스타일 시트 -->
    <link rel="stylesheet" href="../../resources/css/user/userInfo.css" />
    <!-- JavaScript 파일 -->
    <script src="../../resources/js/user/userInfo.js" defer></script>
</head>

<body>
    <div class="mypage">
        <h2 style="margin-bottom: 50px;">회원 정보 수정</h2>
        <form id="user-info-form" method="post" action="/user/update">
            <div class="form-group">
                <label for="userId">User ID :</label>
                <input type="text" id="userId" name="userId" value="${userInfo.userId}" readonly>
            </div>
            <div class="form-group">
                <label for="name">Name :</label>
                <input type="text" id="name" name="name" value="${userInfo.name}">
            </div>
            <div class="form-group">
                <label for="phone">Phone :</label>
                <input type="text" id="phone" name="phone" value="${userInfo.phone}">
            </div>
            <div class="form-group">
                <label for="addr">Address :</label>
                <input type="text" id="addr" name="addr" value="${userInfo.addr}">
            </div>
            <div class="form-group">
                <label for="email">Email :</label>
                <input type="text" id="email" name="email" value="${userInfo.email}">
            </div>
            <div class="form-group">
                <label for="birthd">Birthdate :</label>
                <input type="text" id="birthd" name="birthd" value="${userInfo.birthd}">
            </div>
            <div class="form-group">
                <label for="gender">Gender :</label>
                <input type="text" id="gender" name="gender" value="${userInfo.gender}">
            </div>
            <div class="btn-group">
                <button type="submit" class="submit">수정하기</button>
                <button type="button" class="cancle-button" onclick="window.history.back()">취소</button>
                <button type="button" class="delete-button" onclick="deleteUser()">탈퇴하기</button>
            </div>
        </form>
    </div>
</body>

</html>
