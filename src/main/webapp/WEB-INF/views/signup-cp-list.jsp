<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup Cp List</title>
</head>
<body>
    <h1>Signup Cp List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Company Type</th>
                <th>Company Registration Num</th>
                <th>Company Name</th>
                <th>Company Representative Name</th>
                <th>Company Addr</th>
                <th>Company Business Registration</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="signupCp" items="${signupCpList}">
                <tr>
                    <td>${signupCp.id}</td>
                    <td>${signupCp.companyType}</td>
                    <td>${signupCp.companyRegistrationNum}</td>
                    <td>${signupCp.companyName}</td>
                    <td>${signupCp.companyRepresentativeName}</td>
                    <td>${signupCp.companyAddr}</td>
                    <td>${signupCp.companyBusinessRegistration}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
