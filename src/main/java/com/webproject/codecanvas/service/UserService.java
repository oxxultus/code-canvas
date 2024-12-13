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

    // 로그인 메서드
    public User login(String email, String password) {
        // 주어진 이메일로 사용자를 찾기 위해 userRepository에서 검색
        Optional<User> user = userRepository.findByEmail(email);

        // 사용자가 존재하고, 입력한 비밀번호와 저장된 비밀번호가 일치하는지 확인
        if (user.isPresent() && passwordEncoder.matches(password, user.get().getPassword())) {
            // 로그인 성공: 일치하는 사용자가 있으면 해당 사용자 객체 반환
            return user.get();
        }

        // 로그인 실패: 이메일 또는 비밀번호가 잘못된 경우 예외 발생
        throw new RuntimeException("잘못된 이메일 또는 비밀번호입니다.");
    }

    // 회원가입 메서드
    public User register(RegisterRequest registerRequest) {
        // 이메일 중복 검사: 동일한 이메일로 이미 가입된 사용자가 있는지 확인
        if (userRepository.findByEmail(registerRequest.getEmail()).isPresent()) {
            // 이메일이 중복되면 예외 발생
            throw new RuntimeException("이미 존재하는 이메일입니다.");
        }

        // 비밀번호 유효성 검사: 비밀번호가 요구 사항에 맞는지 확인
        if (!isValidPassword(registerRequest.getPassword())) {
            // 비밀번호 형식이 올바르지 않으면 예외 발생
            throw new RuntimeException("비밀번호 형식이 잘못되었습니다.");
        }

        // 새 사용자 객체 생성
        User user = new User();
        user.setEmail(registerRequest.getEmail());  // 사용자 이메일 설정
        user.setPassword(passwordEncoder.encode(registerRequest.getPassword()));  // 비밀번호 암호화 후 설정
        user.setName(registerRequest.getName());  // 사용자 이름 설정
        user.setPhone(registerRequest.getPhone());  // 사용자 전화번호 설정
        user.setAddress(registerRequest.getAddress());  // 사용자 주소 설정
        user.setGender(registerRequest.getGender());  // 사용자 성별 설정
        user.setBirth(registerRequest.getBirth());  // 사용자 생년월일 설정

        // 새 사용자를 데이터베이스에 저장하고 저장된 사용자 객체 반환
        return userRepository.save(user);
        /*
         .save()는 Spring Data JPA 에서 제공하는 메서드로, 엔티티 객체를 데이터베이스에 저장하는 기능을 합니다. 이 메서드는 새로운 데이터를 저장하거나 기존 데이터를 업데이트하는 역할을 합니다.

         새로운 객체를 저장할 경우: 만약 데이터베이스에 해당 엔티티가 존재하지 않으면, 새로운 레코드가 생성되어 저장됩니다.
         기존 객체를 업데이트할 경우: 이미 데이터베이스에 존재하는 객체와 동일한 id 값을 가진 객체를 저장하면, 해당 객체가 업데이트됩니다. 즉, 객체의 필드 값이 변경되면 해당 변경 사항이 데이터베이스에 반영됩니다.

         portfolio 객체가 portfolioRepository.save()에 전달되면, Spring Data JPA 는 해당 객체를 데이터베이스에 저장하려 시도합니다.
          - 객체에 id가 없거나, 새로운 엔티티라면 INSERT 쿼리가 실행되어 새 레코드가 추가됩니다.
          - 객체에 id가 존재하고, 해당 id를 가진 레코드가 이미 데이터베이스에 있다면, 기존 레코드가 업데이트됩니다. 이때는 UPDATE 쿼리가 실행됩니다.

          즉, .save()는 기존 데이터의 업데이트와 새로운 데이터의 삽입을 모두 처리할 수 있는 Spring Data JPA 메서드입니다.
        */
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
