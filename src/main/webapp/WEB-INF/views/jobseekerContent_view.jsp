<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <html>

      <head>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
         <meta charset="UTF-8">
         <title>Insert title here</title>
         <style>
            table {
               width: 95%;
               border-collapse: collapse;
               border: none;
            }

            .wide-title {
               width: 600px;
               margin: 10px;
               font-size: 18px;
               font-weight: bold;
            }

            .notContent {
               padding-bottom: 20px;
               text-align: start;
               padding: 5px;
               border: none;
            }

            .ContentTitle {
               border: 2px solid black;
            }

            .BoardContent {
               width: 100%;
               height: 400px;
               padding: 3px;
               border: 2px solid black;
               text-align: center;
               border-radius: 3px;
            }

            .like_button {
               color: #00FF00;
               background-color: white;
               padding: 8px 0px;
               border: none;
               cursor: pointer;
               /* 버튼이 화면에 보이도록 확인 */
               display: inline-block;
            }

            .like_button.liked {
               background-color: white;
               /* 좋아요 상태에서 버튼 배경색 */
               color: #00FF00;
            }

            .mld_button:hover {
               color: blue;
            }

            .mld_button {
               background-color: white;
               color: black;
               padding: 5px 10px;
               border: none;
               cursor: pointer;
               float: right;
               margin: 10px;
            }

            .uploadResult {
               margin-top: 20px;
               width: 100%;
               padding: 10px;
            }

            .uploadResult ul {
               display: flex;
               flex-wrap: wrap;
               padding: 0;
               list-style-type: none;
               justify-content: center;
            }

            .uploadResult ul li {
               margin: 5px;
               padding: 10px;
               background-color: #ffffff00;
               text-align: center;
            }

            .uploadResult ul li img {
               max-width: 200px;
               height: auto;
            }

            /* 댓글 작성 버튼 스타일 */
            #commentWriteButton {
               background-color: #0057ff;
               /* 버튼 배경색 */
               color: white;
               /* 텍스트 색상 */
               padding: 5px 10px;
               /* 버튼 여백 */
               border: none;
               /* 테두리 제거 */
               cursor: pointer;
               /* 커서 변경 */
               float: right;
            }

            /* 댓글 작성 폼 스타일 */
            #commentForm {
               display: flex;
               justify-content: flex-end;
               margin-top: 20px;
               width: 95%;
            }

            #commentForm input[type="text"] {
               margin-right: 5px;
               padding: 5px;
               border: 1px solid #ccc;
            }

            #comment-list {
               margin-top: 10px;
            }

            #comment-list table {
               width: 95%;
               border-collapse: collapse;
            }

            #comment-list th {
               background-color: #0057ff;
               color: white;
            }

            #comment-list tr:nth-child(even) {
               background-color: #f9f9f9;
            }

            #comment-list th,
            #comment-list td {
               border: 1px solid #f2f2f2;
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
               <input type="hidden" name="jobseekerCommunityBoardName"
                  value="${content_view.jobseekerCommunityBoardName}">
               <thead>
                  <tr>
                     <td class="notContent">
                        조회수 ${content_view.jobseekerCommunityBoardHit} &nbsp; 좋아요
                        <button id="likeButton" class="like_button"
                           onclick="handleLike(${content_view.jobseekerCommunityBoardNum}); return false;">
                           <i id="likeIcon" class="fa-regular fa-heart"></i> <!-- 기본 상태 아이콘 -->
                        </button>
                        <span id="likeCount">${content_view.likes}</span> <!-- 좋아요 수를 표시 -->
                     </td>
                     <td class="notContent" style="text-align: right;">
                        글번호 ${content_view.jobseekerCommunityBoardNum} &nbsp; 작성자
                        ${content_view.jobseekerCommunityBoardName}
                     </td>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td class="ContentTitle" colspan="2">
                        <c:choose>
                           <c:when test="${user.name == content_view.jobseekerCommunityBoardName}">
                              <input type="text" name="jobseekerCommunityBoardTitle"
                                 value="${content_view.jobseekerCommunityBoardTitle}" class="wide-title">
                           </c:when>
                           <c:otherwise>
                              <div class="wide-title">&nbsp;<a style="color: blue;">제목</a>&nbsp;:&nbsp;${content_view.jobseekerCommunityBoardTitle}</div>
                           </c:otherwise>
                        </c:choose>
                     </td>
                  </tr>
                  <tr>
                     <td class="BoardContent" colspan="2" style="align-content: center;">

                        <div class="uploadResult hidden" id="uploadResult">
                           <ul id="photoList" class="photoList">
                              <!-- 사진나옴 -->
                           </ul>
                        </div>

                        <c:choose>
                           <c:when test="${user.name == content_view.jobseekerCommunityBoardName}">
                              <textarea class="BoardContent" name="jobseekerCommunityBoardContent">${content_view.jobseekerCommunityBoardContent}
                              </textarea>
                           </c:when>
                           <c:otherwise>
                              <div class="BoardContent" style="border: none;">
                                 ${content_view.jobseekerCommunityBoardContent}
                              </div>
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
                           formaction="/board">
                        &nbsp;&nbsp;
                        <c:if test="${user.name == content_view.jobseekerCommunityBoardName}">
                           <input class="mld_button" type="submit" value="삭제" formmethod="post" formaction="delete">
                        </c:if>
                     </td>
                  </tr>
               </tbody>
            </form>
         </table>

         <!-- 첨부파일 출력 -->

         <div class="bigPicture">
            <div class="bigPic">
               <!-- 누르면 큰 사진 나옴 -->
            </div>
         </div>

         <div id="commentForm">
            <input type="hidden" id="jobseekerCommentWriter" value="${user.name}">
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
         const handleLike = (boardNum) => {
            event.preventDefault(); // 버튼 기본 동작 방지
            $.ajax({
               type: "post",
               url: "${pageContext.request.contextPath}/like",
               data: {
                  jobseekerCommunityBoardNum: boardNum
               },
               success: function (response) {
                  if (response.redirectUrl) {
                     alert("로그인 후 이용해 주세요.");
                     window.location.href = response.redirectUrl;
                  } else {
                     const hasLiked = response.hasLiked; // 서버에서 좋아요 상태를 받아옴
                     alert(hasLiked ? "좋아요!" : "좋아요 취소!");

                     const likeIcon = $("#likeIcon");
                     if (hasLiked) {
                        likeIcon.removeClass("fa-regular fa-heart").addClass("fa-solid fa-heart");
                     } else {
                        likeIcon.removeClass("fa-solid fa-heart").addClass("fa-regular fa-heart");
                     }

                     $("#likeCount").text(response.likeCount); // 좋아요 수 업데이트
                  }
               },
               error: function (xhr) {
                  if (xhr.status === 401) {
                     const redirectUrl = xhr.responseJSON.redirectUrl;
                     if (redirectUrl) {
                        alert("로그인 후 이용해 주세요");
                        window.location.href = redirectUrl;
                     }
                  } else {
                     alert("좋아요 실패");
                  }
               }
            });
         };

         const commentWrite = () => {
            const writer = document.getElementById("jobseekerCommentWriter").value;

            //로그인 확인후 경고창 띄우고 링크연결
            if (!writer) {
               alert("로그인이 필요합니다.");
               window.location.href = "${pageContext.request.contextPath}/login";
               return;
            }

            const content = document.getElementById("jobseekerCommentContent").value;
            const no = "${content_view.jobseekerCommunityBoardNum}";

            $.ajax({
               type: "post"
               , data: {
                  jobseekerCommentCommentWriter: writer
                  , jobseekerCommunityCommentContent: content
                  , jobseekerCommunityBoardNum: no
               }
               , url: "${pageContext.request.contextPath}/jobseekercomment/jobseekerSave"
               , success: function (commentList) {
                  console.log("작성성공");
                  console.log(commentList);
                  updateCommentList(commentList); // updateCommentList 함수 호출
                  document.getElementById("jobseekerCommentWriter").value = "";
                  document.getElementById("jobseekerCommentContent").value = "";
               }
               , error: function () {
                  console.log("실패");
               }
            });//end of ajax
         } // end of commentWrite script

         const updateCommentList = (commentList) => {
            let output = "<table>";
            output += "<tr><th>댓글번호</th>";
            output += "<th>작성자</th>";
            output += "<th>내용</th>";
            output += "<th>작성시간</th></tr>";
            for (let i in commentList) {
               output += "<tr>";
               output += "<td>" + commentList[i].jobseekerCommentBoardNum + "</td>";
               output += "<td>" + commentList[i].jobseekerCommentCommentWriter + "</td>";
               output += "<td>" + commentList[i].jobseekerCommunityCommentContent + "</td>";
               let jobseekerCommentTime = commentList[i].jobseekerCommentTime.substring(0, 10) + " ";
               jobseekerCommentTime += parseInt(commentList[i].jobseekerCommentTime.substring(12, 13)) + 10;
               jobseekerCommentTime += commentList[i].jobseekerCommentTime.substring(13, 16);
               output += "<td>" + jobseekerCommentTime + "</td>";
               output += "</tr>";
            }
            output += "</table>";
            console.log("@# output=>" + output);

            document.getElementById("comment-list").innerHTML = output;
         } // end of updateCommentList script

         $(document).ready(function () {
            const boardNum = "${content_view.jobseekerCommunityBoardNum}";

            const loadComments = () => {
               $.ajax({
                  url: "${pageContext.request.contextPath}/jobseekercomment/getComments",
                  method: "GET",
                  data: { jobseekerCommunityBoardNum: boardNum },
                  success: function (commentList) {
                     updateCommentList(commentList); // updateCommentList 함수 호출
                  },
                  error: function () {
                     console.log("댓글 불러오기 실패");
                  }
               });
            };

            // 페이지 로드 시 댓글을 불러옵니다.
            loadComments();

            (function () {
               console.log("@# document ready");

               if (boardNum.trim() !== "") {
                  console.log("@# boardNum=>" + boardNum);
                  $.getJSON("${pageContext.request.contextPath}/getFileList", { jobseekerCommunityBoardNum: boardNum }, function (arr) {
                     console.log("@# arr=>" + arr);

                     let str = "";

                     $(arr).each(function (i, attach) {
                        if (attach.jobseekerBoardAttachImage) {
                           const fileCallPath = encodeURIComponent(attach.jobseekerBoardAttachUploadPath + "/s_" + attach.jobseekerBoardAttachUuid + "_" + attach.jobseekerBoardAttachFileName);
                           str += "<li data-path='" + attach.jobseekerBoardAttachUploadPath + "'";
                           str += " data-uuid='" + attach.jobseekerBoardAttachUuid + "' data-filename='" + attach.jobseekerBoardAttachFileName + "' data-type='" + attach.jobseekerBoardAttachImage + "'"
                           str + " ><div>";
                           str += "<span>" + attach.jobseekerBoardAttachFileName + "</span>";
                           str += "<img src='/display?fileName=" + fileCallPath + "'>";
                           str += "</div></li>";
                        } else {
                           str += "<li data-path='" + attach.jobseekerBoardAttachUploadPath + "'";
                           str += " data-uuid='" + attach.jobseekerBoardAttachUuid + "' data-filename='" + attach.jobseekerBoardAttachFileName + "' data-type='" + attach.jobseekerBoardAttachImage + "'"
                           str + " ><div>";
                           str += "<span>" + attach.jobseekerBoardAttachFileName + "</span>";
                           str += "<img src='./resources/img/attach.png'>";
                           str += "</div></li>";
                        }
                     });

                     $(".uploadResult ul").html(str);
                  });
               }

               $(".uploadResult").on("click", "li", function (e) {
                  console.log("@# uploadResult click");

                  var liObj = $(this);
                  console.log("@# path 01=>", liObj.data("path"));
                  console.log("@# uuid=>", liObj.data("uuid"));
                  console.log("@# filename=>", liObj.data("filename"));
                  console.log("@# type=>", liObj.data("type"));

                  var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
                  console.log("@# path 02=>", path);

                  if (liObj.data("type")) {
                     console.log("@# 01");
                     console.log("@# view");

                     showImage(path);
                  } else {
                     console.log("@# 02");
                     console.log("@# download");

                     //컨트롤러의 download 호출
                     self.location = "/download?fileName=" + path;
                  }
               });//end of uploadResult click

               function showImage(fileCallPath) {
                  // alert(fileCallPath);

                  $(".bigPicture").css("display", "flex").show();
                  $(".bigPic")
                     .html("<img src='/display?fileName=" + fileCallPath + "'>")
                     .animate({ width: "100%", height: "100%" }, 1000);
               }

               $(".bigPicture").on("click", function (e) {
                  $(".bigPic")
                     .animate({ width: "0%", height: "0%" }, 1000);
                  setTimeout(function () {
                     $(".bigPicture").hide();
                  }, 1000);//end of setTimeout
               });//end of bigPicture click
            })();
         }); // end of document ready
      </script>

      </html>