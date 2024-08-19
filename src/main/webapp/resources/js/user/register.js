// 회원가입 입력값 검증

// 아이디 검증
function validateUserId() {
    const userId = document.getElementById('userId').value;
    const userIdRegex = /^[a-z0-9]+$/;
    const userIdError = document.getElementById('userIdError');

    if (userId.length < 6 || userId.length > 16 || !userIdRegex.test(userId)) {
        userIdError.textContent = "6~16자의 영문 소문자, 숫자만 사용 가능합니다.";
        userIdError.style.display = "block";
        return false;
    } else {
        userIdError.textContent = "";
        userIdError.style.display = "none";
        return true;
    }
}

// 비밀번호 검증
function validatePassword() {
    const password = document.getElementById('password').value;
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
    const passwordError = document.getElementById('passwordError');

    if (!passwordRegex.test(password)) {
        passwordError.textContent = "8~16자의 영문 대문자, 소문자, 숫자, 특수문자 조합으로 입력해주세요.";
        passwordError.style.display = "block";
        return false;
    } else {
        passwordError.textContent = "";
        passwordError.style.display = "none";
        return true;
    }
}

// 이름 검증
function validateName() {
    const name = document.getElementById('name').value;
    const nameRegex = /^[a-z가-힣]{2,12}$/;
    const nameError = document.getElementById('nameError');

    if (!nameRegex.test(name)) {
        nameError.textContent = "2~12자 한글, 영문 소문자만 사용 가능합니다.";
        nameError.style.display = "block";
        return false;
    } else {
        nameError.textContent = "";
        nameError.style.display = "none";
        return true;
    }
}

// 생년월일 검증
function validateBirthd() {
    const birthd = document.getElementById('individualBirthd').value;
    const birthdRegex = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
    const birthdError = document.getElementById('birthdError');

    if (!birthdRegex.test(birthd)) {
        birthdError.textContent = "생년월일 정보를 다시 확인해주세요.";
        birthdError.style.display = "block";
        return false;
    } else {
        birthdError.textContent = "";
        birthdError.style.display = "none";
        return true;
    }
}

// 이메일 검증
function validateEmail() {
    const email = document.getElementById('email').value;
    const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    const emailError = document.getElementById('emailError');

    if (!emailRegex.test(email)) {
        emailError.textContent = "이메일 정보를 다시 확인해주세요.";
        emailError.style.display = "block";
        return false;
    } else {
        emailError.textContent = "";
        emailError.style.display = "none";
        return true;
    }
}

// 휴대폰 번호 검증
function validatePhone() {
    const phone = document.getElementById('phone').value;
    const phoneRegex = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
    const phoneError = document.getElementById('phoneError');

    if (!phoneRegex.test(phone)) {
        phoneError.textContent = "휴대폰 번호를 다시 확인해주세요.";
        phoneError.style.display = "block";
        return false;
    } else {
        phoneError.textContent = "";
        phoneError.style.display = "none";
        return true;
    }
}

// 전체 폼 유효성 검증
function validateForm() {
    const userIdValid = validateUserId();
    const passwordValid = validatePassword();
    const nameValid = validateName();
    const birthdValid = validateBirthd();
    const emailValid = validateEmail();
    const phoneValid = validatePhone();
    return userIdValid && passwordValid && nameValid && birthdValid && emailValid && phoneValid;
}

// 문서 준비 완료 시 이벤트 처리
$(document).ready(function() {
    console.log("JQuery Loaded");

    // 입력 필드에서 키를 누를 때마다 유효성 검사
    $('#userId').on('keyup', validateUserId);
    $('#password').on('keyup', validatePassword);
    $('#name').on('keyup', validateName);
    $('#individualBirthd').on('keyup', validateBirthd);
    $('#email').on('keyup', validateEmail);
    $('#phone').on('keyup', validatePhone);

    // 폼 제출 시 유효성 검사
    $('#signup-form').on('submit', function(e) {
        if (!validateForm()) {
            e.preventDefault();
        }
    });

    // 아이디 중복 검사
    $('#userId, #enterpriseUserId').on('blur', function() {
        var userId = $(this).val();
        if (userId) {
            $.ajax({
                type: 'POST',
                url: '/checkId',
                data: { userId: userId },
                success: function(response) {
                    if (response.exists) {
                        alert('이미 존재하는 아이디입니다.');
                        $(this).val('');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error:", status, error);
                }
            });
        }
    });

    // 탭 전환 기능
    $('.tab').on('click', function() {
        var tabId = $(this).data('tab');
        $('.tab').removeClass('active');
        $(this).addClass('active');
        if (tabId === 'individual') {
            $('#individualForm').show();
            $('#enterpriseForm').hide();
        } else {
            $('#individualForm').hide();
            $('#enterpriseForm').show();
        }
    });

    // 사업자 등록번호 중복 검사
    $('#companyRegistrationNum').on('blur', function() {
        var companyRegistrationNum = $(this).val();
        if (companyRegistrationNum) {
            $.ajax({
                type: 'POST',
                url: '/checkCompanyRegistrationNum',
                data: { companyRegistrationNum: companyRegistrationNum },
                success: function(response) {
                    if (response.exists) {
                        alert('이미 존재하는 사업자등록번호입니다.');
                        $('#companyRegistrationNum').val('');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error:", status, error);
                }
            });
        }
    });

    // 폼 제출 시 데이터 출력
    const signupForm = document.querySelector('#enterpriseForm form');
    if (signupForm) {
        signupForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(signupForm);
            const entries = Object.fromEntries(formData.entries());
            console.log('Form Data:', entries);
            signupForm.submit();
        });
    }

    // 필터 체크박스 처리
    const filter01 = document.querySelectorAll('.filter01');
    const filterAll = document.querySelectorAll('.all');

    filterAll.forEach(allCheckbox => {
        allCheckbox.addEventListener('click', function() {
            const allChecked = this.checked;
            const container = this.closest('.terms-container');
            const checkboxes = container.querySelectorAll('.filter01');
            checkboxes.forEach(function(obj) {
                obj.checked = allChecked;
            });
        });
    });

    filter01.forEach(function(el) {
        el.addEventListener('click', function() {
            const container = this.closest('.terms-container');
            const allCheckbox = container.querySelector('.all');
            const checkboxes = container.querySelectorAll('.filter01');
            const checked = container.querySelectorAll('.filter01:checked');
            allCheckbox.checked = (checkboxes.length === checked.length);
        });
    });
});
