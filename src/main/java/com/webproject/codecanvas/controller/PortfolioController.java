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
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
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
    @GetMapping("/portfolio")
    public String getPortfolioPage(Model model, HttpSession session) {
        // 세션에서 로그인된 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        System.out.println("Portfolio Current user: " + currentUser);

        if (currentUser == null) {
            model.addAttribute("error", "세션이 만료되었습니다. 다시 로그인해주세요.");
            return "redirect:/index";  // 로그인되지 않은 상태라면 로그인 페이지로 리디렉션
        }

        // 연관된 데이터를 모델에 추가
        model.addAttribute("portfolio", currentUser.getPortfolio() != null ? currentUser.getPortfolio() : new Portfolio());
        model.addAttribute("certificate", currentUser.getCertificate() != null ? currentUser.getCertificate() : new Certificate());
        model.addAttribute("project", currentUser.getProject() != null ? currentUser.getProject() : new Project());
        model.addAttribute("socialButtonIcon", currentUser.getSocialButtonIcon() != null ? currentUser.getSocialButtonIcon() : new SocialButtonIcon());
        model.addAttribute("techStackIcon", currentUser.getTechStackIcon() != null ? currentUser.getTechStackIcon() : new TechStackIcon());

        return "portfolio";  // 데이터가 포함된 JSP 페이지
    }


    @Transactional
    @PostMapping("/api/portfolio/save")
    public String saveOrUpdatePortfolio(
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
            @RequestParam("socialButtonIcon1") String firstSocialButtonIcon,
            @RequestParam("socialButtonIcon2") String secondSocialButtonIcon,
            @RequestParam("socialButtonIcon3") String thirdSocialButtonIcon,
            @RequestParam("socialButtonIcon4") String fourthSocialButtonIcon,
            @RequestParam("techStackButtonIcon1") String firstTechStackButtonIcon,
            @RequestParam("techStackButtonIcon2") String secondTechStackButtonIcon,
            @RequestParam("techStackButtonIcon3") String thirdTechStackButtonIcon,
            @RequestParam("techStackButtonIcon4") String fourthTechStackButtonIcon,
            @RequestParam("techStackButtonIcon5") String fifthTechStackButtonIcon,
            @RequestParam("techStackButtonIcon6") String sixthTechStackButtonIcon,
            HttpSession session) {

        // 세션에서 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return "redirect:/index"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 포트폴리오 업데이트 또는 생성
        Portfolio portfolio = portfolioRepository.findByUserId(currentUser.getId())
                .orElse(new Portfolio());
        portfolio.setPortfolioImg1(portfolioImg1);
        portfolio.setPortfolioImg2(portfolioImg2);
        portfolio.setPortfolioImg3(portfolioImg3);
        portfolio.setPortfolioImg4(portfolioImg4);
        portfolio.setPortfolioImg5(portfolioImg5);
        portfolio.setPortfolioImg6(portfolioImg6);
        portfolio.setUser(currentUser);
        portfolioRepository.save(portfolio);

        // 자격증 업데이트 또는 생성
        Certificate certificate = certificateRepository.findByUserId(currentUser.getId())
                .orElse(new Certificate());
        certificate.setFirstCertificateTitle(firstCertificateTitle);
        certificate.setFirstCertificateButtonIcon(firstCertificateButtonIcon);
        certificate.setSecondCertificateTitle(secondCertificateTitle);
        certificate.setSecondCertificateButtonIcon(secondCertificateButtonIcon);
        certificate.setThirdCertificateTitle(thirdCertificateTitle);
        certificate.setThirdCertificateButtonIcon(thirdCertificateButtonIcon);
        certificate.setFourthCertificateTitle(fourthCertificateTitle);
        certificate.setFourthCertificateButtonIcon(fourthCertificateButtonIcon);
        certificate.setUser(currentUser);
        certificateRepository.save(certificate);

        // 프로젝트 업데이트 또는 생성
        Project project = projectRepository.findByUserId(currentUser.getId())
                .orElse(new Project());
        project.setProjectImg1(projectImg1);
        project.setProjectDesc1(projectDesc1);
        project.setProjectImg2(projectImg2);
        project.setProjectDesc2(projectDesc2);
        project.setProjectImg3(projectImg3);
        project.setProjectDesc3(projectDesc3);
        project.setProjectImg4(projectImg4);
        project.setProjectDesc4(projectDesc4);
        project.setProjectImg5(projectImg5);
        project.setProjectDesc5(projectDesc5);
        project.setProjectImg6(projectImg6);
        project.setProjectDesc6(projectDesc6);
        project.setUser(currentUser);
        projectRepository.save(project);

        // 소셜 버튼 업데이트 또는 생성
        SocialButtonIcon socialButtonIcon = socialButtonIconRepository.findByUserId(currentUser.getId())
                .orElse(new SocialButtonIcon());
        socialButtonIcon.setFirstSocialButtonIcon(firstSocialButtonIcon);
        socialButtonIcon.setSecondSocialButtonIcon(secondSocialButtonIcon);
        socialButtonIcon.setThirdSocialButtonIcon(thirdSocialButtonIcon);
        socialButtonIcon.setThirdSocialButtonIcon(fourthSocialButtonIcon);
        socialButtonIcon.setUser(currentUser);
        socialButtonIconRepository.save(socialButtonIcon);

        // 기술 스택 아이콘 업데이트 또는 생성
        TechStackIcon techStackIcon = techStackIconRepository.findByUserId(currentUser.getId())
                .orElse(new TechStackIcon());
        techStackIcon.setFirstTechStackButtonIcon(firstTechStackButtonIcon);
        techStackIcon.setSecondTechStackButtonIcon(secondTechStackButtonIcon);
        techStackIcon.setThirdTechStackButtonIcon(thirdTechStackButtonIcon);
        techStackIcon.setFourthTechStackButtonIcon(fourthTechStackButtonIcon);
        techStackIcon.setFifthTechStackButtonIcon(fifthTechStackButtonIcon);
        techStackIcon.setSixthTechStackButtonIcon(sixthTechStackButtonIcon);
        techStackIcon.setUser(currentUser);
        techStackIconRepository.save(techStackIcon);

        // 저장 후 리디렉션

        // 세션에 갱신된 데이터 저장
        currentUser.setPortfolio(portfolio); // User 객체에 포트폴리오 설정
        currentUser.setCertificate(certificate); // User 객체에 자격증 설정
        currentUser.setProject(project); // User 객체에 프로젝트 설정
        currentUser.setSocialButtonIcon(socialButtonIcon); // User 객체에 소셜 버튼 설정
        currentUser.setTechStackIcon(techStackIcon); // User 객체에 기술 스택 설정

        System.out.println("갱신 된 데이터: " + currentUser);
        session.setAttribute("user", currentUser); // 세션에 갱신된 User 객체 저장

        return "redirect:/portfolio"; // 저장 후 포트폴리오 페이지로 리디렉션
    }

}
