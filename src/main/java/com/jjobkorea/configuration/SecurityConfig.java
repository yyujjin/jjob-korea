package com.jjobkorea.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

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
                .requestMatchers("/WEB-INF/views/**").permitAll()
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
                .loginProcessingUrl("/login").permitAll()
        );

        //csrf 사용 x
        httpSecurity.csrf((auth) -> auth.disable());
        return httpSecurity.build();
    }
}