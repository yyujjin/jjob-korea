<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resume Management</title>
    <script type="text/javascript">
        // 이력서 등록 후 localStorage를 지우는 스크립트
        <c:if test="${not empty clearLocalStorage}">
            localStorage.removeItem('resumeData');
        </c:if>
    </script>
</head>
<body>
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
                                <td>
                                    <form action="${pageContext.request.contextPath}/resume_write/edit" method="get" style="display:inline;">
                                        <input type="hidden" name="id" value="${resume.id}">
                                        <button type="submit">수정</button>
                                    </form>
                                </td>
                                <td>
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
    </form>
</body>
</html>
