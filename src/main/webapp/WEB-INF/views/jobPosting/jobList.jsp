<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>jobPosting</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
        />
        <!-- 글꼴 설정 -->
        <link
            href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
            rel="stylesheet"
        />
		
		<style>
			.job-detail {
			    /* 개별 항목 거리 조정  */
			    padding: 3px;
			}
			.postingTitle{
				font-family: "NanumBarunGothic";
				font-size: 18px;
			}
		</style>
		<script src="../../resources/js/jobPosting/searchFilter.js" defer></script> <!--js연결-->
			
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- jQuery 라이브러리 추가 -->
    </head>
    <body>
		<c:forEach items="${postingList}" var="postingList" >
		
        <div class="list-group">
			 <!--TODO:태후씨 채용정보 상세보기 페이지 생성하면 연결하기-->
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1 postingTitle"><c:out value='${postingList.postingTitle}'/></h5>
                    <small class="text-body-secondary">
						<c:choose>
					          <c:when test="${postingList.countdownDays != null && postingList.countdownDays !=0}">
									 <c:out value="D-${postingList.countdownDays}"/>
					          </c:when>
					          <c:otherwise>
									<c:out value='${"D-day"}'/>
					          </c:otherwise>
				      </c:choose>
					</small>
                </div>
               
                <small class="text-body-secondary ">
					<!--경력 여부-->
					<span class="job-detail"><c:out value='${postingList.jobExperience}'/></span>
					<!--직무-->
					<span class="job-detail"><c:out value='${postingList.jobTitle}'/></span>
					<!--근무 지역-->
					<span class="job-detail"><c:out value='${postingList.workLocation}'/></span>
					<!--고용 형태-->
					<span class="job-detail"><c:out value='${postingList.employmentType}'/></span>
				</small
                >
            </a>
        </div>
		</c:forEach>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center list-paging mt-3">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>