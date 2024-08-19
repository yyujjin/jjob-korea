<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<!-- jstl을 사용하기 위한 라이브러리 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
     <link rel="stylesheet" href="../../resources/css/main/main.css" />
</head>
<body>
<div class="container">
    <div class="header">
        <jsp:include page="main-header.jsp"/>
    </div>
    <div class="content">
        <c:choose>
            <c:when test="${page != null && !page.isEmpty()}">
                <jsp:include page="/WEB-INF/views/${page}.jsp"/>
            </c:when>
            <c:otherwise>
                <!--페이지 요청이 없을 때 main컨텐츠 표시-->
                <jsp:include page="/WEB-INF/views/main/main-content.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="footer">
        <jsp:include page="main-footer.jsp"/>
    </div>
</div>
</body>

</html>


