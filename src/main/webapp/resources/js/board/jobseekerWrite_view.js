
function fn_submit() {
//form 요소 자체
var formData = $("#frm").serialize();

$.ajax({
    type: "post"
    , data: formData
    , url: "/jobseekerWrite"
    , success: function (data) {
        alert("저장완료");
        location.href = "board";
    }
    , error: function () {
        alert("오류발생");
    }
});
}




$(document).ready(function (e){
var formObj = $("form[id='frm']");

$("button[type='submit']").on("click", function(e){
    e.preventDefault();

    var title = $("input[name='jobseekerCommunityBoardTitle']").val().trim();
    var content = $("textarea[name='jobseekerCommunityBoardContent']").val().trim();

    // 제목과 내용이 비어 있는지 확인
    if (title === "" && content === "") {
        alert("제목과 내용을 입력해 주세요.");
        return;

    }else if (title === "") {
        alert("제목을 입력해 주세요.");
        return;

    }else if (content === "") {
        alert("내용을 입력해 주세요.");
        return;
    }
    console.log("submit clicked");

    var str="";

        $(".uploadResult ul li").each(function (i, obj) {
            console.log("@# obj=>" + $(obj));
            console.log("@# obj=>" + $(obj).data());
            console.log("@# obj=>" + $(obj).data("filename"));
            // return;

            var jobj = $(obj);
            // JavaScript개체의 속성에 대한 목록을 표시
            console.dir(jobj);
            console.log("================================");
            console.log(jobj.data("filename"));
            console.log(jobj.data("uuid"));
            console.log(jobj.data("path"));
            console.log(jobj.data("type"));

            str += "<input type='hidden' name='attachList[" + i + "].jobseekerBoardAttachFileName' value='" + jobj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].jobseekerBoardAttachUuid' value='" + jobj.data("uuid") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].jobseekerBoardAttachUploadPath' value='" + jobj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].jobseekerBoardAttachImage' value='" + jobj.data("type") + "'>";
        });//end of uploadResult ul li

        console.log(str);
        // return;
        formObj.append(str).submit();
    });//end of button submit

    //확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
    //확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
    var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
    var maxSize = 5242880;//5MB

    function checkExtension(fileName, fileSize) {
        if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
        }
        if (regex.test(fileName)) {
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
        }
        return true;
    }

    $("input[type='file']").change(function (e) {
        var formData = new FormData();
        var inputFile = $("input[name='uploadFile']");
        //files : 파일정보
        var files = inputFile[0].files;

        for (var i = 0; i < files.length; i++) {
            console.log("@# files=>" + files[i].name);

            //파일크기와 종류중에서 거짓이면 리턴
            if (!checkExtension(files[i].name, files[i].size)) {
                return false;
            }

            //파일 정보를 formData에 추가
            formData.append("uploadFile", files[i]);
        }

        $.ajax({
            type: "post"
            , data: formData
            //컨트롤러단 호출
            , url: "uploadAjaxAction"
            //processData : 기본은 key/value 를 Query String 으로 전송하는게 true
            //(파일 업로드는 false)
            , processData: false
            //contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
            //첨부파일은 false : multipart/form-data로 전송됨
            , contentType: false
            , success: function (result) {
                alert("Uploaded");
                console.log(result);
                //파일정보들을 함수로 보냄
                showUploadResult(result);//업로드 결과 처리 함수
            }
        });//end of ajax

        function showUploadResult(uploadResultArr) {
            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            var uploadUL = $(".uploadResult ul");
            var str = "";

            $(uploadResultArr).each(function (i, obj) {
                //image type
                if (obj.jobseekerBoardAttachImage) {
                    console.log("@# obj.uploadPath=>"
                        + obj.jobseekerBoardAttachUploadPath);
                    console.log("@# obj.uuid=>"
                        + obj.jobseekerBoardAttachUuid);
                    console.log("@# obj.fileName=>"
                        + obj.jobseekerBoardAttachFileName);

                    var fileCallPath = encodeURIComponent(
                        obj.jobseekerBoardAttachUploadPath + "/s_" +
                        obj.jobseekerBoardAttachUuid + "_" +
                        obj.jobseekerBoardAttachFileName);
                    // str += "<li><div>";

                    str += "<li data-path='" + obj.jobseekerBoardAttachUploadPath + "'";
                    str += " data-uuid='" + obj.jobseekerBoardAttachUuid +
                        "' data-filename='" + obj.jobseekerBoardAttachFileName +
                        "' data-type='" + obj.jobseekerBoardAttachImage + "'"
                    str + " ><div>";

                    // 이미지 파일 깨짐 수정
                    str += "<span>" + obj.jobseekerBoardAttachFileName + "</span>";
                    str += "<img src='/display?fileName=" + fileCallPath + "'>";//이미지 출력 처리(컨트롤러단)
                    str += "<span data-file=\'" + fileCallPath + "\'data-type='image'> x </span>";
                    str += "</div></li>";
                } else {

                    var fileCallPath = encodeURIComponent(
                        obj.jobseekerBoardAttachUploadPath + "/" +
                        obj.jobseekerBoardAttachUuid + "_" +
                        obj.jobseekerBoardAttachFileName);
                    // str += "<li><div>";

                    str += "<li data-path='" + obj.jobseekerBoardAttachUploadPath + "'";
                    str += " data-uuid='" + obj.jobseekerBoardAttachUuid +
                        "' data-filename='" + obj.jobseekerBoardAttachFileName +
                        "' data-type='" + obj.jobseekerBoardAttachImage + "'"
                    str + " ><div>";

                    str += "<span>" + obj.jobseekerBoardAttachFileName + "</span>";
                    // 첨부파일 이미지 깨지는 이슈 절대 경로로 수정
                    str += "<img src='${pageContext.request.contextPath}/resources/img/attach.png'>";
                    str += "<span data-file=\'" + fileCallPath + "\'data-type='file'> x </span>";
                    str += "</div></li>";
                }
            });//end of each

            //div class 에 파일 목록 추가
            uploadUL.append(str);
        }

        $(".uploadResult").on("click", "span", function () {
            var targetFile = $(this).data("file");
            var type = $(this).data("type");
            var uploadResultItem = $(this).closest("li");

            console.log("@# targetFile=>" + targetFile);
            console.log("@# type=>" + type);
            console.log("@# uploadResultItem=>" + uploadResultItem);

            //컨트롤러 단에서 업로드된 실제파일 삭제
            $.ajax({
                type: "post"
                , data: { fileName: targetFile, type: type }
                , url: "deleteFile"
                , success: function (result) {
                    alert(result);
                    //브라우저에서 해당 썸네일이나 첨부파일이미지 제거
                    uploadResultItem.remove();
                }
            });//end of ajax
        });//end of click
    });//end of change
});//end of ready
