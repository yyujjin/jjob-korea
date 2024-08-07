<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Companies List</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
</head>
<body>
    <div class="container">
        <h1>Companies</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${companies}" var="company">
                    <tr>
                        <td>${company.id}</td>
                        <td>${company.name}</td>
                        <td>${company.address}</td>
                        <td>
                            <a href="<c:url value='/companies/${company.id}'/>" class="btn btn-primary">View Details</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="<c:url value='/resources/js/bootstrap/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
