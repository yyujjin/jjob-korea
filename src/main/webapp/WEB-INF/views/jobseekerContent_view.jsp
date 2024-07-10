<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.uploadResult{
			width: 100%;
			background-color: gray;
		}
		.uploadResult ul{
			display: flex;
			flex-flow: row;
		}
		.uploadResult ul li{
			list-style: none;
			padding: 10px;
		}
		.uploadResult ul li img{
			width: 100px;
		}
	</style>
	 <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<table width="500" border="1">
		<form method="post" action="jobseekerModify">

			<input type="hidden" name="jobseekerCommunityBoardNum" 
			value="${content_view.jobseekerCommunityBoardNum}">
			<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.amount}">
			<tr>
				<td>번호</td>
				<td>
					${content_view.jobseekerCommunityBoardNum}
				</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>
					${content_view.jobseekerCommunityBoardHit}
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="jobseekerCommunityBoardName" 
					value="${content_view.jobseekerCommunityBoardName}">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>

					<input type="text" name="jobseekerCommunityBoardTitle" 
					value="${content_view.jobseekerCommunityBoardTitle}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>

					<input type="text" name="jobseekerCommunityBoardContent" 
					value="${content_view.jobseekerCommunityBoardContent}">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<!-- &nbsp;&nbsp;<a href="list">목록보기</a> -->
					 <!-- formaction="list" : name 으로 설정된 값들을 가지고 이동 -->
					<!-- &nbsp;&nbsp;<input type="submit" value="목록보기" form action="jobseekerBoardList"> -->
					&nbsp;&nbsp;<input type="submit" value="목록보기" formmethod="get" 
					formaction="jobseekerBoardList">
					<!-- &nbsp;&nbsp;<input type="submit" value="삭제" form action="jobseekerDelete"> -->
					&nbsp;&nbsp;<input type="submit" value="삭제" formmethod="post"
					form action="jobseekerDelete">
				</td>
			</tr>
		</form>
	</table>

	<!-- 첨부파일 출력 -->
	Files
	<div class="bigPicture">
		<div class="bigPic">

		</div>
	</div>
	<div class="uploadResult">
		<ul>

		</ul>
	</div>

	<div>
		<input type="text" id="jobseekerCommentWriter" placeholder="작성자">
		<input type="text" id="jobseekerCommentContent" placeholder="내용">
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
					<td>${comment.jobseekerCommentBoardNum}</td>
					<td>${comment.jobseekerCommentCommentWriter}</td>
					<td>${comment.jobseekerCommunityCommentContent}</td>
					<td>${comment.jobseekerCommentTime}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
	<script>
		const commentWrite = () => {
			const writer = document.getElementById("jobseekerCommentWriter").value;
			const content = document.getElementById("jobseekerCommentContent").value;
			const no = "${content_view.jobseekerCommunityBoardNum}";

			$.ajax({
				 type: "post"
				,data: {
					jobseekerCommentCommentWriter: writer
				   ,jobseekerCommunityCommentContent: content
				   ,jobseekerCommunityBoardNum: no
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
							output += "<td>"+commentList[i].jobseekerCommentBoardNum+"</td>";
							output += "<td>"+commentList[i].jobseekerCommentCommentWriter+"</td>";
							output += "<td>"+commentList[i].jobseekerCommunityCommentContent+"</td>";
						let jobseekerCommentTime = commentList[i].jobseekerCommentTime.substring(0, 10)+" ";
							jobseekerCommentTime += parseInt(commentList[i].jobseekerCommentTime.substring(12, 13))+9;
							jobseekerCommentTime += commentList[i].jobseekerCommentTime.substring(13, 16);
							output += "<td>"+jobseekerCommentTime+"</td>";
							output += "</tr>";
											}
						output += "</table>";
						console.log("@# output=>"+output);

						document.getElementById("comment-list").innerHTML = output;
						document.getElementById("jobseekerBoardListCommentWriter").value = "";
						document.getElementById("jobseekerBoardListCommentContent").value = "";
				}
				,error: function(){
					console.log("실패");
				}
			});//end of ajax
		}//end of script
	</script>
	<script>
		$(document).ready(function (){
			// 즉시실행함수
			(function(){
				console.log("@# document ready");
				var boardNum = "<c:out value='${content_view.jobseekerCommunityBoardNum}'/>";
				
				
			if (boardNum.trim() !== "") {
				console.log("@# boardNum=>"+boardNum);
				$.getJSON("/getFileList", {jobseekerCommunityBoardNum: boardNum}, function (arr){
					console.log("@# arr=>"+arr);

					var str="";

					$(arr).each(function (i, attach){
						if (attach.jobseekerBoardAttachImage) {
							var fileCallPath = encodeURIComponent(attach.jobseekerBoardAttachUploadPath +"/s_"+ attach.jobseekerBoardAttachUuid + "_" + attach.jobseekerBoardAttachFileName);
							str += "<li data-path='" + attach.jobseekerBoardAttachUploadPath + "'";
							str += " data-uuid='" + attach.jobseekerBoardAttachUuid + "' data-filename='" + attach.jobseekerBoardAttachFileName + "' data-type='" + attach.jobseekerBoardAttachImage + "'"
							str + " ><div>";
							str += "<span>"+attach.jobseekerBoardAttachFileName+"</span>";
							str += "<img src='/display?fileName="+fileCallPath+"'>";
							str += "</div></li>";
						} else {
							str += "<li data-path='" + attach.jobseekerBoardAttachUploadPath + "'";
							str += " data-uuid='" + attach.jobseekerBoardAttachUuid + "' data-filename='" + attach.jobseekerBoardAttachFileName + "' data-type='" + attach.jobseekerBoardAttachImage + "'"
							str + " ><div>";
							str += "<span>"+attach.jobseekerBoardAttachFileName+"</span>";
							str += "<img src='./resources/img/attach.png'>";
							str += "</div></li>";			
						}
					});//end of arr each

					$(".uploadResult ul").html(str);
				});//end of getJSON
			}

				$(".uploadResult").on("click", "li", function (e){
					console.log("@# uploadResult click");
					
					var liObj = $(this);
					console.log("@# path 01=>",liObj.data("path"));
					console.log("@# uuid=>",liObj.data("uuid"));
					console.log("@# filename=>",liObj.data("filename"));
					console.log("@# type=>",liObj.data("type"));
					
					var path = encodeURIComponent(liObj.data("path") +"/"+ liObj.data("uuid") + "_" + liObj.data("filename"));
					console.log("@# path 02=>",path);

					if (liObj.data("type")) {
						console.log("@# 01");
						console.log("@# view");

						showImage(path);
					} else {
						console.log("@# 02");
						console.log("@# download");

						//컨트롤러의 download 호출
						self.location="/download?fileName="+path;
					}
				});//end of uploadResult click

				function showImage(fileCallPath){
					// alert(fileCallPath);

					$(".bigPicture").css("display","flex").show();
					$(".bigPic")
						.html("<img src='/display?fileName="+fileCallPath+"'>")
						.animate({width: "100%", height: "100%"}, 1000);
				}

				$(".bigPicture").on("click", function (e){
					$(".bigPic")
						.animate({width: "0%", height: "0%"}, 1000);
					setTimeout(function (){
						$(".bigPicture").hide();
					}, 1000);//end of setTimeout
				});//end of bigPicture click
			})();
		}); // end of document ready
	</script>
</html>






