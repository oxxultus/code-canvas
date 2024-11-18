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
        User user = userRepository.findById(portfolioRequestDTO.getUserId()).orElseThrow(() -> new RuntimeException("User not found"));

        // Certificate 저장
        Certificate certificate = portfolioRequestDTO.getCertificate();
        certificate.setUser(user);
        certificateRepository.save(certificate);

        // Portfolio 저장
        Portfolio portfolio = portfolioRequestDTO.getPortfolio();
        portfolio.setUser(user);
        portfolioRepository.save(portfolio);

        // Project 저장
        Project project = portfolioRequestDTO.getProject();
        project.setUser(user);
        projectRepository.save(project);

        // SocialButtonIcon 저장
        SocialButtonIcon socialButtonIcon = portfolioRequestDTO.getSocialButtonIcon();
        socialButtonIcon.setUser(user);
        socialButtonIconRepository.save(socialButtonIcon);

        // TechStackIcon 저장
        TechStackIcon techStackIcon = portfolioRequestDTO.getTechStackIcon();
        techStackIcon.setUser(user);
        techStackIconRepository.save(techStackIcon);
    }
}
