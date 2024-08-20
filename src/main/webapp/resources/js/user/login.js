document.addEventListener('DOMContentLoaded', function () {
    const tabs = document.querySelectorAll('.tab');
    const individualForm = document.getElementById('individualForm');
    const companyForm = document.getElementById('companyForm');
    const registerLinks = document.querySelectorAll('.register-link');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            if (tab.dataset.tab === 'enterprise') {
                individualForm.style.display = 'none';
                companyForm.style.display = 'block';
            } else {
                individualForm.style.display = 'block';
                companyForm.style.display = 'none';
            }
        });
    });

    registerLinks.forEach(link => {
        link.addEventListener('click', () => {
            const type = link.dataset.type;
            if (type === 'individual') {
                window.location.href = 'register?type=individual';
            } else if (type === 'enterprise') {
                window.location.href = 'register?type=enterprise';
            }
        });
    });

    // 로그인 실패 시 메시지 출력
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('error')) {
        alert('아이디 또는 비밀번호가 일치하지 않습니다. 다시 확인 후 입력해주시기 바랍니다.');
    }
});
