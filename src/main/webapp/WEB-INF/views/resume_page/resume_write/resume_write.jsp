<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서 작성</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/resume_css/write.css">
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/resources/img/jjobkorea_logo.png" alt="JJOBKOREA Logo" width="200px">
    </div>
</header>
<form method="post" action="/resume_write" enctype="multipart/form-data">

    <div class="main-container">
        <div class="content">
            <section>
                <h3>이력서 제목</h3>
                    <input type="text" placeholder="이력서 제목" name="resumePageTitle" id = "resumePageTitle" required>
            </section>
            <section class="personal-info">
                <h3>인적 사항</h3>
                <div class="input-group">
                    <input type="text" placeholder="이름" name="resumeUserName" id="resumeUserName"  required>
                    <input type="text" placeholder="생년월일" name="resumeBirthDay" id="resumeBirthDay"  required>
                    <select name="resumeGender" id="resumeGender">
                        <option value="0" selected disabled>성별</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select>
                    <input type="email" placeholder="이메일" name="resumeUserEmail" id="resumeUserEmail"  required>
                    <input type="text" placeholder="전화번호" name="resumeUserPhone" id="resumeUserPhone" required>
                    <input type="text" placeholder="휴대폰번호" name="resumeUserCellPhone" id="resumeUserCellPhone" required>
                    <input type="text" placeholder="주소" name="resumeUserAddress" id="resumeUserAddress" required>
                </div>
            </section>
            <section class="skills">
                <h3>기술 스택 (최대 3개 선택 가능)</h3>
                <div class="buttons">
                    <button type="button" onclick="toggleSkill('Java')">Java</button>
                    <button type="button" onclick="toggleSkill('Spring')">Spring</button>
                    <button type="button" onclick="toggleSkill('HTML')">HTML</button>
                    <button type="button" onclick="toggleSkill('JavaScript')">JavaScript</button>
                    <button type="button" onclick="toggleSkill('SQL')">SQL</button>
                    <button type="button" onclick="toggleSkill('Android')">Android</button>
                    <button type="button" onclick="toggleSkill('React')">React</button>
                    <button type="button" onclick="toggleSkill('Node.js')">Node.js</button>
                    <button type="button" onclick="toggleSkill('Express')">Express</button>
                </div>
                <input type="hidden" name="resumeSkillName" id="resumeSkillName" value="" required>
            </section>
            <section class="portfolio">
                <h3>포트폴리오</h3>
                <input type="url" placeholder="URL을 입력하세요" name="resumePortfolio" id="resumePortfolio" required>
            </section>
            <section class="education">
                <h3>학력란</h3>
                <div class="input-group">
                    <select name="resumeEduStage" id="resumeEduStage" required>
                        <option selected disabled>학교구분</option>
                        <option value="고등학교">고등학교</option>
                        <option value="대학교(2, 3년)">대학교(2, 3년)</option>
                        <option value="대학교(4년)">대학교(4년)</option>
                        <option value="대학원">대학원</option>
                    </select>
                    <input type="text" placeholder="학교명" name="resumeSchoolName" id="resumeSchoolName" required>
                </div>
            </section>
            <section class="career">
                <h3>경력란</h3>
                <div class="input-group">
                    <input type="text" placeholder="회사명" name="resumeCpName" id="resumeCpName" required>
                    <input type="text" placeholder="부서명" name="resumeCpDept" id="resumeCpDept" required>
                    <input type="text" placeholder="입사연월" name="resumeCpJoinDate" id="resumeCpJoinDate" required>
                    <input type="text" placeholder="퇴사연월" name="resumeCpLeaveDate" id="resumeCpLeaveDate" required>
                    <input type="text" placeholder="직급/직책" name="resumeCpPosition" id="resumeCpPosition" required>
                    <input type="text" placeholder="연봉" name="resumeCpSalary" id="resumeCpSalary" required>
                    <input type="text" placeholder="담당업무" name="resumeCpDuty" id="resumeCpDuty" required>
                </div>
            </section>
            <section class="self-intro">
                <h3>자기소개서란</h3>
                <textarea placeholder="1000자 이내로 작성하세요" cols="50" rows="20" name="resumeIntroduce" id="resumeIntroduce" required></textarea>
            </section>
        </div>
        <div class="profilephoto" >
            <div style="color: gray;">
                사진 크기는<br>
                150x210만 가능합니다.
            </div>
            <label for="file">
                <div class="btn-upload">사진 업로드</div>
                <input type="file" name="resumeProfilePhoto" id="file" accept="image/*" onchange="loadFile(event)" style="display: none;" required>
            </label>
            <img id="output" src="" alt="uploaded image" width="150" height="210">
        </div>
    </div>
    <button type="submit">이력서 저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="saveResume()">임시 저장하기</button>
