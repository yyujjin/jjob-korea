<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        padding: 20px;
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
	}
	.upload-list {
	    text-align: right;
	    margin-top: 10px;
	}
	.upload-list button,
	.upload-list a {
	    background-color: #0057ff;
	    color: white;
	    padding: 5px 10px;
	    border: none;
	    cursor: pointer;
	    text-decoration: none; /* 밑줄 제거 */
	    display: inline-block; /* 버튼과 앵커 태그를 동일하게 inline-block으로 설정 */
	    font-size: 14px; /* 글씨 크기 조정 */
	    margin: 5px; /* 여백 조정 */
	}
    .button-container a {
        display: inline-block;
        margin-left: 10px;
    }
	.uploadDiv {
        text-align: left;
        margin-top: 20px;
    }
    .uploadDiv input[type="file"] {
        display: none;
    }
    .uploadDiv label {
        background-color: #0057ff;
        color: white;
        padding: 5px 10px;
        text-decoration: none;
        border: none;
        cursor: pointer;
    }
    .uploadResult {
        width: 100%;
        background-color: #abaaaa;
        padding: 10px;
        margin-top: 10px;
    }
    .uploadResult ul {
        display: flex;
        flex-wrap: wrap;
        padding: 0;
        list-style-type: none;
    }
    .uploadResult ul li {
        list-style: none;
        padding: 10px;
        background: #fff;
        margin: 5px;
        border: 1px solid #ccc;
        text-align: center;
    }
    .uploadResult ul li img {
        width: 50px;
        height: auto;
    }
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script>
	function fn_submit(){
		//form 요소 자체
		var formData = $("#frm").serialize();

		$.ajax({
			 type:"post"
			,data:formData
			,url:"/jobseekerWrite"
			,success: function(data){
				alert("저장완료");
				location.href="jobseekerBoardList";
			}
			,error: function(){
				alert("오류발생");
			}
		});
	}
</script>
</head>
<body>
	<div class="form-container">
		<form id="frm" method="post" action="/jobseekerWrite">
			<table>
				<tr>
					<td class="notContent" class="width-name">아이디 : ${user.memId}</td>
					<input type="hidden" name="jobseekerCommunityBoardName" value="${user.memId}">
				<tr>
					<td class="notContent">
					<input  placeholder="제목을 입력하세요" type="text" 
					name="jobseekerCommunityBoardTitle" class="width-title"></td>
				</tr>
				<tr>
					<td class="BoardContent">
					<textarea placeholder="내용을 입력하세요" class="BoardContent" rows="10" 
					name="jobseekerCommunityBoardContent"></textarea></td>
				</tr>
			</table>
			<div class="upload-list">
				<button type="submit">입력</button>
				<a href="/requestPage/jobseekerBoardList">목록보기</a>
			</div>
		</form>
		<div class="uploadDiv">
			<label for="uploadFile">첨부파일</label>
			<input type="file" id="uploadFile" name="uploadFile" multiple>
		</div>
	
		<div class="uploadResult">
			<ul></ul>
		</div>
	</div>
