<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Companies</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Companies</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="company" items="${companies}">
                    <tr>
                        <td>${company.id}</td>
                        <td>${company.name}</td>
                        <td>${company.address}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
