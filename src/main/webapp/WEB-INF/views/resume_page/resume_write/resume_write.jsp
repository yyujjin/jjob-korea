<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서 작성</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="../../resources/css/resume/resume_write.css" />
    <script src="../../resources/js/resume/resume_write.js" defer></script>

</head>

<body>
    <form method="post" action="/resume/create" enctype="multipart/form-data">
        <div class="main-container">
            <div class="photo">
                <div class="profilephoto">
                    <div id="photo-instructions" style="color: gray;">
                        사진 크기는 <b class="b">*</b><br>
                        150x210만<br>
                        가능합니다.
                    </div>
                    <img id="output" src="" alt="업로드된 이미지" style="display:none; width: 150px; height: 210px;">
                </div>
                <div class="btn-upload" onclick="document.getElementById('file').click();">
                    사진 업로드
                </div>
                <input type="file" name="resumeProfilePhoto" id="file" accept="image/*" onchange="loadFile(event)"
                    style="display:none;" required>
            </div>

            <div class="content">
                <section>
                    <b style="font-size: 16px;">이력서 제목<b class="b">*</b></b>
                    <input style="width: 300px;" type="text" placeholder="이력서 제목을 입력해주세요" name="resumePageTitle"
                        id="resumePageTitle" required>
                </section>

                <section class="personal-info">
                    <a style="font-size: 16px;">인적 사항</a>
                    <a style="color: gray; font-size: 11px;">
                        <b class="b">*</b>은 필수항목 입니다.
                    </a>
                    <div class="input-group">
                        <div class="input-item">
                            <label for="resumeUserName">이름<b class="b">*</b></label>
                            <input type="text" placeholder="이름" name="resumeUserName" id="resumeUserName" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeBirthDay">생년월일<b class="b">*</b></label>
                            <input type="text" placeholder="생년월일" name="resumeBirthDay" id="resumeBirthDay" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeUserEmail">이메일<b class="b">*</b></label>
                            <input type="email" placeholder="이메일" name="resumeUserEmail" id="resumeUserEmail" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeGender">성별<b class="b">*</b></label>
                            <select name="resumeGender" id="resumeGender" required>
                                <option value="" selected disabled>성별</option>
                                <option value="1">남자</option>
                                <option value="2">여자</option>
                            </select>
                        </div>
                        <div class="input-item">
                            <label for="resumeUserPhone">전화번호</label>
                            <input type="text" placeholder="전화번호" name="resumeUserPhone" id="resumeUserPhone">
                        </div>
                        <div class="input-item">
                            <label for="resumeUserCellPhone">휴대번호<b class="b">*</b></label>
                            <input type="text" placeholder="휴대번호" name="resumeUserCellPhone" id="resumeUserCellPhone" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeUserAddress">주소<b class="b">*</b></label>
                            <input type="text" placeholder="주소" name="resumeUserAddress" id="resumeUserAddress" required>
                        </div>
                    </div>
                </section>

                <section class="skills" style="font-size: 14px;">
                    기술 스택 <a style="color: black; font-size: 10px;">(최대 3개 선택 가능)</a>
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

                            if (!document.getElementById(skillId)) {
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

                                selectedSkills.push(selectedOption.value);
                                updateHiddenInput();
                            } else {
                                alert("이미 선택된 기술입니다.");
                            }

                            skillSelect.selectedIndex = 0;
                        }

                        function removeSkill(skillId, skillValue) {
                            const skillElement = document.getElementById(skillId);
                            if (skillElement) {
                                skillElement.remove();
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
                    포트폴리오<b class="b">*</b>
                    <input style="width: 300px;" type="url" placeholder="URL 주소를 입력하세요" name="resumePortfolio"
                        id="resumePortfolio" required>
                </section>

                <section class="education">
                    학력란
                    <div class="input-group">
                        학교명<b class="b">*</b>
                        <input type="text" placeholder="학교명" name="resumeSchoolName" id="resumeSchoolName" required>
                        <select name="resumeEduStage" id="resumeEduStage" required>
                            <option value="" selected disabled>학교구분</option>
                            <option value="고등학교">고등학교</option>
                            <option value="대학교(2, 3년)">대학교(2, 3년)</option>
                            <option value="대학교(4년)">대학교(4년)</option>
                            <option value="대학원">대학원</option>
                        </select>
                    </div>
                </section>

                <section class="career">
                    경력란
                    <div class="input-group">
                        <div class="input-item">
                            <label for="resumeCpName">회사명<b class="b">*</b></label>
                            <input type="text" placeholder="회사명" name="resumeCpName" id="resumeCpName" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeCpDept">부서명<b class="b">*</b></label>
                            <input type="text" placeholder="부서명" name="resumeCpDept" id="resumeCpDept" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeCpJoinDate">입사연월<b class="b">*</b></label>
                            <input type="text" placeholder="입사연월" name="resumeCpJoinDate" id="resumeCpJoinDate" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeCpLeaveDate">퇴사연월<b class="b">*</b></label>
                            <input type="text" placeholder="퇴사연월" name="resumeCpLeaveDate" id="resumeCpLeaveDate" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeCpPosition">직급/직책<b class="b">*</b></label>
                            <input type="text" placeholder="직급/직책" name="resumeCpPosition" id="resumeCpPosition" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeCpSalary">연봉<b class="b">*</b></label>
                            <input type="text" placeholder="연봉" name="resumeCpSalary" id="resumeCpSalary" required>
                        </div>
                        <div class="input-item">
                            <label for="resumeCpDuty">담당업무<b class="b">*</b></label>
                            <input type="text" placeholder="담당업무" name="resumeCpDuty" id="resumeCpDuty" required>
                        </div>
                    </div>
                </section>

                <section class="self-intro">
                    자기소개서란<b class="b">*</b><br>
                    <textarea placeholder="1000자 이내로 작성해주세요" cols="100" rows="20" name="resumeIntroduce"
                        id="resumeIntroduce" required></textarea>
                </section>

                <div class="btn" style="border: none;">
                    <c:if test="${resumePageUserId == sessionScope.user.userId}">
                        <button type="submit" id="saveButton"
                            style="color: white; background-color: blue; border: solid 1px blue;">등록</button>
                    </c:if>
                    <button type="button" onclick="saveResume()">임시저장</button>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
