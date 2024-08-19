
document.addEventListener('DOMContentLoaded', function () {
    Swal.fire({
        text: '회원가입이 완료되었습니다.',
        icon: 'success',
        confirmButtonColor: '#0000FF',
        confirmButtonText: '로그인 화면으로 가기',
        background: 'rgba(255, 255, 255, 0.8)',  // 알림창 배경색을 약간 투명하게 설정
        color: '#000',  // 텍스트 색상
        backdrop: `
            rgba(255, 255, 255, 0.8)
            left top
            no-repeat
            `,  // 알림창 뒤 배경 스타일
            customClass: {
                popup: 'swal2-custom-popup', // 팝업 창에 대한 클래스
                title: 'swal2-custom-title', // 제목에 대한 클래스
                icon: 'swal2-custom-icon',   // 아이콘에 대한 클래스
                confirmButton: 'swal2-custom-confirm-button' // 확인 버튼에 대한 클래스
            }
        }).then(() => {
            window.location.href = '/login';
        });
    });
