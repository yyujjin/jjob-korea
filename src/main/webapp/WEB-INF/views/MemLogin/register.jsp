<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
<link rel="stylesheet" href="../resources/css/login_style/loginstyle.css">
<script type="text/javascript" src="/js/jquery.js"></script>
<script>
	 $(document).ready(function() {
	        console.log("JQuery Loaded");
	        $('#id').on('blur', function() {
	            var memId = $(this).val();
	            console.log("memId:", memId);
	            if (memId) {
	                $.ajax({
	                    type: 'POST',
	                    url: '/checkId',
	                    data: { memId: memId },
	                    success: function(response) {
	                        console.log("AJAX Response:", response);
	                        if (response.exists) {
	                            $('#idError').text('이미 존재하는 아이디입니다.');
	                        } else {
	                            $('#idError').text('');
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
    <div id="individualForm" class="container">
        <form id="signup-form" method="post" action="/registerOk">
            <input type="hidden" name="type" value="individual">
            <div class="form-group">
                <input type="text" id="id" name="memId" placeholder="아이디" required>
                <div id="idError" class="error-message" style="color:red;"></div>
            </div>
            <div class="form-group">
                <input type="password" id="password" name="memPwd" placeholder="비밀번호(8-16자 영문, 숫자, 특수문자)" required>
            </div>
            <div class="form-group">
                <input type="text" id="name" name="memName" placeholder="이름" required>
            </div>
            <div class="form-group">
                <input type="text" id="birth" name="memBirth" placeholder="생년월일(예시:20000131)" maxlength="8" required>
                <div class="radio-Box">
                    <input type="radio" id="boy" name="memGender" value="M" required>
                    <label for="boy">남자</label>
                    <input type="radio" id="girl" name="memGender" value="F" required>
                    <label for="girl">여자</label>
                </div>
            </div>
            <div class="form-group">
                <input type="text" id="email" name="memEmail" placeholder="이메일" required>
            </div>
            <div class="form-group">
                <input type="text" id="phone" name="memPhone" placeholder="휴대폰번호" required>
            </div>
            <div class="form-group">
                <input type="text" id="addr" name="memAddr" placeholder="주소" required>
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
<div id="enterpriseForm" class="container" style="display: none;">
    <form id="signup-form" method="post" action="/registerOk">
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
            <input type="text" id="companyRegistrationNum" name="companyRegistrationNum" placeholder="사업자등록번호*" required>
        </div>
        <div class="form-group">
            <input type="text" id="companyName" name="companyName" placeholder="회사명*" required>
        </div>
        <div class="form-group">
            <input type="text" id="companyRepresentativeName" name="companyRepresentativeName" placeholder="대표자명*" required>
        </div>
        <div class="form-group">
            <input type="text" id="companyAddr" name="companyAddr" placeholder="회사주소*" required>
        </div>
        <div class="form-group">
            <input type="text" id="companyBusinessRegistrationNum" name="companyBusinessRegistrationNum" placeholder="사업자등록증명원 발급번호*" required>
        </div>
        <div class="contactPerson">
            <h3>인사담당자 정보</h3>
            <div class="form-group">
                <input type="text" name="memId" placeholder="아이디*" required>
                <div id="idError" class="error-message" style="color:red;"></div>
            </div>
            <div class="form-group">
                <input type="password" name="memPwd" placeholder="비밀번호*" required>
            </div>
            <div class="form-group">
                <input type="text" name="memName" placeholder="가입자명*" required>
            </div>
            <div class="form-group">
                <input type="text" name="memPhone" placeholder="전화번호*" maxlength="13" required>
            </div>
            <div class="form-group">
                <input type="text" name="memEmail" placeholder="이메일*" required>
            </div>
            <div class="form-group">
                <input type="text" name="memAddr" placeholder="주소*" required>
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
