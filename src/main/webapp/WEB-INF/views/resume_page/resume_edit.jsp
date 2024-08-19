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
                    margin: 0;
                    padding: 0;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }

                .main-container {
                    display: flex;
                    max-width: 1100px;
                    margin: 20px;
                    border: 1px solid black;
                    height: auto;
                }

                .content {
                    flex: 3;
                    padding: 20px;
                    background: white;
                    margin-right: 20px;
                    font-size: 15px;
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

                input,
                select {
                    padding: 10px;
                    margin: 5px 0;
                    border: 1px solid black;
                    box-sizing: border-box;
                    width: 200px;
                }

                textarea {
                    width: 90%;
                    height: 200px;
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
                    cursor: pointer;
                    display: inline-block;
                    font-size: 13px;
                    margin-top: 10px;
                    margin-left: 50px;
                }

                #file {
                    display: none;
                }

                /* 이미지 들어가는 폼 */
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
                    width: 20px;
                    height: 20px;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 0;
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
                    border: none;
                }

                .btn button {
                    width: 100px;
                    height: 35px;
                    background-color: white;
                    border: solid 1px black;
                }

                #photo-instructions {
                    font-size: 12px;
                    margin-top: 55px;
                }

                /* Unified Input 그룹 스타일 */
                .input-group {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 10px;
                    align-items: flex-start;
                }

                .input-item {
                    display: flex;
                    flex-direction: column;
                    margin-bottom: 10px;
                }

                .input-item label {
                    font-weight: bold;
                    margin-bottom: 5px;
                }

                .input-item input,
                .input-item select {
                    width: 200px;
                }

                #resumeGender {
                    width: 100px;
                }
            </style>
    <script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


</head>
<body>

    <form method="post" action="/resume_write/edit" enctype="multipart/form-data" onsubmit="return validateForm();">
        <input type="hidden" name="id" value="${resumeInfoDTO.id}">
        <input type="hidden" name="resumeFilePath" value="${resumeInfoDTO.resumeFilePath}">
        <div class="main-container">
            <div class="photo">
                <div class="profilephoto">
                    <c:choose>
                        <c:when test="${not empty image}">
                            <div id="photo-instructions" style="color: gray; display:none;">
                                사진 크기는 <br>
                                150x210만 <br>
                                가능합니다.
                            </div>
                            <img id="output" src="data:image/jpeg;base64,${image}" alt="업로드된 이미지" width="150" height="210" style="display:block;">
                        </c:when>
                        <c:otherwise>
                            <div id="photo-instructions" style="color: gray; display:block;">
                                사진 크기는 <br>
                                150x210만 <br>
                                가능합니다. 
                            </div>
                            <img id="output" src="data:image/jpeg;base64,${image}" alt="업로드된 이미지" width="150" height="210" style="display:none;">
                        </c:otherwise>
                    </c:choose>
                </div>
                <label for="file">
                    <div class="btn-upload">사진 업로드</div>
                    <input type="file" name="resumeProfilePhoto" id="file" accept="image/*" onchange="loadFile(event)" style="display: none;">
                </label>
            </div>
            

        <div class="content">
            <section>
                <b style="font-size: 16px;">이력서 제목<b class="b">*</b></b>
                <input style="width: 300px;" type="text" placeholder="이력서 제목을 입력해주세요" name="resumePageTitle" id="resumePageTitle" value="${resumeInfoDTO.resumePageTitle}" required>
            </section>

            <section class="personal-info">
                <a style="font-size: 16px;">인적 사항</a>
                <a style="color: gray; font-size: 11px;">
                    <b class="b">*</b>은 필수항목 입니다.
                </a>
                <div class="input-group">
                    <div class="input-item">
                        <label for="resumeUserName">이름<b class="b">*</b></label>
                        <input type="text" placeholder="이름" name="resumeUserName" id="resumeUserName" value="${resumeInfoDTO.resumeUserName}"
                            required>
                    </div>

                    <div class="input-item">
                        <label for="resumeBirthDay">생년월일<b class="b">*</b></label>
                        <input type="text" placeholder="생년월일" name="resumeBirthDay" id="resumeBirthDay" value="${resumeInfoDTO.resumeBirthDay}"
                            required>
                    </div>

                    <div class="input-item">
                        <label for="resumeUserEmail">이메일<b class="b">*</b></label>
                        <input type="email" placeholder="이메일" name="resumeUserEmail" id="resumeUserEmail" value="${resumeInfoDTO.resumeUserEmail}"
                            required>
                    </div>
                    
                    <div class="input-item">
                        <label for="resumeGender">성별<b class="b">*</b></label>
                        <select name="resumeGender" id="resumeGender" required>
                                <option value="0" selected disabled>성별</option>
                                <option value="1" <c:if test="${resumeInfoDTO.resumeGender == 1}">selected</c:if>>남자</option>
                                <option value="2" <c:if test="${resumeInfoDTO.resumeGender == 2}">selected</c:if>>여자</option>
                        </select>
                    </div>

                    <div class="input-item">
                        <label for="resumeUserPhone">전화번호</label>
                        <input type="text" placeholder="전화번호" name="resumeUserPhone" id="resumeUserPhone" value="${resumeInfoDTO.resumeUserPhone}">
                    </div>

                    <div class="input-item">
                        <label for="resumeUserCellPhone">휴대번호<b class="b">*</b></label>
                        <input type="text" placeholder="휴대번호" name="resumeUserCellPhone" value="${resumeInfoDTO.resumeUserCellPhone}"
                            id="resumeUserCellPhone" required>
                    </div>

                    <div class="input-item">
                        <label for="resumeUserAddress">주소<b class="b">*</b></label>
                        <input type="text" placeholder="주소" name="resumeUserAddress" id="resumeUserAddress" value="${resumeInfoDTO.resumeUserAddress}"
                            required>
                    </div>
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
                포트폴리오<b class="b">*</b>
                <input style="width: 300px;" type="url" placeholder="URL 주소를 입력하세요" name="resumePortfolio"
                    id="resumePortfolio" value="${resumeInfoDTO.resumePortfolio}" required>
            </section>
            <section class="education">
    학력란
    <div class="input-group">
        학교명<b class="b">*</b><input type="text" placeholder="학교명" name="resumeSchoolName"
            id="resumeSchoolName" value="${resumeInfoDTO.resumeSchoolName}" required>
        <select name="resumeEduStage" id="resumeEduStage" required>
            <option value="" disabled <c:if test="${empty resumeInfoDTO.resumeEduStage}">selected</c:if>>학교구분</option>
            <option value="고등학교" <c:if test="${resumeInfoDTO.resumeEduStage == '고등학교'}">selected</c:if>>고등학교</option>
            <option value="대학교(2, 3년)" <c:if test="${resumeInfoDTO.resumeEduStage == '대학교(2, 3년)'}">selected</c:if>>대학교(2, 3년)</option>
            <option value="대학교(4년)" <c:if test="${resumeInfoDTO.resumeEduStage == '대학교(4년)'}">selected</c:if>>대학교(4년)</option>
            <option value="대학원" <c:if test="${resumeInfoDTO.resumeEduStage == '대학원'}">selected</c:if>>대학원</option>
        </select>
    </div>
