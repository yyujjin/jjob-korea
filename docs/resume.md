## ✨이력서 메인 페이지 전체 화면

---

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c5ca6f96-8369-4f0d-813d-ec0464de15b3/image.png)

## 📌주요 기능

---

## 이력서 등록

- **우리가 제작한 짭코리아 프로그램 자체에 대한 소개**
- **리드미를 작성하는 이유 :**

  **깃허브주소로 왔을 때 우리 프로젝트는 이런 프로젝트에요~ 라는 걸 알려주는 거**

- **사용자 시나리오를 작성하면 됨 (코드 넣지 x)**
    - **물건 사면 사용 설명서 있는것처럼 유저가 우리 프로그램을 실행했을 때 어떻게 작동되는건지 알려주는 거임**
- **기능에 중점을 두어 작성하기**
- **각자 분담된 페이지에 대해서 시나리오 작성하기**
- **각자 이름 적혀있는 빈 토글에 적으면 됨**
- **변경사항 적지말기(1,2차 나눠서 작성하지 말고 현재 상태 기준으로만 작성하기)**
    - 1차때는 요랬는데 2차때는 요래됐쑴다~ << 이런거 하지말기
- **다음 주 금요일까지 작성 완료하기**
- **스프링 시큐리티 설명과, aws  설명 이외에는 코드 넣지 말기**
    - **도훈 쓰 코드 넣을 때 사진으로 캡쳐된거 하지말고 이렇게 적어주세염 ><**

    ```java
    @Override
    public void registerUser(HashMap<String, String> param) {
        param.put("password",bCryptPasswordEncoder.encode(param.get("password")));
    
        userMapper.individualUser(param);
    }
    ```


---

### ✨ 가이드 라인

## 📌 페이지 전체 화면

---

## 📌 주요 기능

---

### 기능

---

### 기능

---

### 기능

---

- **토글 활용하기**
- 글 적을 때 불릿 포인트(`-` + `스페이스바`) 넣기
- 코드 넣지 말기

---

### 사진 보내기

## ❗중요 ❗

## 작성하면서 사용되는 사진 파일 **[aba1740@naver.com](mailto:aba1740@naver.com) 으로 보내기**

- 사진 파일 이름은 **`페이지이름_순서`**
- 로그인
    - login_1
    - login_2

  …

- 게시판
    - board_1
    - board_2 ….

ex)

- 사용된 사진이 2개라면
- 사용된 순서대로 이름 짓기

**security_1**

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/54d0ccec-f003-4350-9222-1682060b03f0/image.png)

security_2

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/d7d224a5-489b-4c43-b067-4412251f9cef/image.png)

# ✅ 본인꺼 다 한 사람은 댓글 남겨주기!

