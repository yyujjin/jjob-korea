<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
<link rel="stylesheet" href="../resources/css/login_style/loginstyle.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script>
    /*회원가입 입력값 검증*/

    //아이디 검증
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
        //비밀번호 검증
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
        //이름 검증
        function validateName() {
            const name = document.getElementById('name').value;
            const nameRegex = /^[a-zA-Z가-힣\s]{2,12}$/;
            const nameError = document.getElementById('nameError');

            if (!nameRegex.test(name)) {
                nameError.textContent = "2~12자 한글, 영문, 공백만 사용가능합니다.";
                nameError.style.display = "block";
                return false;
            } else {
                nameError.textContent = "";
                nameError.style.display = "none";
                return true;
            }
        }
        //생년월일 검증
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
        //이메일 검증
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
        //휴대폰 번호 검증
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

        function validateForm() {
            const userIdValid = validateUserId();
            const passwordValid = validatePassword();
            const nameValid = validateName();
            const birthdValid = validateBirthd();
            const emailValid = validateEmail();
            const phoneValid = validatePhone();
            return userIdValid && passwordValid && nameValid && birthdValid&& emailValid && phoneValid;
        }

        $(document).ready(function () {
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
        });
	// $(document).ready(function() {
	// 	        console.log("JQuery Loaded");
	// 	        $('#userId, #enterpriseUserId').on('blur', function() {
	// 	            var userId = $(this).val();
	// 	            console.log("userId:", userId);
	// 	            if (userId) {
	// 	                $.ajax({
	// 	                    type: 'POST',
	// 	                    //url: '/checkId',
	// 	                    url: '/checkId',
	// 	                    data: { userId: userId },
	// 	                    success: function(response) {
	// 	                        console.log("AJAX Response:", response);
	// 	                        if (response.exists) {
	// 	                            alert('이미 존재하는 아이디입니다.'); // 메시지 창 띄우기
	// 	                            $(this).val(''); // 입력 필드 초기화 (선택 사항)
	// 	                        }
	// 	                    },
	// 	                    error: function(xhr, status, error) {
	// 	                        console.error("AJAX Error:", status, error);
	// 	                    }
	// 	                });
	// 	            }
	// 	        });

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
		    // });
