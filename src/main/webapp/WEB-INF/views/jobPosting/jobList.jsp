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
		
    </head>
    <body>
        <h1>채용 정보 리스트</h1>
		
		<c:forEach items="${postingList}" var="postingList" >
		
        <div class="list-group">
            <a href="" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1 postingTitle"><c:out value='${postingList.postingTitle}'/></h5>
                    <small class="text-body-secondary"><c:out value='${postingList.deadline}'/></small>
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
		
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
