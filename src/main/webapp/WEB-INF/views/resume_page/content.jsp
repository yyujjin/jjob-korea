<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resume Management</title>
</head>
<body>
    <c:choose>
        <c:when test="${empty resumes}">
            <p>등록된 이력서가 없습니다.</p>
        </c:when>
        <c:otherwise>
            <table>
                <tbody>
                    <c:forEach var="resume" items="${resumes}">
                        <tr>
                            <td>${resume.id}</td>
                            <td>${resume.resumePageTitle}</td>
                            <td>
                                <!-- 수정 버튼 폼 -->
                                <form action="${pageContext.request.contextPath}/resume_write/edit" method="get" style="display:inline;">
                                    <input type="hidden" name="id" value="${resume.id}">
                                    <button type="submit">수정</button>
                                </form>
                                <!-- 삭제 버튼 폼 -->
                                <form action="${pageContext.request.contextPath}/resume/delete" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${resume.id}">
                                    <button type="submit">삭제</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>

    