</body>
</html>
<script>
$(document).ready(function (e){
	var formObj = $("form[id='frm']");

	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");

		var str="";

		$(".uploadResult ul li").each(function (i, obj){
			console.log("@# obj=>"+$(obj));
			console.log("@# obj=>"+$(obj).data());
			console.log("@# obj=>"+$(obj).data("filename"));
			// return;

			var jobj = $(obj);
			// JavaScript개체의 속성에 대한 목록을 표시
			console.dir(jobj);
			console.log("================================");
			console.log(jobj.data("filename"));
			console.log(jobj.data("uuid"));
			console.log(jobj.data("path"));
			console.log(jobj.data("type"));

			str += "<input type='hidden' name='attachList["+i+"].jobseekerBoardAttachFileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].jobseekerBoardAttachUuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].jobseekerBoardAttachUploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].jobseekerBoardAttachImage' value='"+jobj.data("type")+"'>";
		});//end of uploadResult ul li

		console.log(str);
		// return;
		formObj.append(str).submit();
	});//end of button submit

	//확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
	//확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
	var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
	var maxSize = 5242880;//5MB

	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}

	$("input[type='file']").change(function (e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		//files : 파일정보
		var files = inputFile[0].files;

		for(var i=0; i<files.length; i++){
			console.log("@# files=>"+files[i].name);

			//파일크기와 종류중에서 거짓이면 리턴
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}

			//파일 정보를 formData에 추가
			formData.append("uploadFile",files[i]);
		}

		$.ajax({
			 type: "post"
			,data: formData
			//컨트롤러단 호출
			,url: "uploadAjaxAction"
//processData : 기본은 key/value 를 Query String 으로 전송하는게 true
//(파일 업로드는 false)
			,processData: false
//contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
//첨부파일은 false : multipart/form-data로 전송됨
			,contentType: false
			,success: function(result){
				alert("Uploaded");
				console.log(result);
				//파일정보들을 함수로 보냄
				showUploadResult(result);//업로드 결과 처리 함수 
			}
		});//end of ajax

		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){
				return;
			}

			var uploadUL = $(".uploadResult ul");
			var str="";

			$(uploadResultArr).each(function (i, obj){
				//image type
				if (obj.jobseekerBoardAttachImage) {
					console.log("@# obj.uploadPath=>"
					+obj.jobseekerBoardAttachUploadPath);
					console.log("@# obj.uuid=>"
					+obj.jobseekerBoardAttachUuid);
					console.log("@# obj.fileName=>"
					+obj.jobseekerBoardAttachFileName);

					var fileCallPath = encodeURIComponent(
					obj.jobseekerBoardAttachUploadPath +"/s_"+ 
					obj.jobseekerBoardAttachUuid + "_" + 
					obj.jobseekerBoardAttachFileName);
					// str += "<li><div>";

					str += "<li data-path='" + obj.jobseekerBoardAttachUploadPath + "'";
					str += " data-uuid='" + obj.jobseekerBoardAttachUuid +
					 "' data-filename='" + obj.jobseekerBoardAttachFileName +
					  "' data-type='" + obj.jobseekerBoardAttachImage + "'"
					str + " ><div>";

					// 이미지 파일 깨짐 수정
					str += "<span>"+obj.jobseekerBoardAttachFileName+"</span>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";//이미지 출력 처리(컨트롤러단)
					str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'> x </span>";
					str += "</div></li>";
				} else {

					var fileCallPath = encodeURIComponent(
						obj.jobseekerBoardAttachUploadPath +"/"+ 
						obj.jobseekerBoardAttachUuid + "_" + 
						obj.jobseekerBoardAttachFileName);
					// str += "<li><div>";

					str += "<li data-path='" + obj.jobseekerBoardAttachUploadPath + "'";
					str += " data-uuid='" + obj.jobseekerBoardAttachUuid +
					 "' data-filename='" + obj.jobseekerBoardAttachFileName +
					  "' data-type='" + obj.jobseekerBoardAttachImage + "'"
					str + " ><div>";

					str += "<span>"+obj.jobseekerBoardAttachFileName+"</span>";
					// 첨부파일 이미지 깨지는 이슈 절대 경로로 수정
					str += "<img src='${pageContext.request.contextPath}/resources/img/attach.png'>";
					str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> x </span>";
					str += "</div></li>";
				}
			});//end of each

			//div class 에 파일 목록 추가
			uploadUL.append(str);
		}

		$(".uploadResult").on("click","span",function(){
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var uploadResultItem = $(this).closest("li");

			console.log("@# targetFile=>"+targetFile);
			console.log("@# type=>"+type);
			console.log("@# uploadResultItem=>"+uploadResultItem);

			//컨트롤러 단에서 업로드된 실제파일 삭제
			$.ajax({
				 type: "post"
				,data: {fileName: targetFile, type: type}
				,url: "deleteFile"
				,success: function(result){
					alert(result);
					//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
					uploadResultItem.remove();
				}
			});//end of ajax
		});//end of click
	});//end of change
});//end of ready
</script>




