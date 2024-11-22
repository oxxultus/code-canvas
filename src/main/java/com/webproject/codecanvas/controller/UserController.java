package com.webproject.codecanvas.controller;

import com.webproject.codecanvas.dto.LoginRequest;
import com.webproject.codecanvas.dto.RegisterRequest;
import com.webproject.codecanvas.entity.User;
import com.webproject.codecanvas.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest, HttpSession session) {
        try {
            // 사용자 인증
            User user = userService.login(loginRequest.getEmail(), loginRequest.getPassword());

            // 세션에 사용자 정보 저장
            session.setAttribute("user", user);

            // JSON 형식으로 응답
            Map<String, Object> response = new HashMap<>();
            response.put("status", "success");
            response.put("message", "로그인 성공");
            response.put("user", user);

            return ResponseEntity.ok(response);
        } catch (RuntimeException e) { // 인증 실패 처리: RuntimeException을 잡아야 합니다.
            // 이메일 또는 비밀번호 틀림
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("status", "error");
            errorResponse.put("message", "로그인 실패: 이메일 또는 비밀번호를 확인하세요.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(errorResponse);
        } catch (Exception e) { // 기타 예외 처리
            // 일반적인 서버 오류 처리
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("status", "error");
            errorResponse.put("message", "서버에 문제가 발생했습니다. 잠시 후 다시 시도해주세요.");
            errorResponse.put("error", e.getMessage()); // 디버깅 용도로 추가
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
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
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/user/current] : 세선에 저장된 로그인 정보가 없습니다. (비로그인 상태)\n"); // 디버깅을 위한 출력
            System.out.println("------------------------------------------------------------------------\n");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User is not authenticated");
        }

        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("[/api/user/current] 로그인 되어 있습니다.\n" + user + "\n");
        System.out.println("------------------------------------------------------------------------\n");

        return ResponseEntity.ok().body(user);
    }

    /* 로그아웃에 대한 api 는 구현하지 않습니다.
     * Springboot Security 의 logout 을 사용합니다.
     * Springboot Security 에 내장되어 있는 logout 은 기존의 저장된 세선을 삭제해줍니다.
     * 그러므로 본 프로젝트에서는 세션방식으로 로그인 되어 있기 때문에 따로 구현 할 필요 없이
     * Springboot Security의 /logout api 를 사용합니다.
     * */
}