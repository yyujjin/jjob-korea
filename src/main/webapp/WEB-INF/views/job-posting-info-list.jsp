<!DOCTYPE html>
<html>
<head>
    <title>Job Posting List</title>
</head>
<body>
    <h2>Job Posting List</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Company Name</th>
                <th>Posting Image</th>
                <th>Posting Title</th>
                <th>Job Title</th>
                <th>Work Location</th>
                <th>Employment Type</th>
                <th>Job Experience</th>
                <th>Deadline</th>
                <th>Hit</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="jobPostingInfo" items="${jobPostingInfos}">
                <tr>
                    <td>${jobPostingInfo.id}</td>
                    <td>${jobPostingInfo.companyName}</td>
                    <td><img src="${jobPostingInfo.postingImage}" alt="Image" /></td>
                    <td>${jobPostingInfo.postingTitle}</td>
                    <td>${jobPostingInfo.jobTitle}</td>
                    <td>${jobPostingInfo.workLocation}</td>
                    <td>${jobPostingInfo.employmentType}</td>
                    <td>${jobPostingInfo.jobExperience}</td>
                    <td>${jobPostingInfo.deadline}</td>
                    <td>${jobPostingInfo.hit}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
