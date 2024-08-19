
$(document).ready(function() {
   $(".boardDate").each(function() {
       var utcDate = $(this).text().trim();
       if (utcDate) {
           var dateObj = new Date(utcDate.replace(/-/g, '/'));

           dateObj.setHours(dateObj.getHours() -9);

           var year = dateObj.getFullYear();
           var month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
           var day = ('0' + dateObj.getDate()).slice(-2);
           var hours = ('0' + dateObj.getHours()).slice(-2);
           var minutes = ('0' + dateObj.getMinutes()).slice(-2);

           var formattedDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;

           $(this).text(formattedDate);
       }
   });
});



$(document).ready(function() {
    var boardList = ${list}; // JSP에서 받아온 목록

    // 각 게시물의 날짜를 UTC에서 KST로 변환하여 표시
    $(".boardDate").each(function() {
        var utcDate = $(this).text(); // 텍스트로 가져온 UTC 시간 문자열
        var dateObj = new Date(utcDate.replace(/-/g, '/')); // '-'를 '/'로 변경하여 파싱

        // UTC 시간에 9시간을 추가하여 KST로 변환
        dateObj.setHours(dateObj.getHours() +9);

        // 변환된 날짜를 원하는 형식으로 포맷
        var year = dateObj.getFullYear();
        var month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
        var day = ('0' + dateObj.getDate()).slice(-2);
        var hours = ('0' + dateObj.getHours()).slice(-2);
        var minutes = ('0' + dateObj.getMinutes()).slice(-2);
        var seconds = ('0' + dateObj.getSeconds()).slice(-2);

        var formattedDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;

        // 변환된 날짜를 해당 span 요소에 표시
        $(this).text(formattedDate);
    });
});



var actionForm = $("#actionForm");

//	페이지번호 처리
// $(".paginate_button").on("click", function (e){
$(".paginate_button a").on("click", function (e){
    //기본 동작 막음: 페이지 링크를 통해서 이동
    e.preventDefault();
    console.log("click~!!!");
    console.log("@# href=>"+$(this).attr("href"));


    var bno = actionForm.find("input[name='jobseekerCommunityBoardNum']").val();
           if(bno != ""){
               actionForm.find("input[name='jobseekerCommunityBoardNum']").remove();
           }

    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    // actionForm.submit();
    actionForm.attr("action","board").submit();
});//end of paginate_button clcik

// 	게시글 처리
$(".move_link").on("click", function(e){
    e.preventDefault();

    console.log("@# move_link click~!!!");
    console.log("@# href=>"+$(this).attr("href"));

    var targetBno = $(this).attr("href");


    var bno = actionForm.find("input[name='jobseekerCommunityBoardNum']").val();
    if(bno != ""){
        actionForm.find("input[name='jobseekerCommunityBoardNum']").remove();
    }

    actionForm.append("<input type='hidden' name='jobseekerCommunityBoardNum' value='"+targetBno+"'>");
    // actionForm.submit();
    // 컨트롤러에 content_view 로 찾아감
    actionForm.attr("action","jobseekerContent_view").submit();
});//end of move_link click

var searchForm = $("#searchForm");

// 	Search 버튼 클릭
// $("#searchForm").on("click", function(){
$("#searchForm button").on("click", function(){
    // alert("검색");

    // 아래는 검색종류까지 할때 참고
    // if(!searchForm.find("option:selected").val()){
    // 	alert("검색종류를 선택하세요.");
    // 	return false;
    // }

    if(searchForm.find("option:selected").val() != "" && !searchForm.find("input[name='keyword']").val()){
        alert("키워드를 입력하세요.");
        return false;
    }
    searchForm.attr("action","board").submit();
});//end of searchForm click

// 	type 콤보박스 변경
$("#searchForm select").on("change", function(){
    // 전체일때
    if(searchForm.find("option:selected").val() == ""){
        // 키워드를 널값으로 변경
        searchForm.find("input[name='keyword']").val("");
    }
});//end of searchForm select change
