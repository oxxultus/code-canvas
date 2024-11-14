// 2. RegisterRequest.java 추가
package com.webproject.codecanvas.dto;

import lombok.Data;

@Data
public class RegisterRequest {
    private String email;
    private String password;
    private String name;
    private String phone;
    private String address;
    private String gender;
    private String birth;
}
