package com.webproject.codecanvas.controller;

import com.webproject.codecanvas.entity.Portfolio;
import com.webproject.codecanvas.entity.Certificate;
import com.webproject.codecanvas.entity.Project;
import com.webproject.codecanvas.entity.SocialButtonIcon;
import com.webproject.codecanvas.entity.TechStackIcon;
import com.webproject.codecanvas.entity.User;
import com.webproject.codecanvas.repository.PortfolioRepository;
import com.webproject.codecanvas.repository.CertificateRepository;
import com.webproject.codecanvas.repository.ProjectRepository;
import com.webproject.codecanvas.repository.SocialButtonIconRepository;
import com.webproject.codecanvas.repository.TechStackIconRepository;
import com.webproject.codecanvas.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class PortfolioController {

    @Autowired
    private PortfolioRepository portfolioRepository;

    @Autowired
    private CertificateRepository certificateRepository;

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private SocialButtonIconRepository socialButtonIconRepository;

    @Autowired
    private TechStackIconRepository techStackIconRepository;

    @Autowired
    private UserRepository userRepository;

    // 포트폴리오 페이지 가져오기 (GET)
    // 포트폴리오 페이지 가져오기 (GET)
    @GetMapping("/portfolio")
    public String getPortfolioPage(Model model, HttpSession session) {
        // 세션에서 로그인된 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        System.out.println("Current user: " + currentUser);

        if (currentUser == null) {
            return "redirect:/index";  // 로그인되지 않은 상태라면 로그인 페이지로 리디렉션
        }

        // 연관된 데이터를 모델에 추가
        model.addAttribute("portfolio", currentUser.getPortfolio());
        model.addAttribute("certificate", currentUser.getCertificate());
        model.addAttribute("project", currentUser.getProject());
        model.addAttribute("socialButtonIcon", currentUser.getSocialButtonIcon());
        model.addAttribute("techStackIcon", currentUser.getTechStackIcon());

        return "portfolio";  // 데이터가 포함된 JSP 페이지
    }

    // 포트폴리오 저장하기 (POST)
    @PostMapping("/api/portfolio/save")
    public String savePortfolio(
            @RequestParam("portfolioImg1") String portfolioImg1,
            @RequestParam("portfolioImg2") String portfolioImg2,
            @RequestParam("portfolioImg3") String portfolioImg3,
            @RequestParam("portfolioImg4") String portfolioImg4,
            @RequestParam("portfolioImg5") String portfolioImg5,
            @RequestParam("portfolioImg6") String portfolioImg6,
            @RequestParam("firstCertificateTitle") String firstCertificateTitle,
            @RequestParam("firstCertificateButtonIcon") String firstCertificateButtonIcon,
            @RequestParam("secondCertificateTitle") String secondCertificateTitle,
            @RequestParam("secondCertificateButtonIcon") String secondCertificateButtonIcon,
            @RequestParam("thirdCertificateTitle") String thirdCertificateTitle,
            @RequestParam("thirdCertificateButtonIcon") String thirdCertificateButtonIcon,
            @RequestParam("fourthCertificateTitle") String fourthCertificateTitle,
            @RequestParam("fourthCertificateButtonIcon") String fourthCertificateButtonIcon,
            @RequestParam("projectImg1") String projectImg1,
            @RequestParam("projectDesc1") String projectDesc1,
            @RequestParam("projectImg2") String projectImg2,
            @RequestParam("projectDesc2") String projectDesc2,
            @RequestParam("projectImg3") String projectImg3,
            @RequestParam("projectDesc3") String projectDesc3,
            @RequestParam("projectImg4") String projectImg4,
            @RequestParam("projectDesc4") String projectDesc4,
            @RequestParam("projectImg5") String projectImg5,
            @RequestParam("projectDesc5") String projectDesc5,
            @RequestParam("projectImg6") String projectImg6,
            @RequestParam("projectDesc6") String projectDesc6,
            @RequestParam("socialButtonIcon1") String socialButtonIcon1,
            @RequestParam("socialButtonIcon2") String socialButtonIcon2,
            @RequestParam("socialButtonIcon3") String socialButtonIcon3,
            @RequestParam("socialButtonIcon4") String socialButtonIcon4,
            @RequestParam("techStackButtonIcon1") String techStackButtonIcon1,
            @RequestParam("techStackButtonIcon2") String techStackButtonIcon2,
            @RequestParam("techStackButtonIcon3") String techStackButtonIcon3,
            @RequestParam("techStackButtonIcon4") String techStackButtonIcon4,
            @RequestParam("techStackButtonIcon5") String techStackButtonIcon5,
            @RequestParam("techStackButtonIcon6") String techStackButtonIcon6,
            HttpSession session) {

        // 세션에서 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        System.out.println("Current user: " + currentUser);

        if (currentUser == null) {
            return "redirect:/portfolioForm";  // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 포트폴리오 엔티티 생성 및 데이터 저장
        Portfolio portfolio = new Portfolio(portfolioImg1, portfolioImg2, portfolioImg3, portfolioImg4, portfolioImg5, portfolioImg6);
        Certificate certificate = new Certificate(firstCertificateTitle, firstCertificateButtonIcon,
                secondCertificateTitle, secondCertificateButtonIcon,
                thirdCertificateTitle, thirdCertificateButtonIcon,
                fourthCertificateTitle, fourthCertificateButtonIcon);
        Project project = new Project(projectImg1, projectDesc1, projectImg2, projectDesc2, projectImg3, projectDesc3, projectImg4, projectDesc4, projectImg5, projectDesc5, projectImg6, projectDesc6);
        SocialButtonIcon socialButtonIcon = new SocialButtonIcon(socialButtonIcon1, socialButtonIcon2, socialButtonIcon3, socialButtonIcon4);
        TechStackIcon techStackIcon = new TechStackIcon(techStackButtonIcon1, techStackButtonIcon2, techStackButtonIcon3, techStackButtonIcon4, techStackButtonIcon5, techStackButtonIcon6);

        // 연관된 객체를 유저와 연결
        portfolio.setUser(currentUser);
        certificate.setUser(currentUser);
        project.setUser(currentUser);
        socialButtonIcon.setUser(currentUser);
        techStackIcon.setUser(currentUser);

        // 데이터 저장
        portfolioRepository.save(portfolio);
        certificateRepository.save(certificate);
        projectRepository.save(project);
        socialButtonIconRepository.save(socialButtonIcon);
        techStackIconRepository.save(techStackIcon);

        // 포트폴리오 저장 후 리디렉션
        return "redirect:/portfolio";  // 저장 후 포트폴리오 페이지로 리디렉션
    }

}
