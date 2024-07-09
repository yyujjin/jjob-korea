<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jobPosting</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!-- 글꼴 설정 -->
    <link
        href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
        rel="stylesheet"
    />
	<style>
		/*화면에 양 옆의 공백 없이 꽉 차게 하려면, CSS를 사용하여 요소들의 너비를 100%로 설정하고, 기본적인 브라우저의 여백과 패딩을 제거해야 합니다. */
		
		
			   
		.searchFilter {
		    padding: 20px;
		    width: auto;
		    height: auto;
		}

		.jobList {
		    padding: 20px;
		    width: auto;
		    height: auto;
		}

		
	</style>
</head>
<body> 
 	      <div class="searchFilter">
 	          <jsp:include page="searchFilter.jsp" />
 	      </div>
 	      <div class="jobList">
			<jsp:include page="jobList.jsp" />
 	      </div>
 	      
 	  
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>