- **📁 보안 (박유진)**

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/54d0ccec-f003-4350-9222-1682060b03f0/image.png)

  ## 🔐 Spring Security 적용
    
  ---

    - **Spring Security**를 사용하여 보안 기능을 강화하였습니다.
    - Spring Security는 애플리케이션의 인증(Authentication)과 권한 부여(Authorization)를 관리하고, 보안 관련 기능을 제공합니다.

  ## 📌 주요 보안 기능
    
  ---

    - **세션 방식**
        - 사용자의 로그인 상태를 서버의 세션에 저장하고, 세션 ID를 쿠키를 통해 클라이언트와 통신하여 인증을 처리합니다.
    - **BCryp를 사용한 비밀번호 암호화**
        - 사용자의 비밀번호를 안전하게 저장하기 위해 암호화 알고리즘을 사용하여 비밀번호를 해시 처리하였습니다.

            ```java
            @Bean
            public BCryptPasswordEncoder bCryptPasswordEncoder() {
                return new  BCryptPasswordEncoder();
            }
            ```

            ```java
            @Override
            public void registerUser(HashMap<String, String> param) {
                param.put("password",bCryptPasswordEncoder.encode(param.get("password")));
            
                userMapper.individualUser(param);
            }
            ```

    - **경로 기반 접근 제어**
        - URL 패턴에 따라 사용자의 접근 권한을 제어합니다.
        - 특정 경로에 대해 인증된 사용자만 접근할 수 있도록 설정하였습니다.

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/ab4cdd73-63e3-4649-bf08-2b39e51239bd/image.png)


    - **세션 소멸 시간**
        
        ```java
        server.servlet.session.timeout=60m
        ```
        
        - 60분
    - **다중 로그인 허용 개수 설정**
        - 다중 로그인 허용 개수를 하나로 설정하여 초과시 기존 세션을 하나 삭제시키고 새로운 로그인을 진행하도록 설정하였습니다.
        
        ```java
        httpSecurity
                        .sessionManagement((auth) -> auth
                        .maximumSessions(1)
                        .maxSessionsPreventsLogin(false));
        ```
        
    - **세션 고정 보호 설정**
        - 로그인 시 세션은 동일하지만 서버로 전달되는 세션 쿠키 id값을 변경시키도록 설정하였습니다.
        
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/d7d224a5-489b-4c43-b067-4412251f9cef/image.png)
    
    ## 🔐 OAuth2.0 google 인증 기능
    
    ---
    
    - **OAuth2.0 Google 인증 기능**을 사용하여 사용자가 Google 계정을 통해 애플리케이션에 로그인할 수 있도록 설정하였습니다.
    - OAuth2.0 프로토콜을 활용하여 인증을 수행하고, Google 계정을 통해 사용자 정보를 안전하게 관리합니다.
    
    ## 📌 기능 설명
    
    ---
    
    - **사용자 인증 요청**
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/184caa2c-c7e0-47a5-b339-e4ce46297ad4/image.png)
        
        - 사용자가 로그인 페이지에서 구글 아이콘을 클릭하면 Google 로그인 페이지로 리디렉션됩니다.
    - **Google 로그인**
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/46646b6c-ead9-40af-8254-71d7f29110e6/image.png)
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/a60f404b-ee59-4055-b217-c0956d8d5c1d/image.png)
        
        - 사용자는 Google 계정으로 로그인합니다.
    - **토큰 수신**
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/9dd5a640-e50a-474c-a777-c21225234272/image.png)
        
        - Google은 인증 후 애플리케이션에 액세스 토큰을 발급합니다.
    - **사용자 정보 가져오기**
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/15eeba37-18e9-4bc7-a633-67ef71be6d47/image.png)
        
        - 애플리케이션은 액세스 토큰을 사용하여 Google로부터 사용자 정보를 가져옵니다.
    - **로그인 완료**
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/1f167df3-a38d-4b73-b38f-02d807967471/image.png)
        
        - 애플리케이션에서 사용자가 로그인 상태로 전환됩니다.

- **📁 로그인 (문균호)**

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c4782c5d-c26c-4e15-949b-63be6a4ce75f/image.png)

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/5ab2af98-a760-4bf4-a842-c46ae0a2d6cc/image.png)

  ## 📌주요기능
    
  ---

    - 개인회원 로그인

      개인회원 회원가입 시 ROLE_JOB_SEEKER로 저장이 되며 개인회원 아이디는
      기업회원으로 로그인이 되지않는다.

    - 기업 로그인

      기업회원 회원가입 시 ROLE_COMPANY_USER로 저장이 되며 기업회원 아이디는
      개인회원으로 로그인이 되지않는다.

    - 탭기능

      개인회원 탭을 선택하면 개인회원으로 로그인이 가능하게 폼이 바뀌며,
      기업회원 탭을 선택하면 기업회원으로 로그인이 가능하게 폼이 바뀌어
      회원별 로그인이 가능하다.

    - 아이디, 비밀번호 불일치

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c656fd99-3e37-4e2e-ae23-b995ab79f635/image.png)

      아이디, 비밀번호가 일치하지 않으면 알림창이 나와 아이디, 비밀번호가 일치하지않았다는것을 알 수 있다.


