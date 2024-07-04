<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 목록</title>
<link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css' />" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>기업 목록</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>관리자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="company" items="${companies}">
                    <tr>
                        <td>${company.id}</td>
                        <td>${company.name}</td>
                        <td>${company.address}</td>
                        <td>${company.manager.name}</td>
                        <td><a href="<c:url value='/companies/${company.id}' />" class="btn btn-primary">보기</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value='/companies/new' />" class="btn btn-success">새 기업 추가</a>
        <a href="<c:url value='/mainkth' />" class="btn btn-secondary">메인 페이지로</a>
    </div>
    <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
    <script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js' />"></script>
</body>
</html>
