<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 추가</title>
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

        .form-floating {
            margin-bottom: 0.5rem;
        }

        .form-floating input,
        .form-floating textarea,
        .form-floating select {
            padding: 0.5rem 0.75rem;
            height: auto;
        }

        .form-floating label {
            font-size: 0.85rem;
            color: #6c757d;
        }

        .required::after {
            content: "*";
            color: red;
        }
    </style>
</head>
<body>
<div class="container-fixed mt-5">
    <h2 class="text-center mb-4">채용 공고 추가</h2>
    <form action="<c:url value='/addJobPosting' />" method="post" enctype="multipart/form-data">
        <!-- 회사 정보 섹션 -->
        <div class="card">
            <div class="card-header section-title">회사 정보</div>
            <div class="card-body">
                <div class="form-floating">
                    <input type="text" class="form-control" id="companyName" name="companyName" placeholder="회사명" value="${signupCp.companyName}" readonly>
                    <label for="companyName" class="required">회사명</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="companyType" name="companyType" placeholder="회사 유형" value="${signupCp.companyType}" readonly>
                    <label for="companyType" class="required">회사 유형</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="companyAddr" name="companyAddr" placeholder="주소" value="${signupCp.companyAddr}" readonly>
                    <label for="companyAddr" class="required">주소</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="companyBusinessRegistration" name="companyBusinessRegistration" placeholder="사업자 등록번호" value="${signupCp.companyBusinessRegistration}" readonly>
                    <label for="companyBusinessRegistration" class="required">사업자 등록번호</label>
                </div>
            </div>
        </div>

        <!-- 사용자 정보 섹션 -->
        <div class="card">
            <div class="card-header section-title">사용자 정보</div>
            <div class="card-body">
                <div class="form-floating">
                    <input type="text" class="form-control" id="memId" name="memId" placeholder="아이디" value="${signupTb.memId}" readonly>
                    <label for="memId" class="required">아이디</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="memName" name="memName" placeholder="이름" value="${signupTb.memName}" readonly>
                    <label for="memName" class="required">이름</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="memPhone" name="memPhone" placeholder="전화번호" value="${signupTb.memPhone}" readonly>
                    <label for="memPhone" class="required">전화번호</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="memEmail" name="memEmail" placeholder="이메일" value="${signupTb.memEmail}" readonly>
                    <label for="memEmail" class="required">이메일</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="memAddr" name="memAddr" placeholder="주소" value="${signupTb.memAddr}" readonly>
                    <label for="memAddr" class="required">주소</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="memBirth" name="memBirth" placeholder="생년월일" value="${signupTb.memBirth}" readonly>
                    <label for="memBirth">생년월일</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="memGender" name="memGender" placeholder="성별" value="${signupTb.memGender}" readonly>
                    <label for="memGender">성별</label>
                </div>
            </div>
        </div>

        <!-- 포지션 및 자격요건 섹션 -->
        <div class="card">
            <div class="card-header section-title">포지션 및 자격요건</div>
            <div class="card-body">
                <div class="form-floating">
                    <input type="text" class="form-control" id="positionCount" name="positionCount" placeholder="채용 인원">
                    <label for="positionCount">담당업무 및 그 인원수</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="skills" name="skills" placeholder="스킬">
                    <label for="skills">스킬</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="coreCompetencies" name="coreCompetencies" placeholder="핵심 역량">
                    <label for="coreCompetencies">핵심 역량</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="qualifications" name="qualifications" placeholder="자격요건">
                    <label for="qualifications">자격요건</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="preferredConditions" name="preferredConditions" placeholder="우대조건">
                    <label for="preferredConditions">우대조건</label>
                </div>
            </div>
        </div>

        <!-- 근무 조건 섹션 -->
        <div class="card">
            <div class="card-header section-title">근무 조건</div>
            <div class="card-body">
                <div class="form-floating">
                    <input type="text" class="form-control" id="employmentType" name="employmentType" placeholder="고용 형태">
                    <label for="employmentType">고용 형태</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="location" name="location" placeholder="근무 지역">
                    <label for="location">근무 지역</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="workHours" name="workHours" placeholder="근무 요일/시간">
                    <label for="workHours">근무 요일/시간</label>
                </div>
            </div>
        </div>

        <!-- 복지 및 혜택 섹션 -->
        <div class="card">
            <div class="card-header section-title">복지 및 혜택</div>
            <div class="card-body">
                <div class="form-floating">
                    <input type="text" class="form-control" id="benefits" name="benefits" placeholder="복지 혜택">
                    <label for="benefits">복지 혜택</label>
                </div>
            </div>
        </div>

        <!-- 전형절차 섹션 -->
        <div class="card">
            <div class="card-header section-title">전형절차</div>
            <div class="card-body">
                <div class="form-floating">
                    <textarea class="form-control" id="hiringProcess" name="hiringProcess" placeholder="전형절차" style="height: 100px;"></textarea>
                    <label for="hiringProcess">전형절차</label>
                </div>
            </div>
        </div>

        <!-- 유의사항 섹션 -->
        <div class="card">
            <div class="card-header section-title">유의사항</div>
            <div class="card-body">
                <div class="form-floating">
                    <textarea class="form-control" id="notes" name="notes" placeholder="유의사항" style="height: 100px;"></textarea>
                    <label for="notes">유의사항</label>
                </div>
            </div>
        </div>

        <!-- 회사 로고 및 채용 공고 이미지 업로드 -->
        <div class="card">
            <div class="card-header section-title">이미지 업로드</div>
            <div class="card-body">
                <div class="form-floating">
                    <input type="file" class="form-control" id="companyLogo" name="companyLogo">
                    <label for="companyLogo">회사 로고</label>
                </div>
                <div class="form-floating">
                    <input type="file" class="form-control" id="jobPostingImage" name="jobPostingImage">
                    <label for="jobPostingImage">채용 공고 이미지</label>
                </div>
            </div>
        </div>

        <!-- 제출 버튼 -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary mt-4">제출</button>
        </div>
    </form>
</div>

<!-- jQuery -->
<script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
<!-- Bootstrap JS -->
<script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js' />"></script>
</body>
</html>
