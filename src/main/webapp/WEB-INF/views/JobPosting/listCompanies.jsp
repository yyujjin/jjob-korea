<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 목록</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">기업 목록</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>기업 ID</th>
                    <th>이름</th>
                    <th>CEO 이름</th>
                    <th>연락처</th>
                    <th>주소</th>
                    <th>이메일</th>
                    <th>유형</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="company" items="${companies}">
                    <tr>
                        <td>${company.cpId}</td>
                        <td>${company.cpName}</td>
                        <td>${company.ceoName}</td>
                        <td>${company.cpTel}</td>
                        <td>${company.cpAddress}</td>
                        <td>${company.cpEmail}</td>
                        <td>${company.cpType}</td>
                        <td>${company.regDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