- **📁 회원가입 (문균호)**

  ## 📌개인 회원 가입 전체 페이지

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/a51b6869-06ed-4834-9bb2-bc6e8a2f3a74/image.png)

  ## 📌주요 기능
    
  ---

    - 정규식 검증

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/f97f2dfe-43f0-4a48-9a2c-ec5dd58905e5/image.png)

        - 회원가입 시 아이디, 비밀번호, 이름, 생년월일, 이메일, 휴대폰 번호에
          유효한 입력값을 입력하기 위해 정규식 검증
        - 생년월일은 숫자만 입력이 가능하다.
    - 유효성 검사

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/56705458-a14b-4a29-a949-255734f3152a/image.png)

      중복된 아이디 확인을 통해 이미 존재하는 아이디로는 회원가입을 하지못하게 되어있다.

    - 이메일 인증

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/59cd0def-10c9-4130-89ce-3742f8b8fe08/image.png)

      사용자가 인증 받을 이메일을 입력하고 이메일 인증 버튼을 클릭한다.

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/a0e9974a-6320-4c67-a818-911b4b3fc18d/image.png)

      인증번호가 발송되었다는 알림이 나오며

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/5a5a1d7f-bd06-4a66-b6ca-de44564db6e6/image.png)

      입력한 이메일에서 인증코드를 확인하여

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/a9bacc84-4e5d-43de-b880-4415828fab1e/image.png)

      인증코드를 입력하고 인증번호 확인 버튼을 클릭한다.

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/ea2347c6-3dd1-4c85-8871-3c8f11977d7c/image.png)

      인증코드가 일치하다면 인증에 성공했다는알림이 나오며 회원가입이 가능하고
      불일치해도 알림이 나오지만 회원가입이 불가능하다.

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/d5db88d7-caf8-472d-ac66-881cb84edbad/9486fc64-2d1a-4799-b974-f3cbac444e1c.png)

    - 회원정보 조회, 수정

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/0171838c-3099-4d1d-9424-cbab35125a0c/image.png)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/8c042f43-c5c6-4a5f-b0e8-cfd768fbed4d/image.png)

      회원 정보 수정을 클릭하면 로그인 한 사용자의 정보를 조회 가능하고

      로그인 한 사용자가 자신의 정보를 수정할 수 있으며
      name, phone,address, email,birthdate, gender 수정이 가능하다.
      변경할 내용을 입력하고 수정하기 버튼을 클릭하면 확인창이 나오게 되며 확인을
      눌렸을 시 수정이 된다.

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/25172c09-6915-4981-bcfc-ad2bde69effa/image.png)

    - 회원정보 삭제(탈퇴)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/93b58127-900b-4728-bf39-f4c67d971e3c/image.png)

      탈퇴하기 버튼을 누르면 정말 탈퇴하시겠습니까?라는 확인 창이 나오며
      확인을 눌렀을 경우 회원 탈퇴가 된다.
      (회원 정보가 DB에서 삭제)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/1ffb96d2-7f1a-4c07-bdcf-32763b37d207/image.png)


    ## 📝기업 회원가입
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/2ef4b357-8522-47e7-be91-6fa2c922e1b6/image.png)
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/cc45dc24-a99c-4aea-b2a3-f8b163f26182/image.png)
    
    ## 📌주요기능
    
    - 드롭다운 메뉴
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/8d46e7e5-94fe-4aad-9432-886005614588/21ec7b7d-bbff-47c6-88d8-59ef367e6209.png)
        
        화살표를 누르면 목록이 보이며 기업형태를 3종류 중 하나 선택할 수 있다.
        
    - 아이디 중복확인
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/ae719b3d-929d-433c-950b-68eeebae4e5d/image.png)
        
        개인과 기업 구분없이 아이디가 존재한다면 아이디 중복 확인 때
        이미 존재하는 아이디입니다라는 알림창이 뜨며 확인을 누르면 중복됐던 
        
        아이디는 지워진다.
        
    
    ---

- **📁 메인 페이지 (박유진)**

  ## 📌 메인 페이지 전체 화면
    
  ---

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/438c7578-92f7-4290-ac4c-74df92b85763/image.png)

  ## 📌 주요 기능
    
  ---

  ### 네비게이션 메뉴
    
  ---

    - **로그인 전**

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/082d327a-1038-4802-82bf-78221f049d12/image.png)

        - **`채용 정보`**: 현재 진행 중인 모든 채용 정보를 확인할 수 있습니다.
        - **`취업 톡톡`(게시판)** : 사용자들이 취업과 관련된 다양한 이야기를 나눌 수 있는 커뮤니티 공간입니다.
    - **구직자로 로그인한 경우**

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/551c5f74-74a6-4805-b05d-8e23c38716be/image.png)

        - **`이력서 관리`**: 구직자는 이력서를 등록하고 관리할 수 있습니다.
    - **기업으로 로그인한 경우**

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/a5f4e066-15e6-4434-95ae-7167c47a1fc8/image.png)

        - **`공고 등록`**: 기업 사용자는 새로운 채용 공고를 등록할 수 있습니다.

  ### 광고 배너 슬라이더
    
  ---

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/b7092d75-d6e0-4c20-931b-a78ace092690/image.png)

    - 광고 배너는 2초마다 자동으로 변경되며, 사용자는 여러 광고를 순차적으로 확인할 수 있습니다

  ### 채용 정보 카드 시스템
    
  ---

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/d542dd55-1ad6-4899-a377-0e6f8dc86483/image.png)

    - **상위 8개 채용 정보 카드 표시**
        - 메인 페이지에는 조회수가 가장 높은 상위 8개의 채용 정보 카드가 출력됩니다.
    - **조회수 리셋**
        - 조회수는 매일 오전 9시에 자동으로 리셋됩니다. 이를 통해 최신 채용 정보를 계속해서 상위에 노출시킬 수 있습니다.
    - **자동 업데이트**
        - 페이지 로드 시 최신 조회수 기반으로 카드가 자동으로 업데이트됩니다.
    - **조회수 동점 시 기업 이름 오름차순 정렬**
        - 조회수가 동일한 경우, 기업 이름을 오름차순으로 정렬하여 순위를 매깁니다.

