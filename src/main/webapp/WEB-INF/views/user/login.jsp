<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        .body {
            font-family: Arial, sans-serif;
        }
        .tab-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            text-align: center;
            width: 400px;
            margin: 50px auto;
        }
        .tab {
            width: 240px;
            padding: 10px 20px;
            border: 1px solid #ccc;
            color: #ccc;
            border-bottom: none;
            font-size: 15px;
        }
        .tabs {
            display: flex;
            cursor: pointer;
        }
        .tab.active {
            font-weight: bold;
            letter-spacing: 0px;
            color: black;
            border: 1px solid black;
            border-bottom: none;
        }
        #loginForm {
            width: 550px;
            padding: 20px;
            margin: auto;
            font-size: 13px;
        }
        .form-row {
            display: flex;
            width: 100%;
            align-items: center;
        }
        .input-group {
            flex: 1;
        }
        .input-container {
            text-align: center;
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            width: 100%;
        }
        .input-container label {
            width: 70px;
            text-align: left;
            font-weight: bold;
        }
        .input-container input {
            flex: 1;
            padding: 13px;
            border: 1px solid black;
            border-radius: 3px;
            width: 200px;
        }
        .form-row button {
                padding: 10px 20px;
                background-color: blue;
                color: white;
                border: none;
                cursor: pointer;
                margin-left: 10px;
                height: 110px;
                margin-bottom: 20px;
                border-radius: 3px;
                width: 100px;
            }
        .link-container {
            display: flex;
            justify-content: space-between;
            gap: 50px;
                /* 링크 사이의 간격 설정 */
            margin: 15px 0;
                /* 링크 컨테이너의 위아래 여백 설정 */
        }
        .register-link {
            cursor: pointer;
            color: black;
            text-decoration: none;
        }
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- 탭 네비게이션 -->
    <div class="tab-container">
        <div class="tabs">
            <div class="tab active" data-tab="individual">개인회원</div>
            <div class="tab" data-tab="enterprise">기업회원</div>
        </div>
    </div>

    <!-- 로그인 폼 -->
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
            </div>
            <div class="link-container">
                <span class="register-link" data-type="">아이디 찾기</span>
                <span class="register-link" data-type="">비밀번호 찾기</span>
                <span class="register-link" data-type="enterprise">회원가입</span>
            </div>
        </form>

    </div>

    <!-- 스크립트 -->
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
    </script>
</body>
</html>
