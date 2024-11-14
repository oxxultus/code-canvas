package com.webproject.codecanvas.entity;

import jakarta.persistence.*;
import lombok.Data; // Lombok을 사용할 경우, @Data로 Getter, Setter, toString, equals, hashCode를 자동으로 생성할 수 있습니다.

@Entity
@Table(name = "users")
@Data // Lombok을 이용한 Getter, Setter, toString, equals, hashCode 자동 생성
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String name;

    private String phone;
    private String address;
    private String gender;
    private String birth;

}
