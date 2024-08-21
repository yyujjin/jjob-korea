//회원 수정
function updateUser(event) {
    event.preventDefault(); // 기본 폼 제출 방지
	if (window.confirm("정말 수정 하시겠습니까?")) {
    const form = document.getElementById('user-info-form');
    const formData = new FormData(form);

    fetch(form.action, {
        method: 'PUT',
        body: formData,
    })
    .then(response => response.text())
    .then(result => {
        if (result === "success") {
            alert("회원 정보가 성공적으로 수정되었습니다.");
			window.location.href = '/';
        } else {
            alert("회원 정보 수정에 실패했습니다.");
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
	}
}
//회원 탈퇴
function deleteUser() {
    if (window.confirm("정말 탈퇴하시겠습니까?")) {
        var userId = $('#userId').val();
        console.log("userId:", userId);
        $.ajax({
            type: 'DELETE',
            url: '/deleteUser',
            data: { userId: userId },
            success: function (response) {
                alert('회원 탈퇴가 성공적으로 완료되었습니다.');
                window.location.href = '/logout'; 
            },
            error: function (xhr, status, error) {
                alert('탈퇴 중 문제가 발생했습니다. 다시 시도해주세요.');
            }
        });
    } 
}
