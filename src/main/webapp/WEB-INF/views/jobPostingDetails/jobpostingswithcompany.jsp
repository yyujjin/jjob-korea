<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job Postings with Company</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Job Postings with Company</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Job ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Company ID</th>
                    <th>Company Name</th>
                    <th>Company Address</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="jobPosting" items="${jobPostings}">
                    <tr>
                        <td>${jobPosting.id}</td>
                        <td>${jobPosting.title}</td>
                        <td>${jobPosting.description}</td>
                        <td>${jobPosting.companyId}</td>
                        <td>${jobPosting.companyName}</td>
                        <td>${jobPosting.companyAddress}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>