- **📁 채용 정보 페이지 (박유진)**


    ## 📌 채용 정보 페이지 전체 화면
    
    ---
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/47b4f3c1-62c9-4561-9757-0691350c1a5a/image.png)
    
    ## 📌 주요 기능
    
    ---
    
    ### 채용 공고 상세 검색
    
    ---
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/38eb74aa-905e-445d-bf77-92dc240d497b/image.png)
    
    - **드롭다운 메뉴**
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/1e101516-f519-461e-be76-a313ba857b05/image.png)
        
        - 각 드롭다운 메뉴는 사용자가 특정 조건에 맞는 채용 공고를 찾을 수 있도록 합니다.
    - **검색 옵션 박스**
        
        ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/b05c441a-b82c-44dc-8a3c-2cb2919df7d7/image.png)
        
        - 선택된 옵션은 검색 옵션 박스에 표시됩니다.
        - 옵션 옆의 `x` 버튼을 클릭하면 해당 옵션이 삭제됩니다.
        - 이미 추가된 옵션은 검색 옵션 박스에 추가되지 않습니다.
    - **`초기화`버튼**
        - 검색 옵션 박스에 담긴 모든 옵션이 한 번에 삭제됩니다.
    - **`선택된 조건 검색하기` 버튼**
        - 사용자가 선택한 조건을 기반으로 채용 공고를 필터링하여 관련 채용 공고를 화면에 보여줍니다.
    
    ### 채용 정보 리스트
    
    ---
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/789699b4-8ba5-45bb-b6d4-c4f28f095be0/image.png)
    
    - **채용 공고 정렬 기준**
        - 채용 공고는 현재 날짜와 비교해 마감 기한이 가까운 순으로 정렬되며, 마감 기한이 동일한 경우에는 기업 이름을 기준으로 오름차순 정렬됩니다.
    - **남은 기간 표시 방법**
        - 채용 공고 마감 기한이 하루 이상 남았을 때 : `D-남은 날짜`
        - 채용 공고 마감 기한이 당일일 때 : `D-day`
    
    ### 페이징
    
    ---
    
    - 각 페이지에 채용 정보가 10개씩  출력됩니다.

