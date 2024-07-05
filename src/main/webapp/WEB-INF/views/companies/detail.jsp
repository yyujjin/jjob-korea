<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Company Details</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
</head>
<body>
    <div class="container">
        <h1>Company Details</h1>
        <p><strong>Name:</strong> ${company.name}</p>
        <p><strong>Address:</strong> ${company.address}</p>
        <h2>Job Postings</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${jobPostings}" var="jobPosting">
                    <tr>
                        <td>${jobPosting.id}</td>
                        <td>${jobPosting.title}</td>
                        <td>${jobPosting.description}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value='/companies'/>" class="btn btn-primary">Back to Companies List</a>
    </div>
    <script src="<c:url value='/resources/js/bootstrap/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