</form>

<script>
    var selectedSkills = [];

    function toggleSkill(skill) {
        var index = selectedSkills.indexOf(skill);
        if (index === -1) {
            if (selectedSkills.length < 3) {
                selectedSkills.push(skill);
            } else {
                alert('최대 3개까지 선택할 수 있습니다.');
            }
        } else {
            selectedSkills.splice(index, 1);
        }
        document.getElementById('resumeSkillName').value = selectedSkills.join(',');
    }

    var loadFile = function(event) {
        var image = document.getElementById('output');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
    document.addEventListener('DOMContentLoaded', (event) => {
        loadResume();
    });
    
    function saveResume() {
        const resumeData = {
            resumePageTitle: document.getElementById('resumePageTitle').value,
            resumeUserName: document.getElementById('resumeUserName').value,
            resumeBirthDay: document.getElementById('resumeBirthDay').value,
            resumeGender: document.getElementById('resumeGender').value,
            resumeUserEmail: document.getElementById('resumeUserEmail').value,
            resumeUserPhone: document.getElementById('resumeUserPhone').value,
            resumeUserCellPhone: document.getElementById('resumeUserCellPhone').value,
            resumeUserAddress: document.getElementById('resumeUserAddress').value,
            resumeSkillName: selectedSkills,
            resumePortfolio: document.getElementById('resumePortfolio').value,
            resumeEduStage: document.getElementById('resumeEduStage').value,
            resumeSchoolName: document.getElementById('resumeSchoolName').value,
            resumeCpName: document.getElementById('resumeCpName').value,
            resumeCpDept: document.getElementById('resumeCpDept').value,
            resumeCpJoinDate: document.getElementById('resumeCpJoinDate').value,
            resumeCpLeaveDate: document.getElementById('resumeCpLeaveDate').value,
            resumeCpPosition: document.getElementById('resumeCpPosition').value,
            resumeCpSalary: document.getElementById('resumeCpSalary').value,
            resumeCpDuty: document.getElementById('resumeCpDuty').value,
            resumeIntroduce: document.getElementById('resumeIntroduce').value,
        };
        localStorage.setItem('resumeData', JSON.stringify(resumeData));
        alert('이력서가 임시 저장되었습니다.');
    }

    function loadResume() {
        const savedResumeData = localStorage.getItem('resumeData');
        if (savedResumeData) {
            const resumeData = JSON.parse(savedResumeData);
            document.getElementById('resumeUserName').value = resumeData.resumeUserName;
            document.getElementById('resumeBirthDay').value = resumeData.resumeBirthDay;
            document.getElementById('resumeGender').value = resumeData.resumeGender;
            document.getElementById('resumeUserEmail').value = resumeData.resumeUserEmail;
            document.getElementById('resumeUserPhone').value = resumeData.resumeUserPhone;
            document.getElementById('resumeUserCellPhone').value = resumeData.resumeUserCellPhone;
            document.getElementById('resumeUserAddress').value = resumeData.resumeUserAddress;
            selectedSkills = resumeData.resumeSkillName;
            document.getElementById('resumeSkillName').value = selectedSkills.join(',');
            document.getElementById('resumePortfolio').value = resumeData.resumePortfolio;
            document.getElementById('resumeEduStage').value = resumeData.resumeEduStage;
            document.getElementById('resumeSchoolName').value = resumeData.resumeSchoolName;
            document.getElementById('resumeCpName').value = resumeData.resumeCpName;
            document.getElementById('resumeCpDept').value = resumeData.resumeCpDept;
            document.getElementById('resumeCpJoinDate').value = resumeData.resumeCpJoinDate;
            document.getElementById('resumeCpLeaveDate').value = resumeData.resumeCpLeaveDate;
            document.getElementById('resumeCpPosition').value = resumeData.resumeCpPosition;
            document.getElementById('resumeCpSalary').value = resumeData.resumeCpSalary;
            document.getElementById('resumeCpDuty').value = resumeData.resumeCpDuty;
            document.getElementById('resumeIntroduce').value = resumeData.resumeIntroduce;
        }
    }
function validateForm() {
    var salary = document.getElementById('resumeCpSalary').value;
    if (isNaN(salary) || salary.trim() === "") {
        alert('연봉 필드는 숫자여야 합니다.');
        return false;
    }
    return true;
}
</script>
</body>
</html>