- **📁 채용 정보 상세보기페이지 (차혜영)**


    ## 📌 채용 페이지 전체화면 사용자 시나리오
    
    ---
    
    ## 개요
    
    이 문서는 채용 정보를 제공하는 페이지의 전체화면 사용자 시나리오를 설명합니다.
    페이지는 기업 정보, 채용 정보, 상세 정보 섹션으로 구성되며, 사용자가 채용 공고를 확인하고,
    지원할 수 있는 기능을 포함하고 있습니다.
    
    ![채용공고view.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/5abb6771-1184-41b9-a35f-01f9b8d2dbe6/%EC%B1%84%EC%9A%A9%EA%B3%B5%EA%B3%A0view.png)
    
    ## 페이지 구성 요소
    
    페이지는 다음과 같은 주요 섹션들로 구성됩니다:
    
    ### 1. 회사 정보 섹션
    
    - **회사 이름:** 기업의 공식 명칭을 표시합니다.
    - **대표자:** 기업의 대표자 이름을 표시합니다.
    - **업종:** 기업이 속한 산업군을 표시합니다.
    - **기업 규모:** 대기업, 중견기업, 중소기업 등 기업의 규모를 표시합니다.
    - **설립년도:** 기업이 설립된 연도를 표시합니다.
    - **직원수:** 현재 기업에 소속된 직원 수를 표시합니다.
    - **주소:** 기업 본사의 주소를 표시합니다.
    
    ### 2. 채용 정보 섹션
    
    - **회사사진:** 기업의 로고 또는 대표 이미지를 화면 상단에 표시합니다.
    - **직무:** 채용하려는 직무의 명칭을 표시합니다.
    - **근무지역:** 해당 직무의 근무지를 표시합니다.
    - **고용형태:** 정규직, 계약직, 인턴 등 고용 형태를 표시합니다.
    - **경력 여부:** 신입 또는 경력직 여부를 표시합니다.
    - **채용 마감 날짜:** 지원 접수 마감일을 표시합니다.
    
    ### 3. 상세 정보 섹션
    
    - **공고 내용:** 채용 공고의 상세한 내용을 기재합니다. 여기에는 업무 내용, 요구 조건, 제공되는 혜택, 지원 방법 등 채용과 관련된 모든 정보가 포함됩니다.
    
    ### 4. 지원하기 버튼
    
    - **지원하기 버튼:** 페이지 하단 또는 우측 상단에 "지원하기" 버튼이 위치합니다.
        - **버튼 동작:** 사용자가 "지원하기" 버튼을 클릭하면, 즉시 지원이 완료되며, 화면에 알림 메시지가 나타납니다.
        - **알림 메시지:** "지원이 완료되었습니다."라는 메시지가 사용자에게 표시됩니다.
    
    ## 📌 주요 기능
    
    ---
    
    ### 기업이 업로드 한 이미지 가져오기
    
    ---
    
    ![채용공고view2.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/8274d07a-4586-40be-8543-c117ea99a592/%EC%B1%84%EC%9A%A9%EA%B3%B5%EA%B3%A0view2.png)
    
    - 등록된 채용공고에 맞는 이미지를 가져옵니다.
    
    ### 이미지 등록 유무에 따라 이미지 출력하기
    
    ---
    
    ![채용공고view3.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c5812e2f-ef7d-4791-b0bb-dfdbffa7f0aa/%EC%B1%84%EC%9A%A9%EA%B3%B5%EA%B3%A0view3.png)
    
    - 이미지 등록을 하지 않으면 ‘이미지가 제공되지 않습니다.’ 라는 문구가 있는 이미지가 출력됩니다.

- **📁 채용 공고 등록 페이지 (차혜영)**


    ## 📌 페이지 전체 화면
    
    ---
    
    ![채용공고.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c4bc816c-be18-485c-bf38-914ed3f882a1/%EC%B1%84%EC%9A%A9%EA%B3%B5%EA%B3%A0.png)
    
    ## 개요
    
    채용 공고 등록 폼은 회사가 채용 공고를 게시할 수 있도록 설계된 웹 기반 인터페이스입니다. 사용자는 회사 이름, 직무, 경력, 근무지, 고용 형태, 공고제목, 급여, 채용마감날짜, 회사이미지, 상세정보 등 주요 채용 정보를 입력할 수 있습니다.
    
    ### 1. **회사 이름**
    
    - 채용을 진행하는 회사의 이름을 입력합니다.
    
    ### 2. **직무**
    
    - 공고하는 직무 또는 포지션을 입력합니다.
    
    ### 3. **경력**
    
    - 해당 직무에 필요한 경력 수준을 선택합니다:
        - **경력무관**: 경력 무관
        - **신입**: 신입
        - **경력**: 경력자
    
    ### 4. **근무지**
    
    - 해당 직무의 근무지를 입력합니다.
    
    ### 5. **고용 형태**
    
    - 고용 형태를 선택합니다:
        - 선택 가능한 옵션에는 정규직, 계약직, 파트타임 등이 포함될 수 있습니다.
    
    ### 6. **공고 제목**
    
    - 채용 공고의 제목을 입력합니다.
    
    ### 7. **급여**
    
    - 급여 범위 또는 금액을 입력합니다. 숫자 형식으로 입력합니다.
    
    ### 8. **채용 마감 날짜**
    
    - 지원서 접수 마감 날짜를 선택합니다.
    
    ### 9. **회사 이미지**
    
    - 회사의 이미지를 업로드할 수 있습니다.
    
    ### 10. **상세 정보**
    
    - 직무와 관련된 상세 정보를 입력합니다.
    
    ### 11. **등록 버튼**
    
    - 모든 필드를 작성한 후 "등록" 버튼을 클릭하여 채용 공고를 등록합니다.
    - 폼에 입력된 모든 내용이 저장되고, 설정된 시스템 또는 데이터베이스에 채용 공고가 게시됩니다.
    
    ## 📌 주요 기능
    
    ---
    
    ### 파일 이미지 업로드하기
    
    ---
    
    ![채용공고2.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/f1fdb9dd-b901-4446-b64b-ed3662a5e7e5/%EC%B1%84%EC%9A%A9%EA%B3%B5%EA%B3%A02.png)
    
    - 파일선택을 누르면 사진을 업로드 할 수 있습니다.

