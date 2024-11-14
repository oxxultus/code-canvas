// 1. UserService.java 확장
package com.webproject.codecanvas.service;

import com.webproject.codecanvas.dto.RegisterRequest;
import com.webproject.codecanvas.entity.User;
import com.webproject.codecanvas.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 기존 로그인 메서드
    public User login(String email, String password) {
        Optional<User> user = userRepository.findByEmail(email);

        if (user.isPresent() && passwordEncoder.matches(password, user.get().getPassword())) {
            return user.get();
        }
        throw new RuntimeException("Invalid email or password");
    }

    // 회원가입 메서드 추가
    public User register(RegisterRequest registerRequest) {
        // 이메일 중복 검사
        if (userRepository.findByEmail(registerRequest.getEmail()).isPresent()) {
            throw new RuntimeException("Email already exists");
        }

        // 비밀번호 유효성 검사
        if (!isValidPassword(registerRequest.getPassword())) {
            throw new RuntimeException("Invalid password format");
        }

        // 새 사용자 생성
        User user = new User();
        user.setEmail(registerRequest.getEmail());
        user.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        user.setName(registerRequest.getName());
        user.setPhone(registerRequest.getPhone());
        user.setAddress(registerRequest.getAddress());
        user.setGender(registerRequest.getGender());
        user.setBirth(registerRequest.getBirth());

        return userRepository.save(user);
    }

    // 비밀번호 유효성 검사 메서드
    private boolean isValidPassword(String password) {
        // 최소 8자, 최대 20자
        // 최소 하나의 대문자, 소문자, 숫자, 특수문자 포함
        String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,20}$";
        return password.matches(pattern);
    }

    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
}
