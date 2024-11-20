package com.webproject.codecanvas.dto;

import com.webproject.codecanvas.entity.Certificate;
import com.webproject.codecanvas.entity.Portfolio;
import com.webproject.codecanvas.entity.Project;
import com.webproject.codecanvas.entity.SocialButtonIcon;
import com.webproject.codecanvas.entity.TechStackIcon;
import lombok.Data;

@Data
public class PortfolioRequestDTO {
    private Certificate certificate;
    private Portfolio portfolio;
    private Project project;
    private SocialButtonIcon socialButtonIcon;
    private TechStackIcon techStackIcon;
    private Long userId;  // 유저 ID를 받음
}