<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 목록</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">관리자 목록</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>관리자 ID</th>
                    <th>이름</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="admin" items="${admins}">
                    <tr>
                        <td>${admin.adminId}</td>
                        <td>${admin.adminName}</td>
                        <td>${admin.adminEmail}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
