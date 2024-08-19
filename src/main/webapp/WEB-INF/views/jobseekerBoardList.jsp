<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../../resources/css/board/jobseekerBoardList.css" />
    <script src="../../resources/js/board/jobseekerBoardList.js" defer></script>

</head>	
<body>
	<div class="button_container">
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
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<button class="search_button">검색</button>
		</form>
	</div>

	<table class="table_list" width="500" border="1">
		<tr class="table_header">
			<td>번호</td>
			<td>아이디</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회수</td>
			<td>좋아요</td>

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
				<td>
					<span id="likeCount-${dto.jobseekerCommunityBoardNum}">${dto.likes}</span>
				</td>

			</tr>
		</c:forEach>
	</table>
	
	<tr>
		<td colspan="5">
			 <button class="writebutton" 
			 onclick="location.href='/board/create'">글작성</button>
		</td>
	</tr>		
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>


	<div class="div_page">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button">
						<a href="${pageMaker.startpage - 1}">
							<<
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
				<!-- <li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:#0057ff '" : ""}> -->
					<!-- 현재페이지 색 지정 --> 
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'current-page' : ''}">			
						<a href="${num}">
							${num}
						</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button">
						<a href="${pageMaker.endpage + 1}">
							>>
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

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>