- **📁 게시판 (조해욱)**
    - **글 목록 페이지**

      ## 📌 글 목록 페이지
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c2256ea1-2fa3-43a9-9c73-fc25dc2fc602/image.png)

        - 글 목록 페이지에서는 사용자들이 작성한 글들의 목록을 한눈에 볼 수 있습니다. 각 글은 번호, 아이디, 제목, 작성 날짜, 조회수, 좋아요 수의 정보가 포함되어 있습니다.

      ## 📌 주요 기능
        
      ---

      ### 글 검색 기능
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/e7d05e34-2ae7-4256-b250-a68543a87dde/8e3feda9-c78c-4f68-b236-69e5df4d842b.png)

        - **검색 필터:** 글 제목, 내용, 작성자 등을 기준으로 필터를 설정하여 게시글을 검색할 수 있습니다.
        - **결과 표시:** 검색 결과는 표 형태로 보여지며, 화면 아래쪽에 있는 버튼을 눌러서 다른 페이지로 이동할 수 있습니다.

      ### 페이징 기능
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/67b97ba1-40ed-42e6-9c5e-dcc1728a3960/image.png)

        - **페이징 단위 설정:** 기본적으로 한 페이지에 10개의 글이 표시되며, 글의 수가 10개를 초과할 경우 다음 페이지로 넘겨가며 조회할 수 있습니다.
        - **페이지 이동:** 페이징 바를 통해 사용자는 원하는 페이지로 쉽게 이동할 수 있습니다.

        ---

    - **글 보기 페이지**

      ## 📌 글 보기 페이지
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/998d2e78-79ca-4703-a7a2-9cabedf8fd65/image.png)

        - 글 보기 페이지는 사용자가 특정 글을 선택했을 때 해당 글의 상세 내용을 보여줍니다.
        - **글 제목 및 본문**: 글의 제목과 본문 내용이 표시됩니다. 이미지가 포함된 경우 이미지도 함께 표시됩니다.
        - **댓글 보기 및 작성**: 로그인한 사용자는 글 하단에 댓글을 작성할 수 있으며, 이미 작성된 댓글을 조회할 수 있습니다.

      ## 📌 주요 기능
        
      ---

      ### 좋아요 기능
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/6bd39074-c47d-4a0e-93b6-3ca55ca08fe6/image.png)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/16cd904d-bddf-4d43-9711-41c3d82c621d/image.png)

        - **좋아요 버튼**: 각 글에는 좋아요 기능이 포함되어 있어, 사용자가 글을 좋아요 할 수 있습니다. 좋아요 버튼을 누른 경우 아이콘이 채워진 하트로 변합니다.
        - **실시간 업데이트**: 좋아요 수가 실시간으로 반영됩니다. 각 사용자의 좋아요 상태가 글 번호별로 저장됩니다.

      ### 댓글 작성 기능
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/651f1a03-f313-498c-8a90-bc652645b4dd/image.png)

        - **댓글 저장**: 로그인한 사용자는 댓글을 작성할 수 있습니다.
        - **유효성 검사**: 작성된 댓글이 공백일 경우 알림창이 출력됩니다.

      ### 조회수 기능
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/2eac3dce-a4ec-4676-93ba-5a7e88ed3392/image.png)

        - **조회수 증가**: 글을 열람하면 조회수가 증가합니다. 단, 글 작성자와 현재 로그인한 사용자가 동일한 경우 조회수는 증가하지 않습니다.

        ---

    - **글 작성 페이지**

      ## 📌 글 작성 페이지
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/04a25539-2ed9-451a-94dd-a1b079fab955/image.png)

        - **제목 및 내용 입력**: 사용자는 글의 제목과 내용을 입력할 수 있으며, 이 필드는 필수 입력 사항입니다.
        - **파일 업로드**: 이미지와 ZIP 파일을 첨부할 수 있는 기능이 제공되며, 업로드된 파일은 게시글과 함께 저장됩니다.
        - **목록 보기**: 작성 중이던 글을 취소하고 글 목록 페이지로 돌아갈 수 있는 기능입니다.

      ## 📌 주요 기능
        
      ---

      ### 글 작성 기능
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/73ae6e1d-4b23-47c8-b746-ef05b668d613/image.png)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/63c19898-0cab-4795-a8e4-d912172bb866/image.png)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/2c24a9a0-d783-421d-bd5c-3719f9304e26/image.png)

        - **유효성 검사**: 제목이나 내용이 입력되지 않으면 유효성 검사가 실행되며, 경고 메시지가 표시됩니다. 모든 입력 항목이 완료되어야만 글을 작성할 수 있습니다.

      ### 이미지, 파일 업로드 기능
        
      ---

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/aada57b0-9dee-417d-bf4b-6c33c37ed876/image.png)

        - **파일 업로드**: 사용자는 이미지 파일과 ZIP 파일을 게시글에 첨부할 수 있습니다. 업로드된 파일은 작성 페이지에 미리보기로 표시됩니다.
        - **파일 삭제**: 업로드된 파일은 글 작성 중에 언제든지 삭제할 수 있습니다.

        ---

