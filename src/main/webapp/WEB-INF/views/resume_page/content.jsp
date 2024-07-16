<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resume Management</title>
</head>
<body>
    <h1>Resume Management Page</h1>
    <form action="${pageContext.request.contextPath}/resume" method="post">
        <label for="resumePageTitle">Title:</label>
        <input type="text" id="resumePageTitle" name="resumePageTitle" required><br>


        <button type="submit">Add Resume</button>
    </form>
    <h2>Existing Resumes</h2>
    <c:choose>
        <c:when test="${empty resumes}">
            <p>등록된 이력서가 없습니다.</p>
        </c:when>
        <c:otherwise>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User ID</th>
                        <th>Title</th>
                        <th>Write Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="resume" items="${resumes}">
                        <tr>
                            <td>${resume.id}</td>
                            <td>${resume.resumePageUserId}</td>
                            <td>${resume.resumePageTitle}</td>
                            <td>${resume.resumePageWriteDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>
