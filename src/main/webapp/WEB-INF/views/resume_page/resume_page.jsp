<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/resume_css/resume_css.css">
</head>
<body>
    <%
    String select = request.getParameter("pageChange");
	%>
        <div class="container2">
            <div class="L-sidebar">
            <jsp:include  page="L-sidebar.jsp"></jsp:include>
        </div>
        <div class="R-sidebar">
            <jsp:include page="R-sidebar.jsp"></jsp:include>
        </div>
        <div class="center">
            <img class="img" src = "${pageContext.request.contextPath}/resources/img/resume_img_page/advertisement.png">
            <div class="under-line"></div>
            <jsp:include page="center.jsp"></jsp:include>
        </div>
		<div class="content2">
			<jsp:include page="content.jsp"></jsp:include>
		</div>
        <div class="resume_footer">
            <jsp:include page="resume_footer.jsp"></jsp:include>
        </div>
    </div>
    </body>
    </html>