<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 기업 추가</title>
<link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css' />" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>새 기업 추가</h1>
        <form action="<c:url value='/companies' />" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="manager">관리자</label>
                <select class="form-control" id="manager" name="manager.id" required>
                    <c:forEach var="manager" items="${managers}">
                        <option value="${manager.id}">${manager.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">저장</button>
            <a href="<c:url value='/companies' />" class="btn btn-secondary">취소</a>
        </form>
        <a href="<c:url value='/mainkth' />" class="btn btn-secondary mt-3">메인 페이지로</a>
    </div>
    <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
    <script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js' />"></script>
</body>
</html>
