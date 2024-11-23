package com.webproject.codecanvas.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.http.SessionCreationPolicy;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)  // CSRF 보호 비활성화 (필요 시 활성화 가능)
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                "/WEB-INF/views/**",
                                "/api/login",
                                "/api/register",
                                "/api/user/current",
                                "/api/portfolio/save",
                                "/images/**",
                                "/scripts/**",
                                "/audio/**",
                                "/styles/**",
                                "/portfolio",
                                "/editportfolio",
                                "/information",
                                "/certificates",
                                "/competitions",
                                "/calendar",
                                "/community",
                                "/writecommunity",
                                "/api/community/save",
                                "/home",
                                "/increaseCertificateCount"
                        ).permitAll()  // 인증 없이 접근 가능한 URL
//                        .requestMatchers("/portfolio").authenticated()  // 인증이 필요한 URL
                        .anyRequest().authenticated()  // 그 외의 모든 요청은 인증 필요
                )
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)  // 세션 생성 정책 설정
                )
                .formLogin(form -> form
                        .loginPage("/")  // 로그인 페이지 설정
                        .permitAll()  // 로그인 페이지는 인증 없이 접근 가능
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")  // 로그아웃 URL 설정
                        .logoutSuccessUrl("/")  // 로그아웃 후 리다이렉트 URL
                        .permitAll()  // 로그아웃 URL 접근 가능
                );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();  // 패스워드 인코더 설정 (BCrypt 방식)
    }
}
