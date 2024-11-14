package com.webproject.codecanvas.dto;

import lombok.Data;
import lombok.AllArgsConstructor;

@Data
@AllArgsConstructor
public class LogoutResponse {
    private String message;
    private boolean success;
}