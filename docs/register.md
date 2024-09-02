## ✨개인 회원 가입 전체 페이지

![image.png](/docs/images/register/register_1.png)

## 📌주요 기능

<details>
<summary>정규식 검증</summary>

![image.png](/docs/images/register/register_2.png)

- 회원가입 시 아이디, 비밀번호, 이름, 생년월일, 이메일, 휴대폰 번호에 유효한 입력값을 입력하기 위해 정규식 검증
- 생년월일은 숫자만

- 중복된 아이디 확인을 통해 이미 존재하는 아이디로는 회원가입을 하지 못하게 되어 있다.

</details>

<details>
<summary>이메일 인증</summary>

![image.png](/docs/images/register/register_3.png)

- 사용자가 인증 받을 이메일을 입력하고 이메일 인증 버튼을 클릭한다.

![image.png](/docs/images/register/register_4.png)

- 인증번호가 발송되었다는 알림이 나온다.

![image.png](/docs/images/register/register_5.png)

- 입력한 이메일에서 인증코드를 확인하여

![image.png](/docs/images/register/register_6.png)

- 인증코드를 입력하고 인증번호 확인 버튼을 클릭한다.

![image.png](/docs/images/register/register_7.png)

- 인증코드가 일치하면 인증에 성공했다는 알림이 나오며 회원가입이 가능하다.
- 불일치할 경우 알림이 나오지만 회원가입이 불가능하다.

![image.png](/docs/images/register/register_8.png)

</details>

<details>
<summary>회원정보 조회, 수정</summary>

![image.png](/docs/images/register/register_9.png)

![image.png](/docs/images/register/register_10.png)

- 회원 정보 수정을 클릭하면 로그인한 사용자의 정보를 조회할 수 있다.
- 로그인한 사용자가 자신의 정보를 수정할 수 있으며 name, phone, address, email, birthdate, gender 수정이 가능하다.
- 변경할 내용을 입력하고 수정하기 버튼을 클릭하면 확인창이 나타나며, 확인을 눌렀을 시 정보가 수정된다.

![image.png](/docs/images/register/register_11.png)

</details>

<details>
<summary>회원정보 삭제(탈퇴)</summary>

![image.png](/docs/images/register/register_12.png)

- 탈퇴하기 버튼을 누르면 "정말 탈퇴하시겠습니까?"라는 확인 창이 나타나며, 확인을 눌렀을 경우 회원 탈퇴가 진행된다. (회원 정보가 DB에서 삭제됨)

![image.png](/docs/images/register/register_13.png)

</details>

## ✨기업 회원 가입 전체 페이지

![image.png](/docs/images/register/register_14.png)

![image.png](/docs/images/register/register_15.png)

## 📌주요 기능

<details>
<summary>드롭다운 메뉴</summary>

![image.png](/docs/images/register/register_16.png)

- 화살표를 누르면 목록이 보이며 기업 형태를 3종류 중 하나 선택할 수 있다.

</details>

<details>
<summary>아이디 중복 확인</summary>

![image.png](/docs/images/register/register_17.png)

- 개인과 기업 구분 없이 아이디가 존재하면 아이디 중복 확인 때 "이미 존재하는 아이디입니다"라는 알림창이 나타난다.
- 확인을 누르면 중복된 아이디는 삭제된다.

</details>
