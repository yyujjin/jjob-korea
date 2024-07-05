<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
	<table width="500" border="1">
		<form method="post" action="companyBoardModify_view">
			<input type="hidden" name="companyCommunityBoardNum" value="${content_view.companyCommunityBoardNum}">
			<input type="hidden" name="companyUserName" value="${content_view.companyUserName}">
			<input type="hidden" name="companyCommunityBoardHit" value="${content_view.companyCommunityBoardHit}">
			<input type="hidden" name="companyCommunityBoardTitle" value="${content_view.companyCommunityBoardTitle}">
			<input type="hidden" name="companyCommunityBoardContent" value="${content_view.companyCommunityBoardContent}">
			<tr>
				<td>번호</td>
				<td>
					${content_view.companyCommunityBoardNum}
					
				</td>
			</tr>
			<tr>
				<td>히트</td>
				<td>
					${content_view.companyCommunityBoardHit}
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
						${content_view.companyUserName}
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
				${content_view.companyCommunityBoardTitle}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				${content_view.companyCommunityBoardContent} 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					&nbsp;&nbsp;<a href="companyBoardList">목록보기</a>
<!--					&nbsp;&nbsp;<a href="modify_view">수정</a>-->
					&nbsp;&nbsp;<a href="companyBoardDelete?companyCommunityBoardNum=${content_view.companyCommunityBoardNum}">삭제</a>-->
				</td>
			</tr>
		</form>
	</table>
	
	
	
	
	
	<div>
			<input type="text" id="companyCommentWriter" placeholder="작성자">
			<input type="text" id="companyCommentContent" placeholder="내용">
			<button onclick="commentWrite()">댓글작성</button>
		</div>

		<div id="comment-list">
			<table>
				<tr>
					<th>댓글번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성시간</th>
				</tr>
				<c:forEach items="${commentList}" var="comment">
					<tr>
						<td>${comment.companyCommentNum}</td>
						<td>${comment.companyCommentWriter}</td>
						<td>${comment.companyCommentContent}</td>
						<td>${comment.companyCommentTime}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
		<script>
			const commentWrite = () => {
				const writer = document.getElementById("companyCommentWriter").value;
				const content = document.getElementById("companyCommentContent").value;
				const no = "${content_view.companyCommunityBoardNum}";

				$.ajax({
					 type: "post"
					,data: {
						 companyCommentWriter: writer
						,companyCommentContent: content
						,companyCommunityBoardNum: no
					}
					,url: "/comment/save"
					,success: function(commentList){
						console.log("작성성공");
						console.log(commentList);

						let output = "<table>";
							output += "<tr><th>댓글번호</th>";
							output += "<th>작성자</th>";
							output += "<th>내용</th>";
							output += "<th>작성시간</th></tr>";
							for (let i in commentList){
								output += "<tr>";
								output += "<td>"+commentList[i].companyCommentNum+"</td>";
								output += "<td>"+commentList[i].companyCommentWriter+"</td>";
								output += "<td>"+commentList[i].companyCommentContent+"</td>";
								// output += "<td>"+commentList[i].companyCommentTime+"</td>";
								let companyCommentTime = commentList[i].companyCommentTime.substring(0, 10)+" ";
								// companyCommentTime += commentList[i].companyCommentTime.substring(12, 13)+" ";
								companyCommentTime += parseInt(commentList[i].companyCommentTime.substring(12, 13))+9;
								companyCommentTime += commentList[i].companyCommentTime.substring(13, 16);
								output += "<td>"+companyCommentTime+"</td>";
								output += "</tr>";
							}
							output += "</table>";
							console.log("@# output=>"+output);

							document.getElementById("comment-list").innerHTML = output;
							document.getElementById("companyCommentWriter").value = "";
							document.getElementById("companyCommentContent").value = "";
					}
					,error: function(){
						console.log("실패");
					}
				});//end of ajax
			}//end of script
		</script>
</html>













