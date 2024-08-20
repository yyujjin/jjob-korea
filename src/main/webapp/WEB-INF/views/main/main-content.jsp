<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main-content</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="../../resources/css/main/main-content.css" />
    <script src="../../resources/js/main/main-content.js" defer></script>
</head>

<body>
    <div class="main-adv">
        <img src="../../resources/img/main_adv/검사무료체험.png" class="adv-images fade-in">
    </div>

   <div style="font-weight: bold;"> 지금 <span style="color: #00FF00;">HOT</span>한 채용공고
        <span style="color: blue;">TOP8</span>
        <span id="updateTime">(매일 오전 09:00 ~ 익일 오전 09:00 기준)</span>
   </div>
   <br>

    <div class="row row-cols-2 row-cols-md-4 g-4 ">
        <c:forEach items="${postingList}" var="postingList">
            <div class="col">
                <a href="/jobPosting?companyId=${postingList.companyId}">
                    <div class="card h-100 w-90 text-center">
                        <img src="<c:out value='${postingList.postingImage}'/>"
                            class="card-img-top fixed-size-image" alt="..." />
                        <div class="card-body">
                            <h5 class="card-title">
                                <c:out value='${postingList.companyName}' />
                            </h5>
                            <p class="card-text">
                                <c:out value='${postingList.postingTitle}' />
                            </p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
   </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>