</section>
            <section class="career">
                경력란
                <div class="input-group">
                    <div class="input-item">
                        <label for="resumeCpName">회사명<b class="b">*</b></label>
                        <input type="text" placeholder="회사명" name="resumeCpName" id="resumeCpName"  value="${resumeInfoDTO.resumeCpName}" required>
                    </div>

                    <div class="input-item">
                        <label for="resumeCpDept">부서명<b class="b">*</b></label>
                        <input type="text" placeholder="부서명" name="resumeCpDept" id="resumeCpDept" value="${resumeInfoDTO.resumeCpDept}" required>
                    </div>

                    <div class="input-item">
                        <label for="resumeCpJoinDate">입사연월<b class="b">*</b></label>
                        <input type="text" placeholder="입사연월" name="resumeCpJoinDate" id="resumeCpJoinDate" value="${resumeInfoDTO.resumeCpJoinDate}"
                            required>
                    </div>

                    <div class="input-item">
                        <label for="resumeCpLeaveDate">퇴사연월<b class="b">*</b></label>
                        <input type="text" placeholder="퇴사연월" name="resumeCpLeaveDate" value="${resumeInfoDTO.resumeCpLeaveDate}"
                            id="resumeCpLeaveDate" required>
                    </div>

                    <div class="input-item">
                        <label for="resumeCpPosition">직급/직책<b class="b">*</b></label>
                        <input type="text" placeholder="직급/직책" name="resumeCpPosition" id="resumeCpPosition" value="${resumeInfoDTO.resumeCpPosition}"
                            required>
                    </div>

                    <div class="input-item">
                        <label for="resumeCpSalary">연봉<b class="b">*</b></label>
                        <input type="text" placeholder="연봉" name="resumeCpSalary" id="resumeCpSalary" value="${resumeInfoDTO.resumeCpSalary}"
                            required>
                    </div>

                    <div class="input-item">
                        <label for="resumeCpDuty">담당업무<b class="b">*</b></label>
                        <input type="text" placeholder="담당업무" name="resumeCpDuty" id="resumeCpDuty" value="${resumeInfoDTO.resumeCpDuty}"
                            required>
                    </div>
                </div>
                <section class="self-intro">
                    자기소개서란<b class="b">*</b><br>
                    <textarea placeholder="1000자 이내로 작성해주세요" cols="100" rows="20" name="resumeIntroduce"
                        id="resumeIntroduce" required>${resumeInfoDTO.resumeIntroduce}</textarea>
                </section>

                <div class="btn" style="border: none;">
                    <c:if test="${resumePageUserId == sessionScope.user.userId}">
                        <button type="submit" id="saveButton"
                            style="color: white; background-color: blue; border: solid 1px blue;">저장</button>
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
    
             console.log("Image preview URL: " + output.src); // 이미지 미리보기 URL 확인
        }
        function validateForm() {
            var isValid = true;

            var resumeTitle = document.getElementById("resumePageTitle").value;
            if (resumeTitle === "") {
                alert("이력서 제목을 입력하세요.");
                isValid = false;
            }

            // 추가적인 검증 로직 추가...

            return isValid; // 폼이 제출될 수 있도록 true 반환, 중지하려면 false 반환
        }
    </script>
</body>
</html>
