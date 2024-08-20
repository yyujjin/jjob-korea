$(document).ready(function () {
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
            nameError.textContent = "2~12자 한글, 영문 소문자만 사용가능합니다.";
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
            phoneError.textContent = "휴대폰번호를 다시 확인해주세요.";
            phoneError.style.display = "block";
            return false;
        } else {
            phoneError.textContent = "";
            phoneError.style.display = "none";
            return true;
        }
    }

    // 전체 폼 유효성 검사
    function validateForm() {
        const userIdValid = validateUserId();
        const passwordValid = validatePassword();
        const nameValid = validateName();
        const birthdValid = validateBirthd();
        const emailValid = validateEmail();
        const phoneValid = validatePhone();

        if (!isEmailVerified) { // 이메일 인증이 완료되지 않았을 경우
            alert("이메일 인증이 되지 않았습니다.");
            return false;
        }
        return userIdValid && passwordValid && nameValid && birthdValid && emailValid && phoneValid;
    }
	// keyup 이벤트(사용자가 키를 누른 후 뗄 때마다 실행) -> vaildate~함수 호출
	    $('#userId').on('keyup', function () {
	        validateUserId();
	    });
	    $('#password').on('keyup', function () {
	        validatePassword();
	    });
	    $('#name').on('keyup', function () {
	        validateName();
	    });
	    $('#individualBirthd').on('keyup', function () {
	        validateBirthd();
	    });
	    $('#email').on('keyup', function () {
	        validateEmail();
	    });
	    $('#phone').on('keyup', function () {
	        validatePhone();
	    });
		// 폼 제출 시 유효성 검사(유효성이 적합하지 않으면 제출을 막음)
		   $('#signup-form').on('submit', function (e) {
		       if (!validateForm()) {
		           e.preventDefault();
		       }
		   });
	// 이메일 인증 번호 전송
	    function sendNumber() {
	        console.log('sendNumber 호출됨');
	        const email = $("#email").val();
	        if (!validateEmail()) {
	            return;
	        }
	        $.ajax({
	            url: "/api/v1/email/send",
	            type: "post",
	            contentType: "application/json",
	            data: JSON.stringify({ "mail": email }),
	            success: function (data) {
	                alert("인증번호가 발송되었습니다.");
	                $("#mail_number").addClass("visible");
	            },
	            error: function () {
	                alert("이메일 발송에 실패하였습니다. 다시 시도해주세요.");
	            }
	        });
	    }

	    // 이메일 인증 번호 확인
	    function confirmNumber() {
	        const email = $("#email").val();
	        const number = $("#verifyCode").val();

	        $.ajax({
	            url: "/api/v1/email/verify",
	            type: "post",
	            contentType: "application/json",
	            dataType: "json",
	            data: JSON.stringify({ "mail": email, "verifyCode": number }),
	            success: function (data) {
	                if (data) {
	                    alert("이메일 인증에 성공하였습니다.");
	                    isEmailVerified = true; // 이메일 인증 성공 시 true로 설정
	                } else {
	                    alert("인증 번호가 올바르지 않습니다.");
	                    isEmailVerified = false; // 인증 실패 시 false로 설정
	                }
	            },
	            error: function () {
	                alert("인증에 실패하였습니다. 다시 시도해주세요.");
	                isEmailVerified = false; // 인증 실패 시 false로 설정
	            }
	        });
	    }

	    // 이벤트 바인딩
	    $('#sendEmailButton').on('click', sendNumber);
	    $('#verifyCodeButton').on('click', confirmNumber);
	});

	// 탭 전환 기능
	    $('.tab').on('click', function () {
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
    
		//아이디 중복 확인
		$('#userId, #enterpriseUserId').on('blur', function () {
		    var userId = $(this).val();
		    var inputField = $(this); // this를 inputField 변수에 저장
		    console.log("userId:", userId);
		    
		    if (userId) {
		        $.ajax({
		            type: 'POST',
		            url: '/checkId',
		            data: { userId: userId },
		            success: function (response) {
		                console.log("AJAX Response:", response);
		                if (response.exists) {
		                    alert('이미 존재하는 아이디입니다.'); 
		                    inputField.val(''); 
		                }
		            },
		            error: function (xhr, status, error) {
		                console.error("AJAX Error:", status, error);
		            }
		        });
		    }
		});

   


document.addEventListener('DOMContentLoaded', function () {
    const tabs = document.querySelectorAll('.tab');
    const individualForm = document.getElementById('individualForm');
    const enterpriseForm = document.getElementById('enterpriseForm');
    const signupForm = enterpriseForm.querySelector('form');

    // 폼 제출 시 데이터 출력 이벤트 리스너 추가
    signupForm.addEventListener('submit', function (event) {
        event.preventDefault(); // 기본 제출 동작을 막습니다.

        const formData = new FormData(signupForm);
        const entries = Object.fromEntries(formData.entries());

        console.log('Form Data:', entries); // 제출된 데이터를 콘솔에 출력합니다.

        signupForm.submit(); // 기본 제출 동작을 다시 수행합니다.
    });

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            if (tab.dataset.tab === 'enterprise') {
                individualForm.style.display = 'none';
                enterpriseForm.style.display = 'block';
            } else {
                individualForm.style.display = 'block';
                enterpriseForm.style.display = 'none';
            }
        });
    });

    const filter01 = document.querySelectorAll('.filter01');
    const filterAll = document.querySelectorAll('.all');

    filterAll.forEach(allCheckbox => {
        allCheckbox.addEventListener('click', function () {
            const allChecked = this.checked;
            const container = this.closest('.terms-container');
            const checkboxes = container.querySelectorAll('.filter01');
            checkboxes.forEach(function (obj) {
                obj.checked = allChecked;
            });
        });
    });

    filter01.forEach(function (el) {
        el.addEventListener('click', function () {
            const container = this.closest('.terms-container');
            const allCheckbox = container.querySelector('.all');
            const checkboxes = container.querySelectorAll('.filter01');
            const checked = container.querySelectorAll('.filter01:checked');
            allCheckbox.checked = (checkboxes.length === checked.length);
        });
    });
});
// });

