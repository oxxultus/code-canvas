package com.webproject.codecanvas.controller;

import com.webproject.codecanvas.dto.LoginRequest;
import com.webproject.codecanvas.dto.RegisterRequest;
import com.webproject.codecanvas.entity.User;
import com.webproject.codecanvas.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserService userService;

    // 기존 로그인 엔드포인트
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest, HttpSession session) {
        try {
            // 사용자 인증
            User user = userService.login(loginRequest.getEmail(), loginRequest.getPassword());
            System.out.println("user: " + user);

            // 사용자에게 기본 역할 부여 (권한이 없을 경우)
            List<GrantedAuthority> authorities = Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));

            // 인증 객체 생성 (기본 역할 "ROLE_USER" 부여)
            UsernamePasswordAuthenticationToken authenticationToken =
                    new UsernamePasswordAuthenticationToken(user, null, authorities);

            // 인증 정보를 SecurityContext에 저장
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);

            // 세션에 사용자 정보 저장 (세션에 인증 정보 추가)
            session.setAttribute("user", user);

            // 로그인 성공 시 사용자 정보 반환
            return ResponseEntity.ok().body(user);
        } catch (RuntimeException e) {
            // 로그인 실패 시 오류 메시지 반환
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    // 기존 회원가입 엔드포인트
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest registerRequest) {
        try {
            User user = userService.register(registerRequest);
            return ResponseEntity.ok().body(user);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    // 현재 로그인된 사용자 정보 조회
    @GetMapping("/user/current")
    public ResponseEntity<?> getCurrentUser(HttpSession session) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User is not authenticated");
        }

        return ResponseEntity.ok().body(user);
    }

}