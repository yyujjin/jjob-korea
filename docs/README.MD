# <img src="/docs/images/jjobkorea_logo.png" width="150" height="70"> 프로젝트 소개


잡코리아를 벤치마킹한 구인구직 사이트

## 👩🏻‍💻팀원 소개


- 박유진 (팀장)
- 문균호
- 조해욱
- 차혜영
- 한도훈

## 📆개발 기간


2024년 7월 2일 ~ 2024년 8월 23일

## ⚙️개발 환경 및 기술 스택


- **개발 환경**: STS4, IntelliJ IDEA, VS Code
- **프로그래밍 언어**: Java, JavaScript, CSS, HTML
- **프레임워크**: Spring Boot, Bootstrap
- **템플릿 엔진**: JSP
- **ORM**: MyBatis
- **데이터베이스**: AWS RDS (MySQL)
- **버전 관리**: GitHub
- **보안**: Spring Security, OAuth 2.0

## 🔐보안



<img src="/docs/images/security/security_1.png" width="150" height="70">

Spring Security는 애플리케이션의 인증(Authentication)과 권한 부여(Authorization)를 관리하고, 보안 관련 기능을 제공합니다.

### 주요 보안 기능
<details>
  <summary>세션 방식</summary>

- 사용자의 로그인 상태를 서버의 세션에 저장하고, 세션 ID를 쿠키를 통해 클라이언트와 통신하여 인증을 처리합니다.
</details>

<details>
  <summary> BCryp를 사용한 비밀번호 암호화 </summary>

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
`암호화 전 : 1234`

`암호화 후 : $2a$10$lq2k83jqlpiJQ5LPs5tQQe/vtgmlsgRQ32d/KQGpk/UQlQfw.w3AC`
</details>

<details>
  <summary>경로 기반 접근 제어</summary>

- URL 패턴에 따라 사용자의 접근 권한을 제어합니다.
- 특정 경로에 대해 인증된 사용자만 접근할 수 있도록 설정하였습니다.
```java
@Bean
public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {

    httpSecurity.authorizeHttpRequests((auth) -> auth
            .requestMatchers("/WEB-INF/views/**").permitAll()//jsp
            .requestMatchers("/resources/**").permitAll()
            .requestMatchers("/", "/login", "/register","/checkId","/userUpdate","/deleteUser").permitAll() //메인, 로그인, 회원가입,아이디 중복, 회원정보 수정, 회원 삭제 확인
            .requestMatchers("/jobPosts", "/searchFilter","/jobPosting").permitAll()//채용 정보
            .requestMatchers(
                    "/getComments",
                    "/board",
                    "/display",
                    "/getFileList",
                    "/download").permitAll() //게시판
            .requestMatchers("/api/v1/email/send", "/api/v1/email/verify").permitAll()  // 이메일 인증 경로 접근 허용

            .anyRequest().authenticated()
    );
```
</details>

<details>
  <summary>세션 소멸 시간</summary>

- 60분
```java
  server.servlet.session.timeout=60m
  ```
</details>

<details>
  <summary>다중 로그인 허용 개수 설정</summary>

- 다중 로그인 허용 개수를 하나로 설정하여 초과시 기존 세션을 하나 삭제시키고 새로운 로그인을 진행하도록 설정하였습니다. 
```java
httpSecurity
            .sessionManagement((auth) -> auth
            .maximumSessions(1)
            .maxSessionsPreventsLogin(false));
 ```
</details>

<details>
  <summary>세션 고정 보호 설정</summary>

- 로그인 시 세션은 동일하지만 서버로 전달되는 세션 쿠키 id값을 변경시키도록 설정하였습니다.
```java
httpSecurity
            .sessionManagement((auth) -> auth
            .sessionFixation().changeSessionId());
 ```
</details>





## ✨ AWS RDS를 사용한 데이터 베이스 설정


## 페이지 별 기능 소개

