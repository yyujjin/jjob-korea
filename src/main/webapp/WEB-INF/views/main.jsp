<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">관리 시스템 메인 페이지</h1>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">관리자 정보</h2>
                        <button class="btn btn-primary" onclick="location.href='/kth/listAdmins'">관리자 정보 조회</button>
                        <button class="btn btn-secondary mt-2" onclick="location.href='/kth/addAdmin'">관리자 정보 추가</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">기업 정보</h2>
                        <button class="btn btn-primary" onclick="location.href='/listCompanies'">기업 정보 조회</button>
                        <button class="btn btn-secondary mt-2" onclick="location.href='/addCompany'">기업 정보 추가</button>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">채용 공고</h2>
                        <button class="btn btn-primary" onclick="location.href='/listJobPostings'">채용 공고 조회</button>
                        <button class="btn btn-secondary mt-2" onclick="location.href='/addJobPosting'">채용 공고 추가</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
