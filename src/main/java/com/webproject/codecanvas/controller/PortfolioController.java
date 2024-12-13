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

        // 로그인된 유저가 없으면 로그인 페이지로 리디렉션
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

        // 정보를 보내기 위한 객체 생성
        // 포트폴리오, 자격증, 프로젝트, 소셜 버튼 아이콘, 기술 스택 아이콘 정보를 세션에서 가져와서 AddPortfolioData 객체에 담기
        // 각 객체는 해당 데이터가 존재하지 않으면 새로 생성하여 빈 객체로 초기화
        AddPortfolioData addPortfolioData = new AddPortfolioData(
                currentUser.getPortfolio() != null ? currentUser.getPortfolio() : new Portfolio(),  // 포트폴리오가 없으면 빈 포트폴리오 객체 생성
                currentUser.getCertificate() != null ? currentUser.getCertificate() : new Certificate(),  // 자격증이 없으면 빈 자격증 객체 생성
                currentUser.getProject() != null ? currentUser.getProject() : new Project(),  // 프로젝트가 없으면 빈 프로젝트 객체 생성
                currentUser.getSocialButtonIcon() != null ? currentUser.getSocialButtonIcon() : new SocialButtonIcon(),  // 소셜 버튼 아이콘이 없으면 빈 객체 생성
                currentUser.getTechStackIcon() != null ? currentUser.getTechStackIcon() : new TechStackIcon()  // 기술 스택 아이콘이 없으면 빈 객체 생성
        );
        // 생성된 AddPortfolioData 객체를 모델에 추가하여 JSP 페이지에서 사용할 수 있도록 설정
        model.addAttribute("addPortfolioData", addPortfolioData);

        // 포트폴리오 페이지로 이동
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


    /*
       트랜잭션 시작: @Transactional이 붙은 메서드가 실행되면 트랜잭션이 시작됩니다.
       트랜잭션 커밋: 메서드가 정상적으로 끝나면 트랜잭션이 커밋되어, 모든 변경사항이 데이터베이스에 반영됩니다.
       트랜잭션 롤백: 메서드 실행 중 예외가 발생하면 트랜잭션이 롤백되어, 데이터베이스의 상태가 이전 상태로 복원됩니다.
    */
    // 포트폴리오 작성내용을 DB로 저장
    @Transactional
    @PostMapping("/api/portfolio/save")
    public String saveOrUpdatePortfolio(
            @RequestParam(value = "portfolioImg1", defaultValue = "") String portfolioImg1,
            @RequestParam(value = "portfolioImg2", defaultValue = "") String portfolioImg2,
            @RequestParam(value = "portfolioImg3", defaultValue = "") String portfolioImg3,
            @RequestParam(value = "portfolioImg4", defaultValue = "") String portfolioImg4,
            @RequestParam(value = "portfolioImg5", defaultValue = "") String portfolioImg5,
            @RequestParam(value = "portfolioImg6", defaultValue = "") String portfolioImg6,
            @RequestParam(value = "firstCertificateTitle", defaultValue = "") String firstCertificateTitle,
            @RequestParam(value = "firstCertificateButtonIcon", defaultValue = "") String firstCertificateButtonIcon,
            @RequestParam(value = "secondCertificateTitle", defaultValue = "") String secondCertificateTitle,
            @RequestParam(value = "secondCertificateButtonIcon", defaultValue = "") String secondCertificateButtonIcon,
            @RequestParam(value = "thirdCertificateTitle", defaultValue = "") String thirdCertificateTitle,
            @RequestParam(value = "thirdCertificateButtonIcon", defaultValue = "") String thirdCertificateButtonIcon,
            @RequestParam(value = "fourthCertificateTitle", defaultValue = "") String fourthCertificateTitle,
            @RequestParam(value = "fourthCertificateButtonIcon", defaultValue = "") String fourthCertificateButtonIcon,
            @RequestParam(value = "projectImg1", defaultValue = "") String projectImg1,
            @RequestParam(value = "projectDesc1", defaultValue = "") String projectDesc1,
            @RequestParam(value = "projectImg2", defaultValue = "") String projectImg2,
            @RequestParam(value = "projectDesc2", defaultValue = "") String projectDesc2,
            @RequestParam(value = "projectImg3", defaultValue = "") String projectImg3,
            @RequestParam(value = "projectDesc3", defaultValue = "") String projectDesc3,
            @RequestParam(value = "projectImg4", defaultValue = "") String projectImg4,
            @RequestParam(value = "projectDesc4", defaultValue = "") String projectDesc4,
            @RequestParam(value = "projectImg5", defaultValue = "") String projectImg5,
            @RequestParam(value = "projectDesc5", defaultValue = "") String projectDesc5,
            @RequestParam(value = "projectImg6", defaultValue = "") String projectImg6,
            @RequestParam(value = "projectDesc6", defaultValue = "") String projectDesc6,
            @RequestParam(value = "firstSocialButtonIcon", defaultValue = "") String firstSocialButtonIcon,
            @RequestParam(value = "secondSocialButtonIcon", defaultValue = "") String secondSocialButtonIcon,
            @RequestParam(value = "thirdSocialButtonIcon", defaultValue = "") String thirdSocialButtonIcon,
            @RequestParam(value = "fourthSocialButtonIcon", defaultValue = "") String fourthSocialButtonIcon,
            @RequestParam(value = "firstSocialButtonLink", defaultValue = "") String firstSocialButtonLink,
            @RequestParam(value = "secondSocialButtonLink", defaultValue = "") String secondSocialButtonLink,
            @RequestParam(value = "thirdSocialButtonLink", defaultValue = "") String thirdSocialButtonLink,
            @RequestParam(value = "fourthSocialButtonLink", defaultValue = "") String fourthSocialButtonLink,
            @RequestParam(value = "firstTechStackButtonIcon", defaultValue = "") String firstTechStackButtonIcon,
            @RequestParam(value = "secondTechStackButtonIcon", defaultValue = "") String secondTechStackButtonIcon,
            @RequestParam(value = "thirdTechStackButtonIcon", defaultValue = "") String thirdTechStackButtonIcon,
            @RequestParam(value = "fourthTechStackButtonIcon", defaultValue = "") String fourthTechStackButtonIcon,
            @RequestParam(value = "fifthTechStackButtonIcon", defaultValue = "") String fifthTechStackButtonIcon,
            @RequestParam(value = "sixthTechStackButtonIcon", defaultValue = "") String sixthTechStackButtonIcon,
            HttpSession session) {

        // 세션에서 유저 정보 가져오기
        User currentUser = (User) session.getAttribute("user");
        // 세션에 유저 정보가 없으면 로그인 페이지로 리디렉션
        if (currentUser == null) {
            System.out.println("------------------------------------------------------------------------\n");
            System.out.println("[/api/portfolio/save] : 세션에 저장된 정보가 없습니다. 로그인 페이지로 이동합니다. \n");
            System.out.println("------------------------------------------------------------------------\n");
            return "redirect:/"; // 유저가 세션에 없으면 로그인 페이지로 리디렉션
        }

        // 세션에 있는 유저 정보 출력 (디버깅용)
        System.out.println("------------------------------------------------------------------------\n");
        System.out.println("[/api/portfolio/save] 기존의 데이터\n" + currentUser +"\n");
        System.out.println("------------------------------------------------------------------------\n");

        // 포트폴리오 업데이트 또는 생성
        Portfolio portfolio = portfolioRepository.findByUserId(currentUser.getId())
                .orElse(new Portfolio()); // 기존 포트폴리오가 없으면 새 포트폴리오 생성
        portfolio.setPortfolioImg1(portfolioImg1);  // 포트폴리오 이미지 1 설정
        portfolio.setPortfolioImg2(portfolioImg2);  // 포트폴리오 이미지 2 설정
        portfolio.setPortfolioImg3(portfolioImg3);  // 포트폴리오 이미지 3 설정
        portfolio.setPortfolioImg4(portfolioImg4);  // 포트폴리오 이미지 4 설정
        portfolio.setPortfolioImg5(portfolioImg5);  // 포트폴리오 이미지 5 설정
        portfolio.setPortfolioImg6(portfolioImg6);  // 포트폴리오 이미지 6 설정
        portfolio.setUser(currentUser);  // 현재 유저와 포트폴리오 연결
        portfolioRepository.save(portfolio);  // 포트폴리오 데이터 저장

        // 자격증 업데이트 또는 생성
        Certificate certificate = certificateRepository.findByUserId(currentUser.getId())
                .orElse(new Certificate()); // 기존 자격증이 없으면 새 자격증 생성
        certificate.setFirstCertificateTitle(firstCertificateTitle);  // 첫 번째 자격증 제목 설정
        certificate.setFirstCertificateButtonIcon(firstCertificateButtonIcon);  // 첫 번째 자격증 버튼 아이콘 설정
        certificate.setSecondCertificateTitle(secondCertificateTitle);  // 두 번째 자격증 제목 설정
        certificate.setSecondCertificateButtonIcon(secondCertificateButtonIcon);  // 두 번째 자격증 버튼 아이콘 설정
        certificate.setThirdCertificateTitle(thirdCertificateTitle);  // 세 번째 자격증 제목 설정
        certificate.setThirdCertificateButtonIcon(thirdCertificateButtonIcon);  // 세 번째 자격증 버튼 아이콘 설정
        certificate.setFourthCertificateTitle(fourthCertificateTitle);  // 네 번째 자격증 제목 설정
        certificate.setFourthCertificateButtonIcon(fourthCertificateButtonIcon);  // 네 번째 자격증 버튼 아이콘 설정
        certificate.setUser(currentUser);  // 현재 유저와 자격증 연결
        certificateRepository.save(certificate);  // 자격증 데이터 저장

        // 프로젝트 업데이트 또는 생성
        Project project = projectRepository.findByUserId(currentUser.getId())
                .orElse(new Project()); // 기존 프로젝트가 없으면 새 프로젝트 생성
        project.setProjectImg1(projectImg1);  // 첫 번째 프로젝트 이미지 설정
        project.setProjectDesc1(projectDesc1);  // 첫 번째 프로젝트 설명 설정
        project.setProjectImg2(projectImg2);  // 두 번째 프로젝트 이미지 설정
        project.setProjectDesc2(projectDesc2);  // 두 번째 프로젝트 설명 설정
        project.setProjectImg3(projectImg3);  // 세 번째 프로젝트 이미지 설정
        project.setProjectDesc3(projectDesc3);  // 세 번째 프로젝트 설명 설정
        project.setProjectImg4(projectImg4);  // 네 번째 프로젝트 이미지 설정
        project.setProjectDesc4(projectDesc4);  // 네 번째 프로젝트 설명 설정
        project.setProjectImg5(projectImg5);  // 다섯 번째 프로젝트 이미지 설정
        project.setProjectDesc5(projectDesc5);  // 다섯 번째 프로젝트 설명 설정
        project.setProjectImg6(projectImg6);  // 여섯 번째 프로젝트 이미지 설정
        project.setProjectDesc6(projectDesc6);  // 여섯 번째 프로젝트 설명 설정
        project.setUser(currentUser);  // 현재 유저와 프로젝트 연결
        projectRepository.save(project);  // 프로젝트 데이터 저장

        // 소셜 버튼 업데이트 또는 생성
        SocialButtonIcon socialButtonIcon = socialButtonIconRepository.findByUserId(currentUser.getId())
                .orElse(new SocialButtonIcon()); // 기존 소셜 버튼이 없으면 새 소셜 버튼 생성
        socialButtonIcon.setFirstSocialButtonIcon(firstSocialButtonIcon);  // 첫 번째 소셜 버튼 아이콘 설정
        socialButtonIcon.setSecondSocialButtonIcon(secondSocialButtonIcon);  // 두 번째 소셜 버튼 아이콘 설정
        socialButtonIcon.setThirdSocialButtonIcon(thirdSocialButtonIcon);  // 세 번째 소셜 버튼 아이콘 설정
        socialButtonIcon.setFourthSocialButtonIcon(fourthSocialButtonIcon);  // 네 번째 소셜 버튼 아이콘 설정
        socialButtonIcon.setFirstSocialButtonLink(firstSocialButtonLink);  // 첫 번째 소셜 버튼 링크 설정
        socialButtonIcon.setSecondSocialButtonLink(secondSocialButtonLink);  // 두 번째 소셜 버튼 링크 설정
        socialButtonIcon.setThirdSocialButtonLink(thirdSocialButtonLink);  // 세 번째 소셜 버튼 링크 설정
        socialButtonIcon.setFourthSocialButtonLink(fourthSocialButtonLink);  // 네 번째 소셜 버튼 링크 설정
        socialButtonIcon.setUser(currentUser);  // 현재 유저와 소셜 버튼 연결
        socialButtonIconRepository.save(socialButtonIcon);  // 소셜 버튼 데이터 저장

        // 기술 스택 아이콘 업데이트 또는 생성
        TechStackIcon techStackIcon = techStackIconRepository.findByUserId(currentUser.getId())
                .orElse(new TechStackIcon()); // 기존 기술 스택이 없으면 새 기술 스택 생성
        techStackIcon.setFirstTechStackButtonIcon(firstTechStackButtonIcon);  // 첫 번째 기술 스택 아이콘 설정
        techStackIcon.setSecondTechStackButtonIcon(secondTechStackButtonIcon);  // 두 번째 기술 스택 아이콘 설정
        techStackIcon.setThirdTechStackButtonIcon(thirdTechStackButtonIcon);  // 세 번째 기술 스택 아이콘 설정
        techStackIcon.setFourthTechStackButtonIcon(fourthTechStackButtonIcon);  // 네 번째 기술 스택 아이콘 설정
        techStackIcon.setFifthTechStackButtonIcon(fifthTechStackButtonIcon);  // 다섯 번째 기술 스택 아이콘 설정
        techStackIcon.setSixthTechStackButtonIcon(sixthTechStackButtonIcon);  // 여섯 번째 기술 스택 아이콘 설정
        techStackIcon.setUser(currentUser);  // 현재 유저와 기술 스택 연결
        techStackIconRepository.save(techStackIcon);  // 기술 스택 데이터 저장

        // 포트폴리오 페이지로 리디렉션
        return "redirect:/portfolio";

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
}
