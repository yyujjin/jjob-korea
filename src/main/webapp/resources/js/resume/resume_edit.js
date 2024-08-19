
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



function loadFile(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.style.display = 'block';
    document.getElementById('photo-instructions').style.display = 'none';
}
