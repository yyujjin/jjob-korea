<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>채용 정보 상세</title>
        <!-- Bootstrap CSS -->
        <link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css' />" rel="stylesheet" />
        <link rel="stylesheet" href="<c:url value='/resources/css/jobPosting/view-jobPosting.css' />" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="<c:url value='/resources/js/jobPosting/view-jobPosting.js' />" defer></script>

    </head>
    <body>
        <div class="container-fixed mt-5">
            <!-- 회사 정보 및 채용 정보 섹션 -->
            <div class="info-section">
                <!-- 채용 정보 섹션 -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="section-title">채용 정보</h4>
                        <ul>
                            <li><strong>직무:</strong> ${jobPosting.jobTitle}</li>
                            <li><strong>근무 지역:</strong> ${jobPosting.workLocation}</li>
                            <li><strong>고용 형태:</strong> ${jobPosting.employmentType}</li>
                            <li><strong>경력 여부:</strong> ${jobPosting.jobExperience}</li>
                            <li><strong>채용 마감 날짜:</strong> ${jobPosting.deadline}</li>
                        </ul>
                    </div>
                </div>

                <!-- 회사 정보 섹션 -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="section-title">회사 정보</h4>
                        <ul>
                            <li><strong>회사 이름:</strong> ${company.name}</li>
                            <li><strong>대표자:</strong> ${company.ceo}</li>
                            <li><strong>업종:</strong> ${company.res}</li>
                            <li><strong>기업 규모:</strong> ${company.companyType}</li>
                            <li><strong>설립 년도:</strong> ${company.birthd}</li>
                            <li><strong>직원 수:</strong> ${company.employeeCount}</li>
                            <li><strong>주소:</strong> ${company.addr}</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- 상세 정보 및 버튼 섹션 -->
            <div class="card details-section">
                <div class="card-body">
                    <h4 class="section-title">상세 정보</h4>
                    <div class="tabs">
                        <button class="btn btn-light" onclick="showTab('details')">상세정보</button>
                        <button class="btn btn-light" onclick="showTab('application')">접수기간/방법</button>
                    </div>
                    <div id="details-content" class="tab-content">
                        <p>상세정보(등록페이지에서 작성한 상세정보 표기)</p>
                    </div>
                    <div id="application-content" class="tab-content" style="display: none;">
                        <p>접수기간/방법</p>
                        <p>(채용공고에 등록된 시 자격요건-마감기한 띄우기)</p>
                        <p>기업정보(기업이 아니면 자동삭제 필수)</p>
                    </div>
                  
                </div>
            </div>

            <!-- 버튼 섹션 -->
            <div class="text-center mt-4">
                <button type="button" id="applyButton" class="btn-apply">
                    지원하기
                </button>
                <button type="button" id="scrapButton" class="btn-scrap">
                    스크랩
                </button>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js' />"></script>
        <script>
            function showTab(tabName) {
                document.getElementById('details-content').style.display = 'none';
                document.getElementById('application-content').style.display = 'none';
                document.getElementById('recommendation-content').style.display = 'none';
                
                document.getElementById(tabName + '-content').style.display = 'block';
            }
        </script>
    </body>
</html>