- **📁 이력서 (한도훈)**

  ## ✨이력서 메인 페이지 전체 화면
    
  ---

  ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c5ca6f96-8369-4f0d-813d-ec0464de15b3/image.png)

  ## 📌주요 기능
    
  ---

  ## 이력서 등록

    - 이력서 등록 페이지

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/843c748c-14d5-44b7-ac9e-8b9fee061bd2/image.png)

      이력서 작성/등록 페이지이며 입력해야할 필수 항목들을 별표로 표시했습니다.

        - 사진 업로드

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/cd2f6097-6839-47d7-b661-be9a51ef82d7/image.png)

          자신의 컴퓨터에 있는 사진을 업로드 하면 AWS S3 버킷에 저장되게만들었으며 저장하면

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c7171c34-11dd-49f1-a052-ff35e00206d7/image.png)

          이런식으로 S3에 저장되어 사진이 서버로 데이터가 들어가 사진의 입출력을 구현했습니다.

            ```java
            private String uploadFileToS3Bucket(MultipartFile file) throws IOException {
                    String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
                    
                    // 메타데이터 생성 및 설정
                    ObjectMetadata objectMetadata = new ObjectMetadata();
                    objectMetadata.setContentType(file.getContentType());
                    objectMetadata.setContentLength(file.getSize()); // 파일의 크기 설정
                    
                    // InputStream으로 파일을 읽어들임
                    try (InputStream inputStream = file.getInputStream()) {
                        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, fileName, inputStream, objectMetadata);
                        amazonS3.putObject(putObjectRequest);
                    }
                    String fileUrl = amazonS3.getUrl(bucketName, fileName).toString();
                    log.info("fileUrl 로 파일이 업로드 되었습니다."+fileUrl);
                    return fileUrl; // S3 URL 반환
                }
            ```

          우선 InputStream 파일을 읽어들인 뒤 S3에 이미지를 URL로 반환하여 DB에 저장하고 DB에 저장된 경로를 불러오는 형식의 코드입니다.

        - 기술 스택

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/00c9a43f-1c00-465b-80f7-80ba3dbed527/image.png)

          기술 스택 선택 칸이며 총 세 가지의 자신의 기술을 선택할 수 있습니다. 드롭다운 메뉴를 열면 총 9개의 기술 스택이 나오게 됩니다. 총 세 개의 기술 스택을 설정하면

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c88bbda3-27d3-4db5-bce9-c7144f54cc8d/image.png)

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/5fa3e7c9-3c1b-4c32-ac55-c59611bb6e0e/image.png)

          이런식으로 표시가 되며 만약 세 가지 이상의 기술을 선택하거나 같은 기술을 선택시 경고 문구가 출력되게끔 설정하였습니다.

        - 경력 입력칸

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/e20d0bc7-83c9-4cad-9abd-70be8528617d/image.png)

          경력쪽 칸이며 자신이 경력이 없는 신입이라면 신입란을 체크하여 입력칸을 비활성화 시켜 값을 입력하지 않아도 저장할 수 있도록 설정하였습니다. 만약 안에 값이 들어있는 상태에서 체크를 하게되면 칸이 비어지게끔 설정했습니다.

        - 이력서 등록/수정/삭제

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/6377efcd-4943-4b21-9c97-c17934b753d3/image.png)

          위에 형식으로 칸들을 다 작성하고 등록 버튼을 누르면 이력서 메인페이지에

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/7a4f60e8-5584-4345-93bd-3d8186ddfa3e/image.png)

          위 형식으로 저장이 됩니다. 만약 위에 이력서 처럼 자신의 개인정보들이 수정이 필요하게되면 수정 버튼을 누르고 들어가

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/ac67ade3-2067-4c28-b0ff-8a914ca39b2b/image.png)

          위 형식으로 자신의 정보들을 수정할 수 있습니다.

          만약 자신의 이력서의 쓰임새나 필요성이 사라졌을 경우 삭제 버튼을 누르면 이력서가 삭제됨을 확인 할 수 있습니다.

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/d160667d-779c-44d8-9ad3-ac4783570f86/image.png)

          ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/fc05bd20-b864-4996-b43d-314e5980d7f2/image.png)

