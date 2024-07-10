<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 정보 입력</title>
    <!-- Bootstrap CSS -->
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css' />" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
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

        .card-body {
            max-height: 600px; /* Adjust the height as needed */
            overflow-y: auto;
        }
    </style>
    <script>
        function updateCompanyInfo() {
            var selectedCompanyId = document.getElementById("companySelect").value;
            var companies = JSON.parse('${signupCpListJson}');
            var selectedCompany = companies.find(company => company.id == selectedCompanyId);

            if (selectedCompany) {
                document.getElementById("companyName").value = selectedCompany.companyName;
                document.getElementById("companyType").value = selectedCompany.companyType;
                document.getElementById("companyRegistrationNum").value = selectedCompany.companyRegistrationNum;
                document.getElementById("companyRepresentativeName").value = selectedCompany.companyRepresentativeName;
                document.getElementById("companyAddr").value = selectedCompany.companyAddr;
                document.getElementById("companyBusinessRegistration").value = selectedCompany.companyBusinessRegistration;
            }
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">채용 정보 입력</h2>

        <form action="/jobPostingDetail" method="POST">
            <!-- 회사 정보 섹션 -->
            <div class="card mb-4">
                <div class="card-header">회사 정보</div>
                <div class="card-body">
                    <div class="form-floating">
                        <select class="form-control" id="companySelect" name="companyId" onchange="updateCompanyInfo()" required>
                            <option value="">회사를 선택하세요</option>
                            <c:forEach var="company" items="${signupCpList}">
                                <option value="${company.id}">${company.companyName}</option>
                            </c:forEach>
                        </select>
                        <label for="companySelect" class="required">회사 선택</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="companyName" name="companyName" placeholder="회사명" readonly>
                        <label for="companyName" class="required">회사명</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="companyType" name="companyType" placeholder="회사 유형" readonly>
                        <label for="companyType" class="required">회사 유형</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="companyRegistrationNum" name="companyRegistrationNum" placeholder="등록 번호" readonly>
                        <label for="companyRegistrationNum" class="required">등록 번호</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="companyRepresentativeName" name="companyRepresentativeName" placeholder="대표명" readonly>
                        <label for="companyRepresentativeName" class="required">대표명</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="companyAddr" name="companyAddr" placeholder="주소" readonly>
                        <label for="companyAddr" class="required">주소</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="companyBusinessRegistration" name="companyBusinessRegistration" placeholder="사업자 등록번호" readonly>
                        <label for="companyBusinessRegistration" class="required">사업자 등록번호</label>
                    </div>
                </div>
            </div>

            <!-- 채용 정보 섹션 -->
            <div class="card mb-4">
                <div class="card-header">채용 정보</div>
                <div class="card-body">
                    <div class="row g-2">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="채용 제목" required>
                                <label for="jobTitle" class="required">채용 제목</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="employmentType" name="employmentType" placeholder="고용 형태" required>
                                <label for="employmentType" class="required">고용 형태</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="salary" name="salary" placeholder="급여" required>
                                <label for="salary" class="required">급여</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="location" name="location" placeholder="근무지" required>
                                <label for="location" class="required">근무지</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="date" class="form-control" id="applicationDeadline" name="applicationDeadline" placeholder="지원 마감일" required>
                                <label for="applicationDeadline" class="required">지원 마감일</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="email" class="form-control" id="contactEmail" name="contactEmail" placeholder="연락처 이메일" required>
                                <label for="contactEmail" class="required">연락처 이메일</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-floating">
                                <textarea class="form-control" id="jobRequirements" name="jobRequirements" placeholder="채용 요구사항" style="height: 100px;" required></textarea>
                                <label for="jobRequirements" class="required">채용 요구사항</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-floating">
                                <textarea class="form-control" id="jobDescription" name="jobDescription" placeholder="채용 설명" style="height: 200px;" required></textarea>
                                <label for="jobDescription" class="required">채용 설명</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 제출 버튼 추가 -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">제출</button>
            </div>
        </form>
    </div>

    <!-- jQuery -->
    <script src="<c:url value='/resources/js/jquery-3.7.1.min.js' />"></script>
    <!-- Bootstrap JS -->
    <script src="<c:url value='/resources/css/bootstrap/bootstrap.min.js' />"></script>
</body>
</html>
