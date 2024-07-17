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
    <form action="${pageContext.request.contextPath}/resume" method="post">
        <c:choose>
            <c:when test="${empty resumes}">
                <p>등록된 이력서가 없습니다.</p>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="resume" items="${resumes}">
                            <tr>
                                <td>${resume.id}</td>
                                <td>${resume.resumePageTitle}</td>
                                <td><button>수정</button></td>
                                <td><button>삭제</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </form>
    </body>
    </html>
    