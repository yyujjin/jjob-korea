<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Job Posting List</title>
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.css' />" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Job Posting List</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>채용 제목</th>
                    <th>채용 설명</th>
                    <th>채용 요구사항</th>
                    <th>고용 형태</th>
                    <th>급여</th>
                    <th>근무지</th>
                    <th>지원 마감일</th>
                    <th>연락처 이메일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="jobPosting" items="${jobPostings}">
                    <tr>
                        <td><c:out value="${jobPosting.id}" /></td>
                        <td><c:out value="${jobPosting.jobTitle}" /></td>
                        <td><c:out value="${jobPosting.jobDescription}" /></td>
                        <td><c:out value="${jobPosting.jobRequirements}" /></td>
                        <td><c:out value="${jobPosting.employmentType}" /></td>
                        <td><c:out value="${jobPosting.salary}" /></td>
                        <td><c:out value="${jobPosting.location}" /></td>
                        <td><c:out value="${jobPosting.applicationDeadline}" /></td>
                        <td><c:out value="${jobPosting.contactEmail}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
    <script src="<c:url value='/resources/css/bootstrap/bootstrap.js' />"></script>
</body>
</html>
