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
<!--            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/resume_css/write.css">-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        </head>

        <body>
            <header>
                <div class="logo">
                    <img src="${pageContext.request.contextPath}/resources/img/jjobkorea_logo.png" alt="JJOBKOREA Logo"
                        width="200px">
                </div>
            </header>

            <form method="post" action="/resume/create" enctype="multipart/form-data">
                <div class="main-container">
                    <div class="photo">
                        <div class="profilephoto">
                            <div id="photo-instructions" style="color: gray;">
                                사진 크기는<br>
                                150x210만 <br>
                                가능합니다.
                            </div>
                            <img id="output" src="" alt="uploaded image" width="150" height="210" style="display:none;">
                        </div>
                        <label for="file">
                            <div class="btn-upload">사진 업로드</div>
                            <input type="file" name="resumeProfilePhoto" id="file" accept="image/*"
                                onchange="loadFile(event)" style="display: none;" required>
                        </label>
                    </div>

                    <script>
                        function loadFile(event) {
                            var output = document.getElementById('output');
                            var instructions = document.getElementById('photo-instructions');
                            instructions.style.display = 'none';
                            output.style.display = 'block';
                            output.src = URL.createObjectURL(event.target.files[0]);
                            output.onload = function () {
                                URL.revokeObjectURL(output.src) // free memory
                            }
                        }
                    </script>

                    <div class="content">
                        <section>
                            <b>이력서 제목</b>
                            <input type="text" placeholder="이력서 제목을 입력해주세요" name="resumePageTitle" id="resumePageTitle"
                                required>
                        </section>

                        <section class="personal-info">
                            <h3>인적 사항 <a style="color: gray; font-size: 11px;">
                                    <b class="b">*</b>은 필수항목 입니다.</a>
                                <div class="input-group">
                                    이름<b class="b">*</b>
                                    <input type="text" placeholder="이름" name="resumeUserName" id="resumeUserName"
                                        required><br>
                                    생년월일<b class="b">*</b>
                                    <input type="text" placeholder="생년월일" name="resumeBirthDay" id="resumeBirthDay"
                                        required>
                                    <select name="resumeGender" id="resumeGender">
                                        <option value="0" selected disabled>성별<b class="b">*</b></option>
                                        <option value="1">남자</option>
                                        <option value="2">여자</option>
                                    </select><br>
                                    이메일<b class="b">*</b>
                                    <input type="email" placeholder="이메일" name="resumeUserEmail" id="resumeUserEmail"
                                        required><br>
                                    전화번호
                                    <input type="text" placeholder="전화번호" name="resumeUserPhone" id="resumeUserPhone"
                                        required><br>
                                    휴대번호<b class="b">*</b>
                                    <input type="text" placeholder="휴대번호" name="resumeUserCellPhone"
                                        id="resumeUserCellPhone" required><br>
                                    주소<b class="b">*</b>
                                    <input type="text" placeholder="주소" name="resumeUserAddress" id="resumeUserAddress"
                                        required>
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
                            <input type="hidden" name="resumeSkillName" id="resumeSkillName" value="" required>
                        
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
                            </script>
                        </section>
                        

                        <section class="portfolio">
                            <h3>포트폴리오</h3>
                            <input type="url" placeholder="URL 주소를 입력하세요" name="resumePortfolio" id="resumePortfolio"
                                required>
                        </section>
                        <section class="education">
                            <h3>학력란</h3>
                            <div class="input-group">
                                <input type="text" placeholder="학교명" name="resumeSchoolName" id="resumeSchoolName"
                                    required>
                                <select name="resumeEduStage" id="resumeEduStage" required>
                                    <option selected disabled>학교구분</option>
                                    <option value="고등학교">고등학교</option>
                                    <option value="대학교(2, 3년)">대학교(2, 3년)</option>
                                    <option value="대학교(4년)">대학교(4년)</option>
                                    <option value="대학원">대학원</option>
                                </select>
                            </div>
                        </section>
                        <section class="career">
                            <h3>경력란</h3>
                            <div class="input-group">
                                <input type="text" placeholder="회사명" name="resumeCpName" id="resumeCpName" required>
                                <input type="text" placeholder="부서명" name="resumeCpDept" id="resumeCpDept" required>
                                <input type="text" placeholder="입사연월" name="resumeCpJoinDate" id="resumeCpJoinDate"
                                    required>
                                <input type="text" placeholder="퇴사연월" name="resumeCpLeaveDate" id="resumeCpLeaveDate"
                                    required>
                                <input type="text" placeholder="직급/직책" name="resumeCpPosition" id="resumeCpPosition"
                                    required>
                                <input type="text" placeholder="연봉" name="resumeCpSalary" id="resumeCpSalary" required>
                                <input type="text" placeholder="담당업무" name="resumeCpDuty" id="resumeCpDuty" required>
                            </div>
                        </section>
                        <section class="self-intro">
                            <h3>자기소개서란</h3>
                            <textarea placeholder="1000자 이내로 작성해주세요" cols="50" rows="20" name="resumeIntroduce"
                                id="resumeIntroduce" required></textarea>
                        </section>

                        <!-- <div class="btn">
                            <button type="submit"
                                style="color: white; background-color: blue; border: solid 1px blue;">저장</button>
                            <button type="button" onclick="saveResume()">임시저장</button>
                            <button type="button" onclick="">수정</button>
                        </div> -->

                        <div class="btn">
                            <c:if test="${resumePageUserId == sessionScope.user.userId}">
                                <button type="button" id="editButton" onclick="editResume()">수정</button>
                            </c:if>
                            <c:if test="${resumePageUserId != sessionScope.user.userId}">
                                <button type="submit" id="saveButton"
                                    style="color: white; background-color: blue; border: solid 1px blue;">저장</button>
                            </c:if>
                            <button type="button" onclick="saveResume()">임시저장</button>
                        </div>
                    </div>
                </div>
            </form>

            <script>

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