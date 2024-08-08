<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 정보 상세</title>
    <!-- Bootstrap CSS -->
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css' />" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 2rem;
        }

        .container-fixed {
            width: 1200px; /* 고정된 크기 */
            margin: 0 auto; /* 가운데 정렬 */
        }

        .card {
            margin-bottom: 1.5rem;
            border: none;
            background-color: #fff;
            padding: 1rem;
            height: 100%; /* 카드의 높이를 100%로 설정하여 동일한 세로 크기 유지 */
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff; /* 텍스트 색상 */
            border-bottom: 3px solid #007bff; /* 텍스트 아래 강조선 */
            padding-bottom: 0.5rem;
            margin-bottom: 1rem;
        }

        .table th, .table td {
            vertical-align: middle;
            border-top: none;
        }

        .company-info {
            padding: 1rem;
        }

        .job-title {
            font-size: 1.75rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .highlight {
            color: #007bff;
            font-weight: bold;
        }

        .full-height {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .border-left {
            border-left: 2px solid #dee2e6;
        }

        .border-bottom {
            border-bottom: 2px solid #dee2e6;
            margin-bottom: 0.5rem;
        }

        .no-padding {
            padding-left: 0;
            padding-right: 0;
        }

        .full-border {
            border: 2px solid #dee2e6;
            height: 100%;
        }

        .row-no-margin {
            margin-left: 0;
            margin-right: 0;
        }

        .company-logo {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px; /* 로고 이미지 높이 */
            margin-bottom: 0.5rem;
        }

        .company-info-container {
            display: flex;
            flex-direction: column;
            justify-content: flex-start; /* 상단 정렬 */
            height: 100%;
        }

        .table {
            margin-bottom: 0.5rem; /* 테이블의 하단 여백 줄이기 */
        }

        .actions {
            margin-top: 1rem;
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .btn-apply {
            background-color: #ff6a00;
            color: white;
            font-size: 1.25rem;
            padding: 1rem 2rem;
            border: none;
            border-radius: 0.25rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .btn-scrap {
            background-color: white;
            color: #ff6a00;
            font-size: 1.25rem;
            padding: 1rem 2rem;
            border: 2px solid #ff6a00;
            border-radius: 0.25rem;
            margin-left: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .image-container {
            position: relative;
            width: 100%;
            height: auto; /* 이미지의 높이를 자동으로 설정 */
            overflow: hidden;
        }

        .image-container img {
            width: 100%;
            height: 50%; /* 이미지가 잘리지 않도록 설정 */
        }

        .background-image {
            height: 50%; /* 배경 이미지 높이 50% */
            position: relative;
        }

        .image-text {
            position: absolute;
            top: 50%;
            left: 0; /* 텍스트를 이미지의 왼쪽에 위치 */
            transform: translateY(-50%);
            color: black; /* 텍스트 색상 검정색 */
            font-size: 2rem;
            text-align: left;
            padding-left: 1rem; /* 왼쪽 여백 추가 */
        }
    </style>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="../../resources/js/jobPosting/view-jobPosting.js" defer></script> <!--js연결-->
</head>
<body>
<div class="container-fixed mt-5">
    <div class="card">
        <div class="card-body">
            <h4 class="section-title">회사 소개</h4>
             <ul>
                 <li>회사 이름 : ${company.name} </li>
                 <li>대표자 : ${company.ceo} </li>
                 <li>업종 : ${company.res} </li>
                 <li>기업 규모 : ${company.companyType} </li>
                 <li>설립 년도 : ${company.birthd}</li>
                 <li>직원 수 : ${company.employeeCount}</li>
                 <li>주소 : ${company.addr}</li>
            </ul>
        </div>
    </div>


        <div class="card">
            <div class="card-body">
                <h4 class="section-title">채용 정보</h4>
                <ul>
                    <li>직무 : ${jobPosting.jobTitle}</li>
                    <li>근무 지역 : ${jobPosting.workLocation}</li>
                    <li>고용 형태 :  ${jobPosting.employmentType}</li>
                    <li>경력 여부 : ${jobPosting.jobExperience}</li>
                    <li>채용 마감 날짜 : ${jobPosting.deadline}</li>
                </ul>
            </div>
        </div>


    <!-- 버튼 섹션 -->
    <div class="actions mt-5">
        <button type="button" id="applyButton" class="btn btn-apply">지원하기 </button>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js' />"></script>

</body>
</html>
