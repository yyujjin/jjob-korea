<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>채용 정보 상세</title>
        <!-- Bootstrap CSS -->
        <link
            href="<c:url value='/resources/css/bootstrap/bootstrap.min.css' />"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="../../resources/css/view-jobPosting.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script
            src="../../resources/js/jobPosting/view-jobPosting.js"
            defer
        ></script>
        <!--js연결-->
    </head>
    <body>
        <div class="container-fixed mt-5">
            <div class="card">
                <div class="card-body">
                    <h4 class="section-title">회사 소개</h4>
                    <ul>
                        <li>회사 이름 : ${company.name}</li>
                        <li>대표자 : ${company.ceo}</li>
                        <li>업종 : ${company.res}</li>
                        <li>기업 규모 : ${company.companyType}</li>
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
                        <li>고용 형태 : ${jobPosting.employmentType}</li>
                        <li>경력 여부 : ${jobPosting.jobExperience}</li>
                        <li>채용 마감 날짜 : ${jobPosting.deadline}</li>
                    </ul>
                </div>
            </div>

            <!-- 버튼 섹션 -->
            <div class="actions mt-5">
                <button type="button" id="applyButton" class="btn btn-apply">
                    지원하기
                </button>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js' />"></script>
    </body>
</html>
