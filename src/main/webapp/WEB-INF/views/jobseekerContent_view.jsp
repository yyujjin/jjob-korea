<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <title>게시물 수정</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="../../resources/css/board/jobseekerContent_view.css" />
    <script src="../../resources/js/board/jobseekerContent_view.js" defer></script>

</head>

<body>
    <table width="500" border="1">
        <form method="post" action="jobseekerModify">
            <input type="hidden" name="jobseekerCommunityBoardNum" value="${content_view.jobseekerCommunityBoardNum}">
            <input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
            <input type="hidden" name="amount" value="${pageMaker.amount}">
            <input type="hidden" name="jobseekerCommunityBoardName" value="${content_view.jobseekerCommunityBoardName}">

            <thead>
                <tr>
                    <td class="notContent">
                        조회수 ${content_view.jobseekerCommunityBoardHit} &nbsp; 좋아요
                        <button id="likeButton" class="like_button" type="button"
                                onclick="handleLike(event, ${content_view.jobseekerCommunityBoardNum}); return false;">
                            <!-- 서버에서 받아온 좋아요 상태에 따라 아이콘 설정 -->
                            <i id="likeIcon" class="<c:choose>
                                                       <c:when test="${hasLiked}">
                                                           fa-solid fa-heart
                                                       </c:when>
                                                       <c:otherwise>
                                                           fa-regular fa-heart
                                                       </c:otherwise>
                                                     </c:choose>"></i>
                        </button>
                        <span id="likeCount">${likeCount}</span> <!-- 좋아요 수를 표시 -->
                    </td>
                    <td class="notContent" style="text-align: right;">
                        글번호 ${content_view.jobseekerCommunityBoardNum} &nbsp; 작성자 ${content_view.jobseekerCommunityBoardName}
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="ContentTitle" colspan="2">
                        <c:choose>
                            <c:when test="${user.name == content_view.jobseekerCommunityBoardName}">
                                <input type="text" name="jobseekerCommunityBoardTitle" value="${content_view.jobseekerCommunityBoardTitle}" class="wide-title">
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
                                <!-- 사진 나옴 -->
                            </ul>
                        </div>

                        <c:choose>
                            <c:when test="${user.name == content_view.jobseekerCommunityBoardName}">
                                <textarea class="BoardContent" name="jobseekerCommunityBoardContent">${content_view.jobseekerCommunityBoardContent}</textarea>
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
                        &nbsp;&nbsp;<input class="mld_button" type="submit" value="목록보기" formmethod="get" formaction="/board">
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

    <!-- 댓글 작성 폼 -->
    <div id="commentForm">
        <input type="hidden" id="jobseekerCommentWriter" value="${user.name}">
        <input type="text" id="jobseekerCommentContent" placeholder="댓글을 작성해주세요">
        <button id="commentWriteButton" onclick="commentWrite()">댓글작성</button>
    </div>

    <!-- 댓글 목록 -->
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

</html>
