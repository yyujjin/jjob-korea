
function loadFile(event) {
    var output = document.getElementById('output');
    var instructions = document.getElementById('photo-instructions');

    if (event.target.files[0]) {
        // 지침 숨기고 이미지 미리보기 표시
        instructions.style.display = 'none';
        output.style.display = 'block';
        output.src = URL.createObjectURL(event.target.files[0]);

        output.onload = function () {
            URL.revokeObjectURL(output.src); // 메모리 해제
        }
    } else {
        // 파일이 선택되지 않은 경우 표시 초기화
        instructions.style.display = 'block';
        output.style.display = 'none';
        output.src = '';
    }
}

function saveResume(isTemporary) {
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

            function validateForm() {
                var salary = document.getElementById('resumeCpSalary').value;
                if (isNaN(salary) || salary.trim() === "") {
                    alert('연봉 필드는 숫자여야 합니다.');
                    return false;
                }
                return true;
            }
