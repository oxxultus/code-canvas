//package com.webproject.codecanvas.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http
//                .csrf(AbstractHttpConfigurer::disable)
//                .authorizeRequests()
//                .requestMatchers("/WEB-INF/views/**","/api/login", "/api/register","/api/user/current","/index","/images/**","/scripts/**","/audio/**","/styles/**").permitAll()
//                .anyRequest().authenticated();
//        return http.build();
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//}

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
                .csrf(AbstractHttpConfigurer::disable)  // CSRF 보호 비활성화 (필요시 활성화)
                .authorizeRequests()
                .requestMatchers("/WEB-INF/views/**", "/api/login", "/api/register", "/api/user/current", "/images/**", "/scripts/**", "/audio/**", "/styles/**").permitAll()// 인증 없이 접근 가능한 URL
                .requestMatchers( "/index").permitAll()
                .requestMatchers("/portfolio").authenticated()
                .anyRequest().authenticated()  // 그 외의 모든 요청은 인증이 필요
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)  // 세션 생성 정책 설정 (필요할 때만 생성)
                .and()
                .formLogin()  // 로그인 폼 활성화 (기본 설정을 사용할 경우)
                .loginPage("/")  // 로그인 페이지 설정 (필요 시 커스터마이징 가능)
                .permitAll()  // 로그인 페이지는 모두 접근 가능
                .and()
                .logout()
                .logoutUrl("/logout")  // 로그아웃 URL 설정
                .logoutSuccessUrl("/index")  // 로그아웃 후 리다이렉트할 URL 설정
                .permitAll();
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();  // 패스워드 인코더 설정 (BCrypt 방식)
    }
}
