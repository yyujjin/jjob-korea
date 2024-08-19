<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <title>게시물 작성</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="../../resources/css/board/jobseekerWrite_view.css" />
    <script src="../../resources/js/board/jobseekerWrite_view.js" defer></script>

</head>

<body>
    <div class="form-container">
        <form id="frm" method="post" action="/jobseekerWrite">
            <table>
                <tr>
                    <td class="notContent width-name" style="text-align: end;"> 작성자 ${userid}</td>
                    <input type="hidden" name="jobseekerCommunityBoardName" value="${userid}">
                </tr>
                <tr>
                    <td class="notContent">
                        <a style="color: blue;">제목</a> :
                        <input type="text" name="jobseekerCommunityBoardTitle" placeholder="제목을 입력해주세요."
                               class="width-title">
                    </td>
                </tr>
                <tr>
                    <td class="BoardContent">
                        <textarea name="jobseekerCommunityBoardContent" placeholder="내용을 입력해주세요." rows="10"
                                  class="BoardContent"></textarea>
                        <div class="uploadResult">
                            <ul></ul>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="upload-list">
                <a href="/board">목록보기</a>
                <button type="submit">등록</button>
            </div>
        </form>
        <div class="uploadDiv">
            <label for="uploadFile">첨부파일</label>
            <span style="color: gainsboro; font-size: 13px;">첨부파일은 내용 제일 상단에 게재됩니다.</span>
            <input type="file" id="uploadFile" name="uploadFile" multiple>
        </div>
    </div>
</body>

</html>
