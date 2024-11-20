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
import com.webproject.codecanvas.webdata.AddPortfolioData;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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


        if (currentUser == null) {
            model.addAttribute("error", "세션이 만료되었습니다. 다시 로그인해주세요.");

            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/portfolio] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다.\n"); // 디버깅을 위한 출력
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/";  // 로그인되지 않은 상태라면 로그인 페이지로 리디렉션
        }
        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("포트폴리오 페이지에 접속된 유저 \n" + currentUser + "\n");
        System.out.println("------------------------------------------------------------------------\n");


//        연관된 데이터를 모델에 추가
//        model.addAttribute("portfolio", currentUser.getPortfolio() != null ? currentUser.getPortfolio() : new Portfolio());
//        model.addAttribute("certificate", currentUser.getCertificate() != null ? currentUser.getCertificate() : new Certificate());
//        model.addAttribute("project", currentUser.getProject() != null ? currentUser.getProject() : new Project());
//        model.addAttribute("socialButtonIcon", currentUser.getSocialButtonIcon() != null ? currentUser.getSocialButtonIcon() : new SocialButtonIcon());
//        model.addAttribute("techStackIcon", currentUser.getTechStackIcon() != null ? currentUser.getTechStackIcon() : new TechStackIcon());

        // 정보를 보내기 위한 객체 생성
        AddPortfolioData addPortfolioData = new AddPortfolioData(
                currentUser.getPortfolio() != null ? currentUser.getPortfolio() : new Portfolio(),
                currentUser.getCertificate() != null ? currentUser.getCertificate() : new Certificate(),
                currentUser.getProject() != null ? currentUser.getProject() : new Project(),
                currentUser.getSocialButtonIcon() != null ? currentUser.getSocialButtonIcon() : new SocialButtonIcon(),
                currentUser.getTechStackIcon() != null ? currentUser.getTechStackIcon() : new TechStackIcon()
        );
        model.addAttribute("addPortfolioData", addPortfolioData);

        return "portfolio";  // 데이터가 포함된 JSP 페이지
    }

    // 포트폴리오 작성 페이지 가져오기 (GET)
    @GetMapping("/editportfolio")
    public String EditPortfolio (Model model, HttpSession session){

        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/portfolio/save] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 정보를 보내기 위한 객체 생성
        AddPortfolioData addPortfolioData = new AddPortfolioData(
                currentUser.getPortfolio() != null ? currentUser.getPortfolio() : new Portfolio(),
                currentUser.getCertificate() != null ? currentUser.getCertificate() : new Certificate(),
                currentUser.getProject() != null ? currentUser.getProject() : new Project(),
                currentUser.getSocialButtonIcon() != null ? currentUser.getSocialButtonIcon() : new SocialButtonIcon(),
                currentUser.getTechStackIcon() != null ? currentUser.getTechStackIcon() : new TechStackIcon()
        );

        model.addAttribute("addPortfolioData", addPortfolioData);

        return "editportfolio";
    }

    // 포트폴리오 작성내용을 DB로 저장하는 API
    @Transactional
    @PostMapping("/api/portfolio/save")
    public String saveOrUpdatePortfolio(
            @RequestParam(value = "portfolioImg1",defaultValue = "") String portfolioImg1,
            @RequestParam(value = "portfolioImg2",defaultValue = "") String portfolioImg2,
            @RequestParam(value = "portfolioImg3",defaultValue = "") String portfolioImg3,
            @RequestParam(value = "portfolioImg4",defaultValue = "") String portfolioImg4,
            @RequestParam(value = "portfolioImg5",defaultValue = "") String portfolioImg5,
            @RequestParam(value = "portfolioImg6",defaultValue = "") String portfolioImg6,
            @RequestParam(value = "firstCertificateTitle",defaultValue = "") String firstCertificateTitle,
            @RequestParam(value = "firstCertificateButtonIcon",defaultValue = "") String firstCertificateButtonIcon,
            @RequestParam(value = "secondCertificateTitle",defaultValue = "") String secondCertificateTitle,
            @RequestParam(value = "secondCertificateButtonIcon",defaultValue = "") String secondCertificateButtonIcon,
            @RequestParam(value = "thirdCertificateTitle",defaultValue = "") String thirdCertificateTitle,
            @RequestParam(value = "thirdCertificateButtonIcon",defaultValue = "") String thirdCertificateButtonIcon,
            @RequestParam(value = "fourthCertificateTitle",defaultValue = "") String fourthCertificateTitle,
            @RequestParam(value = "fourthCertificateButtonIcon",defaultValue = "") String fourthCertificateButtonIcon,
            @RequestParam(value = "projectImg1",defaultValue = "") String projectImg1,
            @RequestParam(value = "projectDesc1",defaultValue = "") String projectDesc1,
            @RequestParam(value = "projectImg2",defaultValue = "") String projectImg2,
            @RequestParam(value = "projectDesc2",defaultValue = "") String projectDesc2,
            @RequestParam(value = "projectImg3",defaultValue = "") String projectImg3,
            @RequestParam(value = "projectDesc3",defaultValue = "") String projectDesc3,
            @RequestParam(value = "projectImg4",defaultValue = "") String projectImg4,
            @RequestParam(value = "projectDesc4",defaultValue = "") String projectDesc4,
            @RequestParam(value = "projectImg5",defaultValue = "") String projectImg5,
            @RequestParam(value = "projectDesc5",defaultValue = "") String projectDesc5,
            @RequestParam(value = "projectImg6",defaultValue = "") String projectImg6,
            @RequestParam(value = "projectDesc6",defaultValue = "") String projectDesc6,
            @RequestParam(value = "firstSocialButtonIcon",defaultValue = "") String firstSocialButtonIcon,
            @RequestParam(value = "secondSocialButtonIcon",defaultValue = "") String secondSocialButtonIcon,
            @RequestParam(value = "thirdSocialButtonIcon",defaultValue = "") String thirdSocialButtonIcon,
            @RequestParam(value = "fourthSocialButtonIcon",defaultValue = "") String fourthSocialButtonIcon,
            @RequestParam(value = "firstSocialButtonLink",defaultValue = "") String firstSocialButtonLink,
            @RequestParam(value = "secondSocialButtonLink",defaultValue = "") String secondSocialButtonLink,
            @RequestParam(value = "thirdSocialButtonLink",defaultValue = "") String thirdSocialButtonLink,
            @RequestParam(value = "fourthSocialButtonLink",defaultValue = "") String fourthSocialButtonLink,
            @RequestParam(value = "firstTechStackButtonIcon",defaultValue = "") String firstTechStackButtonIcon,
            @RequestParam(value = "secondTechStackButtonIcon",defaultValue = "") String secondTechStackButtonIcon,
            @RequestParam(value = "thirdTechStackButtonIcon",defaultValue = "") String thirdTechStackButtonIcon,
            @RequestParam(value = "fourthTechStackButtonIcon",defaultValue = "") String fourthTechStackButtonIcon,
            @RequestParam(value = "fifthTechStackButtonIcon",defaultValue = "") String fifthTechStackButtonIcon,
            @RequestParam(value = "sixthTechStackButtonIcon",defaultValue = "") String sixthTechStackButtonIcon,
            HttpSession session) {

        // 세션에서 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/portfolio/save] : 세선에 저장된  정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("[/api/portfolio/save] 기존의 데이터\n" + currentUser +"\n");
        System.out.println("------------------------------------------------------------------------\n");

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
        socialButtonIcon.setFourthSocialButtonIcon(fourthSocialButtonIcon);
        socialButtonIcon.setFirstSocialButtonLink(firstSocialButtonLink);
        socialButtonIcon.setSecondSocialButtonLink(secondSocialButtonLink);
        socialButtonIcon.setThirdSocialButtonLink(thirdSocialButtonLink);
        socialButtonIcon.setThirdSocialButtonLink(fourthSocialButtonLink);
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

        // 세션에 갱신된 데이터 저장
        currentUser.setPortfolio(portfolio); // User 객체에 포트폴리오 설정
        currentUser.setCertificate(certificate); // User 객체에 자격증 설정
        currentUser.setProject(project); // User 객체에 프로젝트 설정
        currentUser.setSocialButtonIcon(socialButtonIcon); // User 객체에 소셜 버튼 설정
        currentUser.setTechStackIcon(techStackIcon); // User 객체에 기술 스택 설정

        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("[/api/portfolio/save] 갱신 된 데이터\n" + currentUser +"\n");
        System.out.println("------------------------------------------------------------------------\n");

        session.setAttribute("user", currentUser); // 세션에 갱신된 User 객체 저장

        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("[/api/portfolio/save] 갱신 된 데이터가 성공적으로 저장되었습니다.\n");
        System.out.println("------------------------------------------------------------------------\n");

        return "redirect:/portfolio"; // 저장 후 포트폴리오 페이지로 리디렉션
    }
}
