<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 양식</title>
    <link rel="stylesheet" href="../resources/css/login_style/loginstyle.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="tab-container">
        <div class="tabs">
            <div class="tab active" data-tab="individual">개인회원</div>
            <div class="tab" data-tab="enterprise">기업회원</div>
        </div>
    </div>

    <!-- 개인회원 가입 양식 -->
    <div id="individualForm" class="container02">
        <form id="signup-form-individual" method="post" action="/register">
            <input type="hidden" name="role" value="ROLE_JOB_SEEKER">

            <div class="form-group">
                <input type="text" id="userId" name="userId" placeholder="아이디" required>
                <div id="userIdError" class="error-message"></div>
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
                <input type="text" id="birthd" name="birthd" placeholder="생년월일(예시:20000131)" maxlength="8" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required>
                <div id="birthdError" class="error-message"></div>
                <div class="radio-Box">
                    <input type="radio" id="individualBoy" name="gender" value="M" required>
                    <label for="individualBoy">남자</label>
                    <input type="radio" id="individualGirl" name="gender" value="F" required>
                    <label for="individualGirl">여자</label>
                </div>
            </div>

            <div class="form-group">
                <input type="email" id="email" name="email" placeholder="이메일" required>
                <div id="emailError" class="error-message"></div>
            </div>

            <div class="form-group">
                <input type="tel" id="phone" name="phone" placeholder="휴대폰번호(숫자만 입력해주세요.)" required>
                <div id="phoneError" class="error-message"></div>
            </div>

            <div class="form-group">
                <input type="text" id="addr" name="addr" placeholder="주소" required>
            </div>

            <div class="terms-container">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li>
                                <span style="color: black; font-size: 15px;">
                                    필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신(선택)에 모두 동의합니다.
                                </span>
                            </li>
                            <li class="checkA11btn">
                                <input type="checkbox" name="chkAll" id="chkAll" class="all">
                            </li>
                        </ul>
                    </li>
                    <hr>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>이용약관 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkTerms" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>개인정보 수집 및 이용 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkPrivacy" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>문자서비스 이용약관 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkSms" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <hr>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]개인정보 수집 및 이용 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkOptionalPrivacy" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]광고성 정보 이메일 수신 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkEmail" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]광고성 정보 SMS 수신 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkSmsMarketing" class="filter01">
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

    <!-- 기업회원 가입 양식 -->
    <div id="enterpriseForm" class="container02" style="display: none;">
        <form id="signup-form-enterprise" method="post" action="/register">
            <input type="hidden" name="role" value="ROLE_COMPANY_USER">

            <div class="form-group">
                <div class="cpinfo">
                    <h4>기업정보</h4>
                </div>
                <div class="head-guide">
                    <li><span style="color: red;">*</span>필수정보</li>
                </div>
            </div>

            <div class="form-group">
                <select name="companyType" class="selectType" required>
                    <option value="" disabled selected>기업형태</option>
                    <option value="스타트기업">스타트기업</option>
                    <option value="중소기업">중소기업(300명이상)</option>
                    <option value="대기업">대기업</option>
                </select>
            </div>

            <div class="form-group">
                <input type="text" id="companyIndustry" name="companyIndustry" placeholder="업종*" required>
            </div>

            <div class="form-group">
                <input type="text" id="employeeCount" name="employeeCount" placeholder="사원수*" required>
            </div>

            <div class="form-group">
                <input type="text" id="salary" name="salary" placeholder="연봉*" required>
            </div>

            <div class="form-group">
                <input type="text" id="businessNum" name="businessNum" placeholder="사업자등록번호*" required>
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

            <div class="contactPerson">
                <h3>인사담당자 정보</h3>
                <div class="form-group">
                    <input type="text" id="contactUserId" name="contactUserId" placeholder="아이디*" required>
                    <div id="idError" class="error-message" style="color:red;"></div>
                </div>
                <div class="form-group">
                    <input type="password" name="contactPassword" placeholder="비밀번호*" required>
                </div>
                <div class="form-group">
                    <input type="text" name="contactName" placeholder="가입자명*" required>
                </div>
                <div class="form-group">
                    <input type="text" name="contactPhone" placeholder="전화번호*" maxlength="13" required>
                </div>
                <div class="form-group">
                    <input type="email" name="contactEmail" placeholder="이메일*" required>
                </div>
                <div class="form-group">
                    <input type="text" id="enterpriseBirthd" name="contactBirthd" placeholder="생년월일(예시:20000131)" maxlength="8" required>
                    <div class="radio-Box">
                        <input type="radio" id="enterpriseBoy" name="contactGender" value="M" required>
                        <label for="enterpriseBoy">남자</label>
                        <input type="radio" id="enterpriseGirl" name="contactGender" value="F" required>
                        <label for="enterpriseGirl">여자</label>
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" name="contactAddr" placeholder="주소*" required>
                </div>
            </div>

            <div class="terms-container">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li>
                                <span style="color: black; font-size: 15px;">
                                    필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보 수신(선택)에 모두 동의합니다.
                                </span>
                            </li>
                            <li class="checkA11btn">
                                <input type="checkbox" name="chkAllEnterprise" id="chkAllEnterprise" class="all">
                            </li>
                        </ul>
                    </li>
                    <hr>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>이용약관 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkTermsEnterprise" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>개인정보 수집 및 이용 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkPrivacyEnterprise" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li><span style="color: blue;">[필수]</span>문자서비스 이용약관 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkSmsEnterprise" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <hr>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]개인정보 수집 및 이용 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkOptionalPrivacyEnterprise" class="filter01">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>[선택]광고성 정보 수신 동의</li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chkEmailEnterprise" class="filter01">
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