</script>
<script>
$(document).ready(function() {
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
});
</script>
	<script>
	    document.addEventListener('DOMContentLoaded', function() {
	        const tabs = document.querySelectorAll('.tab');
	        const individualForm = document.getElementById('individualForm');
	        const enterpriseForm = document.getElementById('enterpriseForm');
	        const signupForm = enterpriseForm.querySelector('form');

	        // 폼 제출 시 데이터 출력 이벤트 리스너 추가
	        signupForm.addEventListener('submit', function(event) {
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
</script>
</head>
<body>
    <div class="tab-container">
        <div class="tabs">
            <div class="tab active" data-tab="individual">개인회원</div>
            <div class="tab" data-tab="enterprise">기업회원</div>
        </div>
    </div>
    <div id="individualForm" class="container02">
        <form id="signup-form" method="post" action="/register">
            <input type="hidden" name="type" value="individual">
            <div class="form-group">
                <input type="text" id="userId" name="userId" placeholder="아이디" required>
                <div id="userIdError" class="error-message"></div>
                <div id="idError" class="error-message" style="color:red;"></div>
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" placeholder="비밀번호(8-16자 영문, 숫자, 특수문자)" required>
                <div id="passwordError" class="error-message"></div>
            </div>
            <div class="form-group">
                <input type="text" id="name" name="name" placeholder="이름" required>
                <div id="nameError" class="error-message"></div>
            </div>
            <div class="form-group">
                <input type="text" id="individualBirthd" id="birthd" name="birthd" placeholder="생년월일(예시:20000131)" maxlength="8" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required>
                <div id="birthdError" class="error-message"></div>
                <div class="radio-Box">
                    <input type="radio" id="individualBoy" name="gender" value="M" required>
                    <label for="individualBoy">남자</label>
                    <input type="radio" id="individualGirl" name="gender" value="F" required>
                    <label for="individualGirl">여자</label>
                </div>
            </div>
            <div class="form-group">
                <input type="text" id="email" name="email" placeholder="이메일" required>
                <div id="emailError" class="error-message"></div>
            </div>
            <div class="form-group">
                <input type="text" id="phone" name="phone" placeholder="휴대폰번호(숫자만 입력해주세요.)" required>
                <div id="phoneError" class="error-message"></div>
            </div>
            <div class="form-group">
                <input type="text" id="addr" name="addr" placeholder="주소" required>
            </div>
            <div class="terms-container">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li><span style="color: black;font-size: 15px;">
                        필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신
                        (선택)에 모두 동의합니다.</span></li>
                            <li class="checkA11btn">
                                <input type="checkbox" name="chk" id="chk" class="all">
                            </li>
                        </ul>
                    </li>
                    <hr>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>이용약관 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>개인정보 수집 및 이용 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>문자서비스 이용약관 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <hr>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]개인정보 수집 및 이용 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]광고성 정보 이메일 수신 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]광고성 정보 SMS 수신 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="filter01">
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="form-group">
                    <button type="submit">가입하기</button>
                </div>
            </div>
        </form>
    </div>

    <!-- 기업 회원가입 -->
    <div id="enterpriseForm" class="container02" style="display: none;">
        <form id="signup-form" method="post" action="/register">
            <div class="form-group">
                <div class="cpinfo">
                    <h4>기업정보</h4>
                </div>
                <div class="head-guide">
                    <li><span style="color: red;">*</span>필수정보</li>
                </div>
            </div>
            <input type="hidden" name="type" value="enterprise">
            <div class="form-group">
                <select name="companyType" class="selectType" required>
                    <option value="" disabled selected style="display: none;">기업형태</option>
                    <option value="스타트기업">스타트기업</option>
                    <option value="중소기업">중소기업(300명이상)</option>
                    <option value="대기업">대기업</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" id="companyIndustry" name="res" placeholder="업종*" required>
            </div>
            <div class="form-group">
                <input type="text" id="employeeCount" name="employeeCount" placeholder="사원수*" required>
            </div>
            <div class="form-group">
                <input type="text" id="salary" name="salary" placeholder="연봉*" required>
            </div>
            <div class="form-group">
                <input type="text" id="businssNum" name="businssNum" placeholder="사업자등록번호*" required>
            </div>
            <div class="form-group">
                <input type="text" id="companyName" name="name" placeholder="회사명*" required>
            </div>
            <div class="form-group">
                <input type="text" id="companyRepresentativeName" name="ceo" placeholder="대표자명*" required>
            </div>
            <div class="form-group">
                <input type="text" id="companyAddr" name="addr" placeholder="회사주소*" required>
            </div>
            <div class="contactPerson">
                <h3>인사담당자 정보</h3>
                <div class="form-group">
                    <input type="text" id="userId" name="userId" placeholder="아이디*" required>
                    <div id="idError" class="error-message" style="color:red;"></div>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="비밀번호*" required>
                </div>
                <div class="form-group">
                    <input type="text" name="name" placeholder="가입자명*" required>
                </div>
                <div class="form-group">
                    <input type="text" name="phone" placeholder="전화번호*" maxlength="13" required>
                </div>
                <div class="form-group">
                    <input type="text" name="email" placeholder="이메일*" required>
                </div>
				<div class="form-group">
                    <input type="text" id="enterpriseBirthd" name="birthd" placeholder="생년월일(예시:20000131)" maxlength="8" required>
                    <div class="radio-Box">
                        <input type="radio" id="enterpriseBoy" name="gender" value="M" required>
                        <label for="enterpriseBoy">남자</label>
                        <input type="radio" id="enterpriseGirl" name="gender" value="F" required>
                        <label for="enterpriseGirl">여자</label>
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" name="addr" placeholder="주소*" required>
                </div>
            </div>
            <div class="terms-container">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li><span style="color: black;font-size: 15px;">
                        필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신
                        (선택)에 모두 동의합니다.</span></li>
                        <li class="checkA11btn">
                            <input type="checkbox" name="chk" id="chk" class="all">
                        </li>
                    </ul>
                </li>
                <hr>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li><span style="color: blue;">[필수]</span>이용약관 동의</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" class="filter01">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li><span style="color: blue;">[필수]</span>개인정보 수집 및 이용 동의</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" class="filter01">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li><span style="color: blue;">[필수]</span>문자서비스 이용약관 동의</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" class="filter01">
                        </li>
                    </ul>
                </li>
                <hr>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>[선택]개인정보 수집 및 이용 동의</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" class="filter01">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>[선택]광고성 정보 수신 동의</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" class="filter01">
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="form-group">
                <button type="submit">가입하기</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>