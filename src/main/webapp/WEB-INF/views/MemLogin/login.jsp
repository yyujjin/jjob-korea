<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .tab-container {
        width: 400px;
        margin: 50px auto;
        border: 1px solid black;
        overflow: hidden;
    }
    .tabs {
        display: flex;
        cursor: pointer;
    }
    .tab {
        flex: 1;
        padding: 15px 20px;
        text-align: center;
        background-color: #f1f1f1;
        border-bottom: 2px solid transparent;
    }
    .tab.active {
        background-color: #007bff;
        color: white;
        border-bottom: 2px solid #007bff;
    }
    #loginForm {
        width: 400px;
        padding: 20px;
        border-radius: 5px;
        margin: auto;
    }
    .input-container {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    .input-container input {
        flex: 1;
        padding: 12px 20px;
        border: 1px solid black;
        border-radius: 4px;
        box-sizing: border-box;
    }
    button[type="submit"] {
        width: 100%;
        background-color: blue;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .register-link {
        display: block;
        text-align: center;
        margin-top: 10px;
        cursor: pointer;
        color: blue;
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="tab-container">
        <div class="tabs">
            <div class="tab active" data-tab="individual">개인회원</div>
            <div class="tab" data-tab="enterprise">기업회원</div>
        </div>
    </div>
    <div id="loginForm">
        <form id="individualForm" method="post" action="login_yn">
            <input type="hidden" name="loginType" value="individual">
            <div class="input-container">
                <input type="text" name="memId" placeholder="아이디" required>
            </div>
            <div class="input-container">
                <input type="password" name="memPwd" placeholder="비밀번호" required>
            </div>
            <button type="submit">로그인</button>
            <span class="register-link" data-type="individual">회원가입</span>
        </form>

        <form id="companyForm" method="post" action="login_yn" style="display: none;">
            <input type="hidden" name="loginType" value="enterprise">
            <div class="input-container">
                <input type="text" name="memId" placeholder="기업회원아이디" required>
            </div>
            <div class="input-container">
                <input type="password" name="memPwd" placeholder="비밀번호" required>
            </div>
            <button type="submit">로그인</button>
            <span class="register-link" data-type="enterprise">회원가입</span>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
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
                    } else {
                        window.location.href = 'register?type=enterprise';
                    }
                });
            });
        });
    </script>
</body>
</html>
