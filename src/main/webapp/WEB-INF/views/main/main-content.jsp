<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main-content</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!-- 글꼴 설정 -->
    <link
        href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
        rel="stylesheet"
    />


	<style>
		.card-title {
			font-family: "NanumBarunGothic";
			font-size: 25px;
			font-size: 25px; /* 글자 크기 조절 */
			text-align: left; /* 왼쪽 정렬 */
		}
		/*사진 크기 조절*/
		.fixed-size-image {
		    width: 200px;
		    height: 150px;
		    object-fit: cover;
		}
		
		.card-text {
           	text-align: left;  /* 왼쪽 정렬 */
       	}

        #updateTime{
            color: #565e64;
            font-size: xx-small;
        }
        #hotPosting-icon{
            margin-left: -20px;
        }
	</style>
</head>
<body>
    <!-- 반응형 -->
    <!-- //.row-cols-1한 열에 카드를 배치하고, .row-cols-md-3중간 중단점에서 위로 여러 행에 걸쳐 g-4 4장의 카드를 동일한 너비로 분할합니다. -->
    <!-- row-cols-md-3   중간 크기 화면(medium screen) 이상에서 한 행에 세 개의 열이 포함되도록 설정합니다. -->

   <%-- <div> <span id="top-posting"> 지금 뜨는 채용공고 <span id="top8"> TOP 8</span> </span> </div>--%>

        <img id="hotPosting-icon" src="../../resources/img/hotPosting_icon.jpg" width="320"
        height="70">

    <span id="updateTime" >(매일 오전 10:00 ~ 익일 오전 10:00 기준)</span>
    <div class="row row-cols-2 row-cols-md-4 g-4 ">
		
		<c:forEach items="${postingList}" var="postingList" >
		<div class="col">
          <div class="card h-100 w-90 text-center">
           <img src="<c:out value='${postingList.postingImage}'/>" class="card-img-top fixed-size-image" alt="..."/>
            <div class="card-body">
              <h5 class="card-title"><c:out value='${postingList.companyName}'/></h5>
              <p class="card-text"><c:out value='${postingList.postingTitle}'/></p>
            </div>
          </div>
        </div>	
		</c:forEach>
		
       
	  	 
  	</div>
      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>