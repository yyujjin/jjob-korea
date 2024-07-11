<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Companies List</title>
</head>
<body>
    <h1>Companies List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Company Type</th>
            <th>Registration Number</th>
            <th>Company Name</th>
            <th>Representative Name</th>
            <th>Address</th>
            <th>Business Registration</th>
        </tr>
        <c:forEach var="company" items="${companies}">
            <tr>
                <td>${company.id}</td>
                <td>${company.companyType}</td>
                <td>${company.companyRegistrationNum}</td>
                <td>${company.companyName}</td>
                <td>${company.companyRepresentativeName}</td>
                <td>${company.companyAddr}</td>
                <td>${company.companyBusinessRegistration}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
