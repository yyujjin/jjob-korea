<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서 작성</title>
    <style>
        body {
            background: white;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            width: 100%;
            background-color: white;
            padding: 10px 0;
            display: flex;
            justify-content: center;
        }

        .main-container {
            display: flex;
            width: 100%;
            max-width: 1100px;
            margin: 20px;
            border: 1px solid black;
        }

        .content {
            flex: 3;
            padding: 20px;
            background: white;
            border-radius: 5px;
            margin-right: 20px;
        }

        .profilephoto {
            background: white;
            width: 150px;
            height: 210px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-left: 20px;
            text-align: center;
            margin-top: 10px;
        }

        h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        input,
        select,
        textarea {
            padding: 10px;
            margin: 5px 0;
            border: 1px solid black;
            border-radius: 5px;
            width: calc(50% - 10px);
            gap: 10px;
        }

        button {
            cursor: pointer;
        }

        .buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        nav ul {
            list-style: none;
            padding: 0;
        }

        nav ul li {
            margin-bottom: 10px;
        }

        nav ul li a {
            text-decoration: none;
            color: #000;
        }

        .btn-upload {
            background-color: blue;
            color: white;
            padding: 5px 15px;
            border-radius: 3px;
            cursor: pointer;
            display: inline-block;
            font-size: 13px;
            margin-top: 10px;
            margin-left: 65px;
        }

        #file {
            display: none;
        }

        textarea {
            width: 100%;
            resize: none;
        }

        #output {
            border-radius: 3px;
            border: none;
        }

        .skill-item {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
            font-size: 11px;
            font-weight: bold;
        }

        .remove-skill-btn {
            background-color: blue;
            color: white;
            border: none;
            cursor: pointer;
            margin-left: 5px;
            padding: 0;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .remove-skill-btn:hover {
            background-color: greenyellow;
        }

        #selectedSkills {
            display: flex;
            flex-wrap: wrap;
            gap: 7px;
        }

        .b {
            color: red;
        }

        .btn {
            display: flex;
            justify-content: center;
            width: 250px;
            height: 30px;
            text-align: center;
            gap: 10px;
            margin-left: 74%;
        }

        .btn button {
            width: 100%;
            height: 100%;
            background-color: white;
            cursor: pointer;
            border: solid 1px black;
            border-radius: 3px;
        }

        #photo-instructions {
            font-size: 12px;
            margin-top: 75px;
        }
    </style>
    <script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/resources/img/jjobkorea_logo.png" alt="JJOBKOREA Logo" width="200px">
        </div>
    </header>

    <form method="post" action="${pageContext.request.contextPath}/resume_write/edit" enctype="multipart/form-data" onsubmit="return validateForm();">
        <input type="hidden" name="id" value="${resumeInfoDTO.id}">
        <input type="hidden" name="resumeFilePath" value="${resumeInfoDTO.resumeFilePath}">
        <div class="main-container">
            <div class="photo">
                <div class="profilephoto">
                    <c:choose>
                        <c:when test="${not empty resumeInfoDTO.resumeFilePath}">
                            <div id="photo-instructions" style="color: gray; display:none;">
                                사진 크기는<br>
                                150x210만 <br>
                                가능합니다.
                            </div>
                            <img id="output" src="${pageContext.request.contextPath}/resume_write/edit/image/${resumeInfoDTO.resumeFilePath}" alt="uploaded image" width="150" height="210" style="display:block;">
                        </c:when>
                        <c:otherwise>
                            <div id="photo-instructions" style="color: gray; display:block;">
                                사진 크기는<br>
                                150x210만 <br>
                                가능합니다.
                            </div>
                            <img id="output" src="${pageContext.request.contextPath}/resume_write/edit/image/${resumeInfoDTO.resumeFilePath}" alt="uploaded image" width="150" height="210" style="display:none;">
                        </c:otherwise>
                    </c:choose>
                </div>
                <label for="file">
                    <div class="btn-upload">사진 업로드</div>
                    <input type="file" name="resumeProfilePhoto" id="file" accept="image/*" onchange="loadFile(event)" style="display: none;">
                </label>
            </div>
        </div>

        <div class="content">
            <section>
                <b>이력서 제목</b>
                <input type="text" placeholder="이력서 제목을 입력해주세요" name="resumePageTitle" id="resumePageTitle" value="${resumeInfoDTO.resumePageTitle}" required>
            </section>

            <section class="personal-info">
                <h3>인적 사항 <a style="color: gray; font-size: 11px;"><b class="b">*</b>은 필수항목 입니다.</a>
                    <div class="input-group">
                        이름<b class="b">*</b>
                        <input type="text" placeholder="이름" name="resumeUserName" id="resumeUserName" value="${resumeInfoDTO.resumeUserName}" required><br>
                        생년월일<b class="b">*</b>
                        <input type="text" placeholder="생년월일" name="resumeBirthDay" id="resumeBirthDay" value="${resumeInfoDTO.resumeBirthDay}" required>
                        <select name="resumeGender" id="resumeGender">
                            <option value="0" disabled>성별<b class="b">*</b></option>
                            <option value="1" <c:if test="${resumeInfoDTO.resumeGender == 1}">selected</c:if>>남자</option>
                            <option value="2" <c:if test="${resumeInfoDTO.resumeGender == 2}">selected</c:if>>여자</option>
                        </select><br>
                        이메일<b class="b">*</b>
                        <input type="email" placeholder="이메일" name="resumeUserEmail" id="resumeUserEmail" value="${resumeInfoDTO.resumeUserEmail}" required><br>
                        전화번호
                        <input type="text" placeholder="전화번호" name="resumeUserPhone" id="resumeUserPhone" value="${resumeInfoDTO.resumeUserPhone}" required><br>
                        휴대번호<b class="b">*</b>
                        <input type="text" placeholder="휴대번호" name="resumeUserCellPhone" value="${resumeInfoDTO.resumeUserCellPhone}" id="resumeUserCellPhone" required><br>
                        주소<b class="b">*</b>
                        <input type="text" placeholder="주소" name="resumeUserAddress" id="resumeUserAddress" value="${resumeInfoDTO.resumeUserAddress}" required>
                    </div>
            </section>
            <section class="skills">
                <h3>기술 스택 <a style="color: black; font-size: 10px;">(최대 3개 선택 가능)</a></h3>
                <div class="select-skill">
                    <select id="skills" onchange="addSkill()">
                        <option value="선택안함" selected>선택안함</option>
                        <option value="Java">Java</option>
                        <option value="Spring">Spring</option>
                        <option value="HTML">HTML</option>
                        <option value="JavaScript">JavaScript</option>
                        <option value="SQL">SQL</option>
                        <option value="Android">Android</option>
                        <option value="React">React</option>
                        <option value="Node.js">Node.js</option>
                        <option value="Express">Express</option>
                    </select>
                </div>
                <input type="hidden" name="resumeSkillName" id="resumeSkillName" value="${resumeInfoDTO.resumeSkillName}" required>

                <div id="selectedSkills" class="p-3">
                    <!-- 추가된 스킬을 보여줄 공간 -->
                </div>

                <script>
                    var selectedSkills = [];

                    function updateHiddenInput() {
                        const resumeSkillNameInput = document.getElementById("resumeSkillName");
                        resumeSkillNameInput.value = selectedSkills.join(',');
                    }

                    function addSkill() {
                        const skillSelect = document.getElementById("skills");
                        const selectedOption = skillSelect.options[skillSelect.selectedIndex];
                        const selectedSkillsDiv = document.getElementById("selectedSkills");

                        const skillId = 'skill-' + selectedOption.value.replace(/\s+/g, '-');

                        // Check if the skill already exists
                        if (!document.getElementById(skillId)) {
                            // Check the number of currently selected skills
                            const currentSkillCount = selectedSkillsDiv.getElementsByClassName('skill-item').length;

                            if (currentSkillCount >= 3) {
                                alert("기술은 최대 3개까지 선택 가능합니다.");
                                return;
                            }

                            const skillElement = document.createElement("div");
                            skillElement.setAttribute("id", skillId);
                            skillElement.className = 'skill-item';
                            skillElement.innerHTML = selectedOption.value + " <button class='remove-skill-btn' onclick='removeSkill(\"" + skillId + "\", \"" + selectedOption.value + "\")'>x</button>";
                            selectedSkillsDiv.appendChild(skillElement);

                            // Add the skill to the selectedSkills array
                            selectedSkills.push(selectedOption.value);
                            updateHiddenInput();
                        } else {
                            alert("이미 선택된 기술입니다.");
                        }
                        // Reset the select element to default value
                        skillSelect.selectedIndex = 0;
                    }

                    function removeSkill(skillId, skillValue) {
                        const skillElement = document.getElementById(skillId);
                        if (skillElement) {
                            skillElement.remove();

                            // Remove the skill from the selectedSkills array
                            const index = selectedSkills.indexOf(skillValue);
                            if (index > -1) {
                                selectedSkills.splice(index, 1);
                            }
                            updateHiddenInput();
                        }
                    }

                    function loadExistingSkills() {
                        const existingSkills = "${resumeInfoDTO.resumeSkillName}".split(',');

                        existingSkills.forEach(skill => {
                            if (skill && skill !== '선택안함') {
                                selectedSkills.push(skill);

                                const skillId = 'skill-' + skill.replace(/\s+/g, '-');
                                const selectedSkillsDiv = document.getElementById("selectedSkills");
                                const skillElement = document.createElement("div");
                                skillElement.setAttribute("id", skillId);
                                skillElement.className = 'skill-item';
                                skillElement.innerHTML = skill + " <button class='remove-skill-btn' onclick='removeSkill(\"" + skillId + "\", \"" + skill + "\")'>x</button>";
                                selectedSkillsDiv.appendChild(skillElement);
                            }
                        });

                        updateHiddenInput();
                    }

                    document.addEventListener("DOMContentLoaded", loadExistingSkills);
                </script>
            </section>

            <section class="portfolio">
                <h3>포트폴리오</h3>
                <input type="url" placeholder="URL 주소를 입력하세요" name="resumePortfolio" id="resumePortfolio" value="${resumeInfoDTO.resumePortfolio}" required>
            </section>
            <section class="education">
                <h3>학력란</h3>
                <div class="input-group">
                    <input type="text" placeholder="학교명" name="resumeSchoolName" id="resumeSchoolName" value="${resumeInfoDTO.resumeSchoolName}" required>
                    <select name="resumeEduStage" id="resumeEduStage" required>
                        <option selected disabled>학교구분</option>
                        <option value="고등학교" <c:if test="${resumeInfoDTO.resumeEduStage == '고등학교'}">selected</c:if>>고등학교</option>
                        <option value="대학교(2, 3년)" <c:if test="${resumeInfoDTO.resumeEduStage == '대학교(2, 3년)'}">selected</c:if>>대학교(2, 3년)</option>
                        <option value="대학교(4년)" <c:if test="${resumeInfoDTO.resumeEduStage == '대학교(4년)'}">selected</c:if>>대학교(4년)</option>
                        <option value="대학원" <c:if test="${resumeInfoDTO.resumeEduStage == '대학원'}">selected</c:if>>대학원</option>
                    </select>
                </div>
            </section>
            <section class="career">
                <h3>경력란</h3>
                <div class="input-group">
                    <input type="text" placeholder="회사명" name="resumeCpName" id="resumeCpName" value="${resumeInfoDTO.resumeCpName}" required>
                    <input type="text" placeholder="부서명" name="resumeCpDept" id="resumeCpDept" value="${resumeInfoDTO.resumeCpDept}" required>
                    <input type="text" placeholder="입사연월" name="resumeCpJoinDate" id="resumeCpJoinDate" value="${resumeInfoDTO.resumeCpJoinDate}" required>
                    <input type="text" placeholder="퇴사연월" name="resumeCpLeaveDate" id="resumeCpLeaveDate" value="${resumeInfoDTO.resumeCpLeaveDate}" required>
                    <input type="text" placeholder="직급/직책" name="resumeCpPosition" id="resumeCpPosition" value="${resumeInfoDTO.resumeCpPosition}" required>
                    <input type="text" placeholder="연봉" name="resumeCpSalary" id="resumeCpSalary" value="${resumeInfoDTO.resumeCpSalary}" required>
                    <input type="text" placeholder="담당업무" name="resumeCpDuty" id="resumeCpDuty" value="${resumeInfoDTO.resumeCpDuty}" required>
                </div>
            </section>
            <section class="self-intro">
                <h3>자기소개서란</h3>
                <textarea placeholder="1000자 이내로 작성해주세요" cols="50" rows="20" name="resumeIntroduce" id="resumeIntroduce" required>${resumeInfoDTO.resumeIntroduce}</textarea>
            </section>

            <div class="btn">
                <c:if test="${resumePageUserId == sessionScope.user.userId}">
                    <button type="button" id="editButton" onclick="editResume()">수정</button>
                </c:if>
                <c:if test="${resumePageUserId != sessionScope.user.userId}">
                    <button type="submit" id="saveButton" style="color: white; background-color: blue; border: solid 1px blue;">저장</button>
                </c:if>
            </div>
        </div>
    </form>

    <script>
        function loadFile(event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.style.display = 'block';
            document.getElementById('photo-instructions').style.display = 'none';
        }
    </script>
</body>
</html>
