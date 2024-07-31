<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                overflow: hidden;
            }

            .tabs {
                display: flex;
                cursor: pointer;
            }

            .tab {
                border: 1px solid black;
                flex: 1;
                padding: 15px 20px;
                text-align: center;
                color: black;
                border-width: 1px 1px 0 1px;
            }

            .tab.active {
                color: black;
            }

            #loginForm {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                width: 400px;
                margin: 0 auto;
            }

            .input-container {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                text-align: center;
                width: 100%;
            }

            .input-container label {
                width: 60px;
                margin-right: 10px;
                font-size: 13px;
            }

            .input-container input {
                flex: 1;
                width: 200px;
                padding: 5px;
                border-radius: 3px;
            }

            .form-row {
                display: flex;
                width: 100%;
                align-items: center;
            }

            .form-row .input-group {
                flex: 1;
            }

            .form-row button {
                padding: 10px 20px;
                background-color: blue;
                color: white;
                border: none;
                cursor: pointer;
                margin-left: 10px;
                height: 80px;
                margin-bottom: 10px;
                border-radius: 3px;
            }

            .register-link {
                margin-top: 10px;
                cursor: pointer;
                color: black;
                text-decoration: none;
            }

            .register-link:hover {
                text-decoration: underline;
            }

            .link-container {
                display: flex;
                justify-content: center;
                gap: 50px;
                /* 링크 사이의 간격 설정 */
                margin: 15px 0;
                /* 링크 컨테이너의 위아래 여백 설정 */
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
            <form id="individualForm" method="post" action="/login">
                <input type="hidden" name="loginType" value="individual">
                <div class="form-row">
                    <div class="input-group">
                        <div class="input-container">
                            <label>아이디</label>
                            <input type="text" name="userId" placeholder="아이디를 입력해주세요" required>
                        </div>
                        <div class="input-container">
                            <label>비밀번호</label>
                            <input type="password" name="password" placeholder="비밀번호를 입력해주세요" required>
                        </div>
                    </div>
                    <button type="submit">로그인</button>
                </div>
                <div class="link-container">
                    <span class="register-link" data-type="">아이디 찾기</span>
                    <span class="register-link" data-type="">비밀번호 찾기</span>
                    <span class="register-link" data-type="individual">회원가입</span>
                </div>
            </form>

            <form id="companyForm" method="post" action="/login" style="display: none;">
                <input type="hidden" name="loginType" value="enterprise">
                <div class="form-row">
                    <div class="input-group">
                        <div class="input-container">
                            <label>아이디</label>
                            <input type="text" name="userId" placeholder="아이디를 입력해주세요" required>
                        </div>
                        <div class="input-container">
                            <label>비밀번호</label>
                            <input type="password" name="password" placeholder="비밀번호를 입력해주세요" required>
                        </div>
                    </div>
                    <button type="submit">로그인</button>
                    <div class="link-container">
                        <span class="register-link" data-type="">아이디 찾기</span>
                        <span class="register-link" data-type="">비밀번호 찾기</span>
                        <span class="register-link" data-type="enterprise">회원가입</span>
                    </div>
                </div>
            </form>

        </div>

        <script>
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
                        } else {
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
        </script>
    </body>

    </html>