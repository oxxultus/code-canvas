package com.webproject.codecanvas.controller;

import com.webproject.codecanvas.dto.LoginRequest;
import com.webproject.codecanvas.dto.RegisterRequest;
import com.webproject.codecanvas.entity.User;
import com.webproject.codecanvas.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/login] : 로그인을 위한 사용자 정보\n" + user + "\n"); // 디버깅을 위한 출력
            System.out.println("------------------------------------------------------------------------\n");

            // 세션에 사용자 정보 저장 (세션에 인증 정보 추가)
            session.setAttribute("user", user);

            User currentUser = (User) session.getAttribute("user");
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/login] : 세션에 저장된 사용자 정보\n" + currentUser + "\n"); // 디버깅을 위한 출력
            System.out.println("------------------------------------------------------------------------\n");

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