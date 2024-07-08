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
		<form method="post" action="write">
			
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="companyUserName" size="50">
				</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="companyCommunityBoardTitle" size="50">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" name="companyCommunityBoardContent"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력">
				</td>
			</tr>
		</form>
	</table>
	

	<div class="footer">
		<jsp:include page="/WEB-INF/views/main/main-footer.jsp" />
	</div>
	
</body>
</html>








