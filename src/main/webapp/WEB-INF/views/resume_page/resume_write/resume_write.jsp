<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="./resources/css/resume_css/write.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="./resources/img/jjobkorea_logo.png" alt="JJOBKOREA Logo" width="200px">
        </div>
    </header>
    <div class="main-container">
        <div class="content">
            <section class="personal-info">
                <h3>인적 사항</h3>
                <div class="input-group">
                    <input type="text" placeholder="이름" required>
                    <input type="text" placeholder="생년월일" required>
                    <select>
                        <option value="0">성별</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select>
                    <input type="email" placeholder="이메일" required>
                    <input type="text" placeholder="전화번호">
                    <input type="text" placeholder="휴대폰번호" required>
                    <input type="text" placeholder="주소" required>
                </div>
            </section>
            <section class="skills">
                <h3>기술 스택 (최대 3개 선택 가능)</h3>
                <div class="buttons">
                    <button>Java</button>
                    <button>Spring</button>
                    <button>HTML</button>
                    <button>JavaScript</button>
                    <button>SQL</button>
                    <button>Android</button>
                    <button>React</button>
                    <button>Node.js</button>
                    <button>Express</button>
                </div>
            </section>
            <section class="portfolio">
                <h3>포트폴리오</h3>
                <input type="url" placeholder="URL을 입력하세요">
            </section>
            <section class="education">
                <h3>학력란</h3>
                <div class="input-group">
                    <select>
                        <option>학교구분</option>
                        <option value="1">고등학교</option>
                        <option value="2">대학교(2, 3년)</option>
                        <option value="3">대학교(4년)</option>
                        <option value="4">대학원</option>
                    </select>
                    <input type="text" placeholder="학교명">
                </div>
            </section>
            <section class="career">
                <h3>경력란</h3>
                <div class="input-group">
                    <input type="text" placeholder="회사명">
                    <input type="text" placeholder="부서명">
                    <input type="text" placeholder="입사연월">
                    <input type="text" placeholder="퇴사연월">
                    <input type="text" placeholder="직급/직책">
                    <input type="text" placeholder="연봉">
                    <input type="text" placeholder="담당업무">
                </div>
            </section>
            <section class="self-intro">
                <h3>자기소개서란</h3>
                <textarea placeholder="1000자 이내로 작성하세요" cols="50" rows="20"></textarea>
            </section>
        </div>
        <div class="profilephoto">
            <div style="color: gray;">
                사진 크기는<br>
                150x210만 가능합니다.
            </div>
            <label for="file">
                <div class="btn-upload">사진 업로드</div>
                <input type="file" name="file" id="file" accept="image/*" onchange="loadFile(event)" style="display: none;">
            </label>
        </div>
    </div>
    <script>
        var loadFile = function(event) {
            var image = document.getElementById('output');
            image.src = URL.createObjectURL(event.target.files[0]);
        };
    </script>
</body>
</html>
