<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <style>
        .mypage {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            margin-right: 10px;
        }
        input[type="text"] {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button[type="submit"] {
            padding: 10px 20px;
            background-color: #0057ff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0047d4;
        }
        button.cancle-button {
            padding: 10px 20px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
        button.cancle-button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <div class="mypage">
        <h2>회원 정보 수정</h2>
        <form id="user-info-form" method="post" action="/user/update">
            <div class="form-group">
                <label for="userId">User ID:</label>
                <input type="text" id="userId" name="userId" value="${userInfo.userId}" readonly>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${userInfo.name}">
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="${userInfo.phone}">
            </div>
            <div class="form-group">
                <label for="addr">Address:</label>
                <input type="text" id="addr" name="addr" value="${userInfo.addr}">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="${userInfo.email}">
            </div>
            <div class="form-group">
                <label for="birthd">Birthdate:</label>
                <input type="text" id="birthd" name="birthd" value="${userInfo.birthd}">
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender" value="${userInfo.gender}">
            </div>
            <button type="submit" class="submit">수정하기</button>
            <button type="button" class="cancle-button" onclick="window.history.back()">취소</button>
        </form>
    </div>
</body>
</html>
