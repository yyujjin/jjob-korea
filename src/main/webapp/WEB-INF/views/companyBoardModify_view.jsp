<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="header">
				<jsp:include page="/WEB-INF/views/main/main-header.jsp" />
			 </div>
			 
			 
	<table width="500" border="1">
		<form method="post" action="companyBoardModify">
			<input type="hidden" name="companyCommunityBoardNum" value="${modify_view.companyCommunityBoardNum}">
			<tr>
				<td>번호</td>
				<td>
					${modify_view.companyCommunityBoardNum}
				</td>
			</tr>
			<tr>
				<td>히트</td>
				<td>
					${modify_view.companyCommunityBoardHit}
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					${modify_view.companyUserName} 
<!--					<input type="text" name="boardName" value="${content_view.boardName}">-->
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
<%-- 					${modify_view.companyCommunityBoardTitle} --%>
					<input type="text" name="companyCommunityBoardTitle" value="${modify_view.companyCommunityBoardTitle}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
<%-- 					${modify_view.companyCommunityBoardContent} --%>
					<input type="text" name="companyCommunityBoardContent" value="${modify_view.companyCommunityBoardContent}">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					&nbsp;&nbsp;<a href="companyBoardList">목록보기</a>
				
				</td>
			</tr>
		</form>
	</table>
	

	<div class="footer">
		<jsp:include page="/WEB-INF/views/main/main-footer.jsp" />
	</div>
	
</body>
</html>








