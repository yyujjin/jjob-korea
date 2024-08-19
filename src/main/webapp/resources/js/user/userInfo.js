
//회원 탈퇴
function deleteUser() {
    //window.confirm 확인,취소 창 - 탈퇴 클릭시 확인 작업
    //확인 클릭 시
    if (window.confirm("정말 탈퇴하시겠습니까?")) {
        var userId = $('#userId').val();
        console.log("userId:", userId);
        $.ajax({
            type: 'delete',
            url: '${pageContext.request.contextPath}/deleteUser',
            data: { userId: userId },
            success: function (response) {
                $.ajax({
                    type: 'get',
                    url: '${pageContext.request.contextPath}/logout', // 로그아웃 요청
                    success: function () {
                        alert('회원 탈퇴가 성공적으로 완료되었습니다. 로그아웃 처리되었습니다.');
                        window.location.href = '${pageContext.request.contextPath}/';
                    },
                    error: function (xhr, status, error) {
                        alert('로그아웃 중 문제가 발생했습니다. 다시 시도해주세요.');
                    }
                });
            },
            error: function (xhr, status, error) {
                alert('탈퇴 중 문제가 발생했습니다. 다시 시도해주세요.')
            }
        });
        //취소 클릭 시
    } else {
        console.log('탈퇴가 취소되었습니다.');
    }
}
