<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	table {
	    width: 100%;
	    border-collapse: collapse;
	    border: 1px solid #ccc;
	}
	th, td {
	    padding-bottom: 20px;
	    text-align: left;
	    border: 1px solid #ccc;
	}
	.wide-name {
        width: 25%;
    }
	.wide-title {
        width: 50%;
    }
	.notContent {
		padding: 5px;
		margin: 5;
	}
	.BoardContent{
		width: 85%;
        height: 400px; /* 높이 조정 */
        padding: 20px; /* 내부 여백 */
        border: 1px solid #ccc; /* 테두리 */
		margin: 10px;
	}
	.mld_button { /*수정/목록/삭제*/
		background-color: #0057ff; /* 버튼 배경색 */
        color: white; /* 텍스트 색상 */
        padding: 5px 10px; /* 버튼 여백 */
        border: none; /* 테두리 제거 */
        cursor: pointer; /* 커서 변경 */
		float: right;
		margin: 10px;
	}

	.uploadResult {
	    margin-top: 20px;
	    background-color: #f0f0f0;
	    padding: 10px;
	}
	.uploadResult ul {
	    display: flex;
	    flex-wrap: wrap;
	    padding: 0;
	    list-style-type: none;
	}
	.uploadResult ul li {
	    margin: 5px;
	    padding: 10px;
	    border: 1px solid #ccc;
	    background-color: #fff;
	    text-align: center;
	}
	.uploadResult ul li img {
	    max-width: 100px;
	    height: auto;
	}
	/* 댓글 작성 버튼 스타일 */
    #commentWriteButton {
        background-color: #0057ff; /* 버튼 배경색 */
        color: white; /* 텍스트 색상 */
        padding: 5px 10px; /* 버튼 여백 */
        border: none; /* 테두리 제거 */
        cursor: pointer; /* 커서 변경 */
		float: right;
    }
	 /* 댓글 작성 폼 스타일 */
	 #commentForm {
        display: flex;
        justify-content: flex-end; /* 오른쪽 정렬 */
        margin-top: 20px; /* 상단 여백 */
    }
    #commentForm input[type="text"] {
        margin-right: 5px; /* 오른쪽 여백 */
        padding: 5px; /* 내부 여백 */
        border: 1px solid #ccc; /* 테두리 */

    }
	#comment-list {
	    margin-top: 10px;
	}
	#comment-list table {
	    width: 100%;
	    border-collapse: collapse;
	}
	#comment-list th {
        background-color: #0057ff;
        color: white;
    }
	#comment-list tr:nth-child(even) {
        background-color:  #f9f9f9;
    }
	#comment-list th, #comment-list td {
	    border: 1px solid  #f2f2f2;
	    padding: 8px;
	    text-align: center;
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
			<!-- 수정시 작성자 아이디 기억 -->
			<input type="hidden" name="jobseekerCommunityBoardName" 
			value="${content_view.jobseekerCommunityBoardName}"> 

			<tr>
				<td class="notContent">번호
					${content_view.jobseekerCommunityBoardNum}
				</td>
			</tr>
			<tr>
				<td class="notContent">조회수
					${content_view.jobseekerCommunityBoardHit}
				</td>
			</tr>
			<tr>
				<td class="notContent">이름
					${content_view.jobseekerCommunityBoardName}
				</td>
			</tr>
			<tr>
				<td class="notContent">제목
					<c:choose>
						<c:when test="${user.name == content_view.jobseekerCommunityBoardName}">
							<input type="text" name="jobseekerCommunityBoardTitle" 
							value="${content_view.jobseekerCommunityBoardTitle}" class="wide-title">
						</c:when>
						<c:otherwise>
							${content_view.jobseekerCommunityBoardTitle}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td class="BoardContent">
				<c:choose>
					<c:when test="${user.name == content_view.jobseekerCommunityBoardName}">
						<textarea class="BoardContent" name="jobseekerCommunityBoardContent">${content_view.jobseekerCommunityBoardContent}</textarea>
					</c:when>
					<c:otherwise>
						<div class="BoardContent">${content_view.jobseekerCommunityBoardContent}</div>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;">
					<c:if test="${user.name == content_view.jobseekerCommunityBoardName}">
						<input class="mld_button" type="submit" value="수정">
					</c:if>
					&nbsp;&nbsp;<input class="mld_button" type="submit" value="목록보기" formmethod="get" 
					formaction="/requestPage/jobseekerBoardList">
					&nbsp;&nbsp;
					<c:if test="${user.name == content_view.jobseekerCommunityBoardName}">
						<input class="mld_button" type="submit" value="삭제" formmethod="post" formaction="delete">
					</c:if>
				</td>
			</tr>
		</form>
	</table>
	<!-- 첨부파일 출력 -->
	첨부파일
	<div class="bigPicture">
		<div class="bigPic">

		</div>
	</div>
	<div class="uploadResult">
		<ul>

		</ul>
	</div>

	<div id="commentForm">
		<input type="hidden" id="jobseekerCommentWriter" value="${user}">
		<input type="text" id="jobseekerCommentContent" placeholder="댓글을 작성해주세요">
		<button id="commentWriteButton" onclick="commentWrite()">댓글작성</button>
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
			
			//로그인 확인후 경고창 띄우고 링크연결
			if(!writer){
				alert("로그인이 필요합니다.");
				window.location.href = "${pageContext.request.contextPath}/login";
				return;
			}
			
			const content = document.getElementById("jobseekerCommentContent").value;
			const no = "${content_view.jobseekerCommunityBoardNum}";

			$.ajax({
				 type: "post"
				,data: {
					jobseekerCommentCommentWriter: writer
				   ,jobseekerCommunityCommentContent: content
				   ,jobseekerCommunityBoardNum: no
				}
				,url: "${pageContext.request.contextPath}/jobseekercomment/jobseekerSave"
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
							jobseekerCommentTime += parseInt(commentList[i].jobseekerCommentTime.substring(12, 13))+10;
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
			const boardNum = "${content_view.jobseekerCommunityBoardNum}";

			const loadComments = () => {
				$.ajax({
					url: "${pageContext.request.contextPath}/jobseekercomment/getComments",
					method: "GET",
					data: { jobseekerCommunityBoardNum: boardNum },
					success: function(commentList) {
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
							jobseekerCommentTime += parseInt(commentList[i].jobseekerCommentTime.substring(12, 13))+10;
							jobseekerCommentTime += commentList[i].jobseekerCommentTime.substring(13, 16);
							output += "<td>"+jobseekerCommentTime+"</td>";
							output += "</tr>";
						}
						output += "</table>";
						document.getElementById("comment-list").innerHTML = output;
					},
					error: function() {
						console.log("댓글 불러오기 실패");
					}
				});
			};

			// 페이지 로드 시 댓글을 불러옵니다.
			loadComments();

			(function(){
				console.log("@# document ready");

				if (boardNum.trim() !== "") {
					console.log("@# boardNum=>"+boardNum);
					$.getJSON("${pageContext.request.contextPath}/getFileList", {jobseekerCommunityBoardNum: boardNum}, function (arr){
						console.log("@# arr=>"+arr);

						let str="";

						$(arr).each(function (i, attach){
							if (attach.jobseekerBoardAttachImage) {
								const fileCallPath = encodeURIComponent(attach.jobseekerBoardAttachUploadPath +"/s_"+ attach.jobseekerBoardAttachUuid + "_" + attach.jobseekerBoardAttachFileName);
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
						});

						$(".uploadResult ul").html(str);
					});
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