- **📁 AWS RDS 사용한 데이터베이스 설정 (한도훈)**

  ## 📌 AWS RDS 데이터베이스 설정
    
  ---

  AWS 아마존 웹 서비스를 이용한 데이터베이스 서버화

    - AWS RDS 설정

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/8de06b62-f9f0-4fdd-9aef-22c70bccfcb3/image.png)

      우선 database-3 라는 데이터베이스를 생성합니다. RDS를 사용하기 위해서는 여러 설정이 필요한데 그 중 가장 먼저 해주어야할 설정이 VPC 보안 그룹 설정입니다.

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/27b336e0-20a9-4ec2-9131-66b03ececabb/image.png)

      보안그룹을 들어가 인바인드 규칙을 설정해줍니다.

      IPv4 ::/0

      IPv6 0.0.0.0/0

      소스를 설정하여 두 IP버전을 모두가 접속할 수 있게끔 설정을 해줍니다.

      다음으로는 파라미터 그룹을 새로 만들어 설정합니다.

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/e60d0b11-a5a1-45b1-a63e-65b64c030893/image.png)

      파라미터 그룹을 설정하는 이유는 utf8mb4 를 설정해주기 위해 그리고 자신이 설정한 서버의 지역을 설정하기 위해 파라미터 그룹을 설정합니다. 예시

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/c90af742-01da-412b-b526-e97a3a3e2595/744bab09-cd6b-4a53-b44d-1346a215e44b.png)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/3470fc5d-43bb-41e8-ad38-61feac705a01/image.png)

      ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/bf46baf7-09b5-40c4-8941-0bb45a246f30/image.png)

      이런식으로 다 설정해준 뒤 구성에 파라미터 그룹을 지정해줍니다. 다음으로는 첫 번째 사진에 있는 엔드포인트를 이용하여 MySQL Workbench에

      ![image01.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/812b948e-9751-4209-8bc5-1e65635e7178/aed16158-0811-45c8-95ce-d81df980654b/image01.png)

      이런식으로 엔드포인트를 입력해주고 Test Connection을 누르면 잘 적용된 것을 확인할 수 있습니다.

      다음으로 개발 툴에 application.properties와 bulid.gradle 를 설정하면 RDS 구성이 완료됩니다.

      우선 application.properties

        ```java
        spring.datasource.hikari.jdbc-url=jdbc:mysql:/[엔드포인트]/[디비:데이터베이스 이름]?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSL=false
        spring.datasource.hikari.username=[UserName]
        spring.datasource.hikari.password=[password]
        ```

      마지막으로 build.gradle

        ```java
        dependencyManagement {
            imports {
                mavenBom "org.springframework.cloud:spring-cloud-dependencies:2022.0.5"
                mavenBom "software.amazon.awssdk:bom:2.20.0"
            }
        }
        dependencies {
            implementation 'io.awspring.cloud:spring-cloud-aws-context:2.4.0'
            implementation 'io.awspring.cloud:spring-cloud-starter-aws:2.4.2'
            }
        ```

      build.gradle 마무리하면 설정 완료입니다.