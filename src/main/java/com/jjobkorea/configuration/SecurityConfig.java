package com.jjobkorea.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new  BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {

        httpSecurity.authorizeHttpRequests((auth) -> auth
                .requestMatchers("/WEB-INF/views/**").permitAll()//jsp
                .requestMatchers("/resources/**").permitAll()
                .requestMatchers("/", "/login", "/register").permitAll() //메인, 로그인, 회원가입
                .requestMatchers("/jobPosts", "/searchFilter").permitAll() //채용 정보
                .requestMatchers(
                        "/jobseekerContent_view",
                                "/requestPage/jobseekerContent_view",
                                "/getComments",
                                "/board",
                                "/display",
                                "/getFileList",
                                "/download").permitAll() //게시판,

                .anyRequest().authenticated()
        );

        //접근이 거부되면 로그인 페이지로 이동
        httpSecurity.formLogin((auth) -> auth.loginPage("/login")
                .loginProcessingUrl("/login").permitAll())
                
                //로그아웃
                .logout((logout) -> logout
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                // 성공하면 루트 페이지로 이동
                .logoutSuccessUrl("/")
                // 로그아웃 시 생성된 사용자 세션 삭제
                .invalidateHttpSession(true)
        );

        httpSecurity
                .sessionManagement((auth) -> auth
                        .maximumSessions(3)
                        .maxSessionsPreventsLogin(false)); //초과 시 기존 세션 삭제후 새로운 로그인 진행


        httpSecurity
                .sessionManagement((auth) -> auth
                .sessionFixation().changeSessionId());

        //csrf 사용 x
        httpSecurity.csrf((auth) -> auth.disable());
        return httpSecurity.build();
    }
}
