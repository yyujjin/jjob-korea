<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../resources/css/user/login.css" />
    <script src="../../resources/js/user/login.js" defer></script>
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
        <!-- 개인회원 로그인 폼 -->
        <form id="individualForm" method="post" action="/login">
            <input type="hidden" name="loginType" value="individual">
            <div class="form-row">
                <div class="input-group">
                    <div class="input-container">
                        <label>아이디</label>
                        <input type="text" name="username" placeholder="아이디를 입력해주세요" required>
                    </div>
                    <div class="input-container">
                        <label>비밀번호</label>
                        <input type="password" name="password" placeholder="비밀번호를 입력해주세요" required>
                    </div>
                </div>
                <button type="submit">로그인</button>
            </div>

        </form>

        <!-- 기업회원 로그인 폼 -->
        <form id="companyForm" method="post" action="/login" style="display: none;">
            <input type="hidden" name="loginType" value="enterprise">
            <div class="form-row">
                <div class="input-group">
                    <div class="input-container">
                        <label>아이디</label>
                        <input type="text" name="username" placeholder="아이디를 입력해주세요" required>
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

        <!-- 소셜 로그인 -->
        <div class="google_login">
            <a href="/oauth2/authorization/google">
                소셜 계정으로 로그인하기
                <img class="login_img" src="../../resources/img/구글이미지.png" alt="Google">
                <img class="login_img" src="../../resources/img/카톡이미지.png" alt="KakaoTalk">
                <img class="login_img" src="../../resources/img/깃허브이미지.png" alt="GitHub">
            </a>
        </div>
    </div>

</body>
</html>
