<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .head-guide{font-size: 12px; float: right; list-style: none; margin-right: 10px; }  ************
    .tab-container { width: 600px; margin: 40px auto; border: 1px solid black; overflow: hidden;
    }
    .tabs { display: flex; cursor: pointer;
    }
    .tab { flex: 1; padding: 15px 20px; text-align: center; background-color: #f1f1f1; border-bottom: 2px solid transparent;
    }
    .tab.active { background-color: #007bff; color: white; border-bottom: 2px solid #007bff;
    }

    .container {max-width: 600px; margin: auto; padding: 20px;
        background-color: white; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {text-align: center; margin-bottom: 20px;
    }

    .form-group {
        display: flex;
        align-items: left; 
        margin-bottom: 20px;
    }

    label { display: block; font-weight: bold; margin-bottom: 5px;
    }

    input[type="text"],
    input[type="password"] { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
    } #birth{ width: 75%; padding: 10px; margin-left: -1px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
    }

    .contactPerson { max-width: 600px; margin: 10px; padding: 20px;
        background-color: white; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .radio-Box{
        padding: 0px 10px; 
    }
    .radio-Box input[type=radio]{
        display: none;
    }
    .radio-Box input[type=radio]+label{
        border-radius: 4px;
        box-sizing: border-box;
        display: inline-block;
        cursor: pointer;
        padding: 10px;
        border: 1px solid #ccc;
        text-align: center;
        font-size: 12px;

    }
    .radio-Box input[type=radio]:checked+label{
        background-color: white;
        border-color: black;
    }

    button[type="submit"] { background-color: #0057ff; color: white; padding: 10px 20px;
        margin: 10px auto; border: none; border-radius: 4px; cursor: pointer; width: 100%;
    }

    button[type="submit"]:hover { background-color: #0057ff;
    }
    .cpinfo{margin: 0 0 10px; padding:10px 0 0;float: left;}

    select{
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        appearance: none;
        background: url('data:image/svg+xml;utf8,<svg fill="%23ccc" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 10px center;
        background-size: 12px;
    }
    
    /* 약관동의 */
    * { margin:  auto; padding: 0; box-sizing: border-box;
    }

    body { max-width: 600px; background-color: #f7f7f7;
    }

    ul>li { list-style: none;
    }

    a { text-decoration: none;
    }

    .clearfix::after { content: ""; display: block; clear: both;
    }

    #joinForm { width: 600px; margin: 0 auto;
    }

    ul.join_box { border: 1px solid #ddd; background-color: #fff;
    }

    .checkBox,
    .checkBox>ul { position: relative;
    }

    .checkBox>ul>li {
        float: left;
    }

    .checkBox>ul>li:first-child { width: 85%; padding: 15px; font-weight: 600; color: #888;
    }

    .checkBox>ul>li:nth-child(2) { position: absolute; top: 50%; right: 30px; margin-top: -12px;
    }

    .footBtwap { margin-top: 15px;
    }

    .footBtwap>li { float: center; width: 100%; height: 50px;
    }

    .footBtwap>li>button { display: block; background-color: #0057ff; color: #fff;
        width: 100%; height: 60%; font-size: 15px; text-align: center; line-height: 1px;
    }

    hr { display: flex; margin: 0 auto; width: 90%;
    }

    #chk.all { width: 20px; height: 20px; background-color: #888;
    }

   
</style>
<script type="text/javascript" src="/js/jquery.js"></script>
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
                            <input type="checkbox" name="chk" id="chkEnterprise" class="all">
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
