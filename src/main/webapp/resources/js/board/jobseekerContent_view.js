
// 좋아요 기능 처리
const handleLike = (event, boardNum) => {
       event.preventDefault();
       event.stopPropagation();

       $.ajax({
           type: "post",
           url: `${pageContext.request.contextPath}/like`,
           data: {
               jobseekerCommunityBoardNum: boardNum
           },
           success: function(response) {
               if (response.hasLiked !== undefined) {
                   const hasLiked = response.hasLiked;
                   const likeIcon = $("#likeIcon");
                   if (hasLiked) {
                       likeIcon.removeClass("fa-regular fa-heart").addClass("fa-solid fa-heart");
                   } else {
                       likeIcon.removeClass("fa-solid fa-heart").addClass("fa-regular fa-heart");
                   }

                   const likeCount = response.likeCount; // 좋아요 수 업데이트
                   $("#likeCount").text(likeCount); // 좋아요 수를 표시
               }
           },
       });
   };
const commentWrite = () => {
const writer = document.getElementById("jobseekerCommentWriter").value;
const content = document.getElementById("jobseekerCommentContent").value;
const no = "${content_view.jobseekerCommunityBoardNum}";
// 댓글 내용 확인
if (content.trim() === "") {
    alert("댓글을 입력해 주세요.");
    return;
}

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
