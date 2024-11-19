package com.webproject.codecanvas.service;

import com.webproject.codecanvas.dto.PortfolioRequestDTO;
import com.webproject.codecanvas.entity.*;
import com.webproject.codecanvas.repository.CertificateRepository;
import com.webproject.codecanvas.repository.PortfolioRepository;
import com.webproject.codecanvas.repository.ProjectRepository;
import com.webproject.codecanvas.repository.SocialButtonIconRepository;
import com.webproject.codecanvas.repository.TechStackIconRepository;
import com.webproject.codecanvas.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PortfolioService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CertificateRepository certificateRepository;

    @Autowired
    private PortfolioRepository portfolioRepository;

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private SocialButtonIconRepository socialButtonIconRepository;

    @Autowired
    private TechStackIconRepository techStackIconRepository;

    public void savePortfolio(PortfolioRequestDTO portfolioRequestDTO) {
        // User 찾기
        User user = userRepository.findById(portfolioRequestDTO.getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Certificate 처리
        Certificate certificate = portfolioRequestDTO.getCertificate();
        if (certificate.getId() != null && certificateRepository.existsById(certificate.getId())) {
            // 기존 Certificate 업데이트
            certificate.setUser(user);
            certificateRepository.save(certificate);
        } else {
            // 새 Certificate 저장
            certificate.setUser(user);
            certificateRepository.save(certificate);
        }

        // Portfolio 처리
        Portfolio portfolio = portfolioRequestDTO.getPortfolio();
        if (portfolio.getId() != null && portfolioRepository.existsById(portfolio.getId())) {
            // 기존 Portfolio 업데이트
            portfolio.setUser(user);
            portfolioRepository.save(portfolio);
        } else {
            // 새 Portfolio 저장
            portfolio.setUser(user);
            portfolioRepository.save(portfolio);
        }

        // Project 처리
        Project project = portfolioRequestDTO.getProject();
        if (project.getId() != null && projectRepository.existsById(project.getId())) {
            // 기존 Project 업데이트
            project.setUser(user);
            projectRepository.save(project);
        } else {
            // 새 Project 저장
            project.setUser(user);
            projectRepository.save(project);
        }

        // SocialButtonIcon 처리
        SocialButtonIcon socialButtonIcon = portfolioRequestDTO.getSocialButtonIcon();
        if (socialButtonIcon.getId() != null && socialButtonIconRepository.existsById(socialButtonIcon.getId())) {
            // 기존 SocialButtonIcon 업데이트
            socialButtonIcon.setUser(user);
            socialButtonIconRepository.save(socialButtonIcon);
        } else {
            // 새 SocialButtonIcon 저장
            socialButtonIcon.setUser(user);
            socialButtonIconRepository.save(socialButtonIcon);
        }

        // TechStackIcon 처리
        TechStackIcon techStackIcon = portfolioRequestDTO.getTechStackIcon();
        if (techStackIcon.getId() != null && techStackIconRepository.existsById(techStackIcon.getId())) {
            // 기존 TechStackIcon 업데이트
            techStackIcon.setUser(user);
            techStackIconRepository.save(techStackIcon);
        } else {
            // 새 TechStackIcon 저장
            techStackIcon.setUser(user);
            techStackIconRepository.save(techStackIcon);
        }
    }
}
