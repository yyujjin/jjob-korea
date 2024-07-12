<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.div_page ul{
			display: flex;
			list-style: none;
		}
	</style>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회수</td>

		</tr>
<!-- 		list : 모델객체에서 보낸 이름 -->
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.jobseekerCommunityBoardNum}</td>
				<td>${dto.jobseekerCommunityBoardName}</td>
<%-- 				<td>${dto.jobseekerCommunityBoardTitle}</td> --%>
				<td>
<!-- 			content_view : 컨트롤러단 호출 -->
				<a class="move_link" href="${dto.jobseekerCommunityBoardNum}">	${dto.jobseekerCommunityBoardTitle}</a></td>
				
				<td class="boardDate">${dto.jobseekerCommunityBoardDate}</td>
					
				<td>${dto.jobseekerCommunityBoardHit}</td>

			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
<!-- 			write_view : 컨트롤러단 호출 -->
				<a href="jobseekerWrite_view">글작성</a>
			</td>
		</tr>
	</table>

	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	   <script>
	       $(document).ready(function() {
	           $(".boardDate").each(function() {
	               var utcDate = $(this).text().trim();
	               if (utcDate) {
	                   var dateObj = new Date(utcDate.replace(/-/g, '/'));

	                   dateObj.setHours(dateObj.getHours() -9);

	                   var year = dateObj.getFullYear();
	                   var month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
	                   var day = ('0' + dateObj.getDate()).slice(-2);
	                   var hours = ('0' + dateObj.getHours()).slice(-2);
	                   var minutes = ('0' + dateObj.getMinutes()).slice(-2);
	                   var seconds = ('0' + dateObj.getSeconds()).slice(-2);

	                   var formattedDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;

	                   $(this).text(formattedDate);
	               }
	           });
	       });
	   </script>
	
	<form method="get" id="searchForm">
		<select name="type">
			<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':''}"/> >전체</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/> >제목</option>
			<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/> >내용</option>
			<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/> >작성자</option>
			<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/> >제목 or 내용</option>
			<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/> >제목 or 작성자</option>
			<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected':''}"/> >제목 or 내용 or 작성자</option>
		</select>
		<!-- 	Criteria 를 이용해서 키워드 값을 넘김 -->
		<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
		<!-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> -->
		 <!-- 전체검색중 5페이지에서 22 키워드로 검색시 안나올때 처리 -->
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<button>Search</button>
	</form>
	 <!--PageDTO(startpage=1, endpage=6, prev=false, next=false, total=52, cri=Criteria(pageNum=1, amount=10, type=null, keyword=null))-->
	<h3>${pageMaker}</h3>
	<div class="div_page">
			<ul>
				<c:if test="${pageMaker.prev}">
					<!-- <li>[Previous]</li> -->
					<li class="paginate_button">
						<a href="${pageMaker.startpage - 1}">
							[Previous]
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
					<!-- <li>[${num}]</li> -->
					<!-- <li ${pageMaker.cri.pageNum == num ? "style='color: red'" : ""}> -->
						<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
					<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color: yellow'" : ""}>
						<!-- [${num}] -->
						<a href="${num}">
							[${num}]
						</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<!-- <li>[Next]</li> -->
					<li class="paginate_button">
						<a href="${pageMaker.endpage + 1}">
							[Next]
						</a>
					</li>
				</c:if>
			</ul>
		</div>

	<form id="actionForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<!-- 페이징 검색시 페이지번호를 클릭할때 필요한 파라미터 -->
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
	
</body>
</html>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function() {
		    var boardList = ${list}; // JSP에서 받아온 목록

		    // 각 게시물의 날짜를 UTC에서 KST로 변환하여 표시
		    $(".boardDate").each(function() {
		        var utcDate = $(this).text(); // 텍스트로 가져온 UTC 시간 문자열
		        var dateObj = new Date(utcDate.replace(/-/g, '/')); // '-'를 '/'로 변경하여 파싱

		        // UTC 시간에 9시간을 추가하여 KST로 변환
		        dateObj.setHours(dateObj.getHours() +9);

		        // 변환된 날짜를 원하는 형식으로 포맷
		        var year = dateObj.getFullYear();
		        var month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
		        var day = ('0' + dateObj.getDate()).slice(-2);
		        var hours = ('0' + dateObj.getHours()).slice(-2);
		        var minutes = ('0' + dateObj.getMinutes()).slice(-2);
		        var seconds = ('0' + dateObj.getSeconds()).slice(-2);

		        var formattedDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;

		        // 변환된 날짜를 해당 span 요소에 표시
		        $(this).text(formattedDate);
		    });
		});
	</script>
 <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script>
	var actionForm = $("#actionForm");

	//	페이지번호 처리
	// $(".paginate_button").on("click", function (e){
	$(".paginate_button a").on("click", function (e){
		//기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@# href=>"+$(this).attr("href"));


		var bno = actionForm.find("input[name='jobseekerCommunityBoardNum']").val();
		       if(bno != ""){
		           actionForm.find("input[name='jobseekerCommunityBoardNum']").remove();
		       }

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// actionForm.submit();
		actionForm.attr("action","jobseekerBoardList").submit();
	});//end of paginate_button clcik

	// 	게시글 처리
	$(".move_link").on("click", function(e){
		e.preventDefault();

		console.log("@# move_link click~!!!");
		console.log("@# href=>"+$(this).attr("href"));

		var targetBno = $(this).attr("href");
	

		var bno = actionForm.find("input[name='jobseekerCommunityBoardNum']").val();
		if(bno != ""){
			actionForm.find("input[name='jobseekerCommunityBoardNum']").remove();
		}

		actionForm.append("<input type='hidden' name='jobseekerCommunityBoardNum' value='"+targetBno+"'>");
		// actionForm.submit();
		// 컨트롤러에 content_view 로 찾아감
		actionForm.attr("action","jobseekerContent_view").submit();
	});//end of move_link click

	var searchForm = $("#searchForm");

	// 	Search 버튼 클릭
	// $("#searchForm").on("click", function(){
	$("#searchForm button").on("click", function(){
		// alert("검색");

		// 아래는 검색종류까지 할때 참고
		// if(!searchForm.find("option:selected").val()){
		// 	alert("검색종류를 선택하세요.");
		// 	return false;
		// }

		if(searchForm.find("option:selected").val() != "" && !searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		searchForm.attr("action","jobseekerBoardList").submit();
	});//end of searchForm click

	// 	type 콤보박스 변경
	$("#searchForm select").on("change", function(){
		// 전체일때
		if(searchForm.find("option:selected").val() == ""){
			// 키워드를 널값으로 변경
			searchForm.find("input[name='keyword']").val("");
		}
	});//end of searchForm select change
</script>











