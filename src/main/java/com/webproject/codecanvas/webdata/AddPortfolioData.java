package com.webproject.codecanvas.webdata;

import com.webproject.codecanvas.entity.*;
import lombok.*;

@Getter
@Setter
public class AddPortfolioData{
    // 중복된 PATH
    private static final PathList pathList = new PathList();
    private static final LinkList linkList = new LinkList();

    private String path_AngleRightIcon;
    private String path_AngleLeftIcon;

    // 단일 사용 PATH
    private String path_ProfileTitleIcon;
    private String path_PortfolioTitleFrameIcon;
    private String path_ProjectsTitleFrameIcon;

    // 아래 부분은 동적을 변화 될 부분에 대한 PATH 기본값에 대한 변수 설정
    // 소셜 네트워크 영역에 대한 변수 선언 및 초기화
    private String first_social_button_icon,
            first_social_button_Link,
            second_social_button_icon,
            second_social_button_link,
            third_social_button_icon,
            third_social_button_link,
            fourth_social_button_icon,
            fourth_social_button_link;

    // 기술 스택 영역에 대한 변수 선언 및 초기화
    private String first_tech_stack_button_icon,
            second_tech_stack_button_icon,
            third_tech_stack_button_icon,
            fourth_tech_stack_button_icon,
            fifth_tech_stack_button_icon,
            sixth_tech_stack_button_icon;

    // 자격증 영역에 대한 변수 선언 및 초기화
    private String first_certificate_button_icon,
            second_certificate_button_icon,
            third_certificate_button_icon,
            fourth_certificate_button_icon;

    private String first_certificate_title,
            second_certificate_title,
            third_certificate_title,
            fourth_certificate_title;

    // 포트폴리오 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    private String[] portfolio_img = new String[6];

    // 프로젝트 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    private String[][] project_img_and_desc = new String[6][2];

    // 생성자
    public AddPortfolioData(Portfolio portfolio, Certificate certificate, Project project, SocialButtonIcon socialButtonIcon, TechStackIcon techStackIcon){
        // 해당 부분은 수정되지 않습니다.---------------------------------------------------
        path_AngleRightIcon = pathList.getPath_AngleRightIcon();
        path_AngleLeftIcon = pathList.getPath_AngleLeftIcon();

        path_ProfileTitleIcon = pathList.getPath_ProfileTitleIcon();
        path_PortfolioTitleFrameIcon = pathList.getPath_PortfolioTitleFrameIcon();
        path_ProjectsTitleFrameIcon = pathList.getPath_ProjectsTitleFrameIcon();
        //-----------------------------------------------------------------------------

        // 해당 부분 부터 수정됩니다.-------------------------------------------------------
        // SNS 버튼 부분
        switch (socialButtonIcon.getFirstSocialButtonIcon()) {
            case "facebook":
                first_social_button_icon = pathList.getPath_facebookIcon();
                break;
            case "x":
                first_social_button_icon = pathList.getPath_xIcon();
                break;
            case "instagram":
                first_social_button_icon = pathList.getPath_instagramIcon();
                break;
            case "youtube":
                first_social_button_icon = pathList.getPath_youtubeIcon();
                break;
            case "github":
                first_social_button_icon = pathList.getPath_githubIcon();
                break;
            case "gitlab":
                first_social_button_icon = pathList.getPath_gitlabIcon();
                break;
            default:
                first_social_button_icon = pathList.getPath_defaultSocialButtonIcon();
        }
        if (socialButtonIcon.getFirstSocialButtonLink().isEmpty()) {
            first_social_button_Link = linkList.getDefaultSocialLink();
        } else {
            first_social_button_Link = socialButtonIcon.getFirstSocialButtonLink();
        }
        // 소셜 두번째 버튼
        switch (socialButtonIcon.getSecondSocialButtonIcon()) {
            case "facebook":
                second_social_button_icon = pathList.getPath_facebookIcon();
                break;
            case "x":
                second_social_button_icon = pathList.getPath_xIcon();
                break;
            case "instagram":
                second_social_button_icon = pathList.getPath_instagramIcon();
                break;
            case "youtube":
                second_social_button_icon = pathList.getPath_youtubeIcon();
                break;
            case "github":
                second_social_button_icon = pathList.getPath_githubIcon();
                break;
            case "gitlab":
                second_social_button_icon = pathList.getPath_gitlabIcon();
                break;
            default:
                second_social_button_icon = pathList.getPath_defaultSocialButtonIcon();
        }
        if (socialButtonIcon.getFirstSocialButtonLink().isEmpty()) {
            second_social_button_link = linkList.getDefaultSocialLink();
        } else {
            second_social_button_link = socialButtonIcon.getFirstSocialButtonLink();
        }
        // 소셜 세번째 버튼
        switch (socialButtonIcon.getThirdSocialButtonIcon()){
            case "facebook":
                third_social_button_icon = pathList.getPath_facebookIcon(); break;
            case "x":
                third_social_button_icon = pathList.getPath_xIcon(); break;
            case "instagram":
                third_social_button_icon = pathList.getPath_instagramIcon(); break;
            case "youtube":
                third_social_button_icon = pathList.getPath_youtubeIcon(); break;
            case "github":
                third_social_button_icon = pathList.getPath_githubIcon(); break;
            case "gitlab":
                third_social_button_icon = pathList.getPath_gitlabIcon(); break;
            default:
                third_social_button_icon = pathList.getPath_defaultSocialButtonIcon();
        }
        if (socialButtonIcon.getThirdSocialButtonLink().isEmpty()){
            third_social_button_link = linkList.getDefaultSocialLink();
        }else {
            third_social_button_link = socialButtonIcon.getThirdSocialButtonLink();
        }

        // 소셜 네번째 버튼
        switch (socialButtonIcon.getFourthSocialButtonIcon()){
            case "facebook":
                fourth_social_button_icon = pathList.getPath_facebookIcon(); break;
            case "x":
                fourth_social_button_icon = pathList.getPath_xIcon(); break;
            case "instagram":
                fourth_social_button_icon = pathList.getPath_instagramIcon(); break;
            case "youtube":
                fourth_social_button_icon = pathList.getPath_youtubeIcon(); break;
            case "github":
                fourth_social_button_icon = pathList.getPath_githubIcon(); break;
            case "gitlab":
                fourth_social_button_icon = pathList.getPath_gitlabIcon(); break;
            default:
                fourth_social_button_icon = pathList.getPath_defaultSocialButtonIcon();
        }
        if (socialButtonIcon.getFourthSocialButtonLink().isEmpty()){
            fourth_social_button_link = linkList.getDefaultSocialLink();
        }else {
            fourth_social_button_link = socialButtonIcon.getFourthSocialButtonLink();
        }

        //-----------------------------------------------------------------------------
        // 기슬 스택 부분
        switch (techStackIcon.getFirstTechStackButtonIcon()){
            case "java":
                first_tech_stack_button_icon = pathList.getPath_java();
                break;
            case "c":
                first_tech_stack_button_icon = pathList.getPath_c();
                break;
            case "cpp":
                first_tech_stack_button_icon = pathList.getPath_cpp();
                break;
            case "csharp":
                first_tech_stack_button_icon = pathList.getPath_csharp();
                break;
            case "php":
                first_tech_stack_button_icon = pathList.getPath_php();
                break;
            case "python":
                first_tech_stack_button_icon = pathList.getPath_python();
                break;
            case "html":
                first_tech_stack_button_icon = pathList.getPath_html();
                break;
            case "css":
                first_tech_stack_button_icon = pathList.getPath_css();
                break;
            case "javascript":
                first_tech_stack_button_icon = pathList.getPath_javascript();
                break;
            case "kotlin":
                first_tech_stack_button_icon = pathList.getPath_kotlin();
                break;
            case "swift":
                first_tech_stack_button_icon = pathList.getPath_swift();
                break;
            case "ruby":
                first_tech_stack_button_icon = pathList.getPath_ruby();
                break;
            case "r":
                first_tech_stack_button_icon = pathList.getPath_r();
                break;
            case "golang":
                first_tech_stack_button_icon = pathList.getPath_golang();
                break;
            default:
                first_tech_stack_button_icon = pathList.getPath_defaultSocialButtonIcon();
                break;
        }
        switch (techStackIcon.getSecondTechStackButtonIcon()){
            case "java":
                second_tech_stack_button_icon = pathList.getPath_java();
                break;
            case "c":
                second_tech_stack_button_icon = pathList.getPath_c();
                break;
            case "cpp":
                second_tech_stack_button_icon = pathList.getPath_cpp();
                break;
            case "csharp":
                second_tech_stack_button_icon = pathList.getPath_csharp();
                break;
            case "php":
                second_tech_stack_button_icon = pathList.getPath_php();
                break;
            case "python":
                second_tech_stack_button_icon = pathList.getPath_python();
                break;
            case "html":
                second_tech_stack_button_icon = pathList.getPath_html();
                break;
            case "css":
                second_tech_stack_button_icon = pathList.getPath_css();
                break;
            case "javascript":
                second_tech_stack_button_icon = pathList.getPath_javascript();
                break;
            case "kotlin":
                second_tech_stack_button_icon = pathList.getPath_kotlin();
                break;
            case "swift":
                second_tech_stack_button_icon = pathList.getPath_swift();
                break;
            case "ruby":
                second_tech_stack_button_icon = pathList.getPath_ruby();
                break;
            case "r":
                second_tech_stack_button_icon = pathList.getPath_r();
                break;
            case "golang":
                second_tech_stack_button_icon = pathList.getPath_golang();
                break;
            default:
                second_tech_stack_button_icon = pathList.getPath_defaultSocialButtonIcon();
                break;
        }
        switch (techStackIcon.getThirdTechStackButtonIcon()){
            case "java":
                third_tech_stack_button_icon = pathList.getPath_java();
                break;
            case "c":
                third_tech_stack_button_icon = pathList.getPath_c();
                break;
            case "cpp":
                third_tech_stack_button_icon = pathList.getPath_cpp();
                break;
            case "csharp":
                third_tech_stack_button_icon = pathList.getPath_csharp();
                break;
            case "php":
                third_tech_stack_button_icon = pathList.getPath_php();
                break;
            case "python":
                third_tech_stack_button_icon = pathList.getPath_python();
                break;
            case "html":
                third_tech_stack_button_icon = pathList.getPath_html();
                break;
            case "css":
                third_tech_stack_button_icon = pathList.getPath_css();
                break;
            case "javascript":
                third_tech_stack_button_icon = pathList.getPath_javascript();
                break;
            case "kotlin":
                third_tech_stack_button_icon = pathList.getPath_kotlin();
                break;
            case "swift":
                third_tech_stack_button_icon = pathList.getPath_swift();
                break;
            case "ruby":
                third_tech_stack_button_icon = pathList.getPath_ruby();
                break;
            case "r":
                third_tech_stack_button_icon = pathList.getPath_r();
                break;
            case "golang":
                third_tech_stack_button_icon = pathList.getPath_golang();
                break;
            default:
                third_tech_stack_button_icon = pathList.getPath_defaultSocialButtonIcon();
                break;
        }
        switch (techStackIcon.getFourthTechStackButtonIcon()){
            case "java":
                fourth_tech_stack_button_icon = pathList.getPath_java();
                break;
            case "c":
                fourth_tech_stack_button_icon = pathList.getPath_c();
                break;
            case "cpp":
                fourth_tech_stack_button_icon = pathList.getPath_cpp();
                break;
            case "csharp":
                fourth_tech_stack_button_icon = pathList.getPath_csharp();
                break;
            case "php":
                fourth_tech_stack_button_icon = pathList.getPath_php();
                break;
            case "python":
                fourth_tech_stack_button_icon = pathList.getPath_python();
                break;
            case "html":
                fourth_tech_stack_button_icon = pathList.getPath_html();
                break;
            case "css":
                fourth_tech_stack_button_icon = pathList.getPath_css();
                break;
            case "javascript":
                fourth_tech_stack_button_icon = pathList.getPath_javascript();
                break;
            case "kotlin":
                fourth_tech_stack_button_icon = pathList.getPath_kotlin();
                break;
            case "swift":
                fourth_tech_stack_button_icon = pathList.getPath_swift();
                break;
            case "ruby":
                fourth_tech_stack_button_icon = pathList.getPath_ruby();
                break;
            case "r":
                fourth_tech_stack_button_icon = pathList.getPath_r();
                break;
            case "golang":
                fourth_tech_stack_button_icon = pathList.getPath_golang();
                break;
            default:
                fourth_tech_stack_button_icon = pathList.getPath_defaultSocialButtonIcon();
                break;
        }
        switch (techStackIcon.getFifthTechStackButtonIcon()){
            case "java":
                fifth_tech_stack_button_icon = pathList.getPath_java();
                break;
            case "c":
                fifth_tech_stack_button_icon = pathList.getPath_c();
                break;
            case "cpp":
                fifth_tech_stack_button_icon = pathList.getPath_cpp();
                break;
            case "csharp":
                fifth_tech_stack_button_icon = pathList.getPath_csharp();
                break;
            case "php":
                fifth_tech_stack_button_icon = pathList.getPath_php();
                break;
            case "python":
                fifth_tech_stack_button_icon = pathList.getPath_python();
                break;
            case "html":
                fifth_tech_stack_button_icon = pathList.getPath_html();
                break;
            case "css":
                fifth_tech_stack_button_icon = pathList.getPath_css();
                break;
            case "javascript":
                fifth_tech_stack_button_icon = pathList.getPath_javascript();
                break;
            case "kotlin":
                fifth_tech_stack_button_icon = pathList.getPath_kotlin();
                break;
            case "swift":
                fifth_tech_stack_button_icon = pathList.getPath_swift();
                break;
            case "ruby":
                fifth_tech_stack_button_icon = pathList.getPath_ruby();
                break;
            case "r":
                fifth_tech_stack_button_icon = pathList.getPath_r();
                break;
            case "golang":
                fifth_tech_stack_button_icon = pathList.getPath_golang();
                break;
            default:
                fifth_tech_stack_button_icon = pathList.getPath_defaultSocialButtonIcon();
                break;
        }
        switch (techStackIcon.getSixthTechStackButtonIcon()){
            case "java":
                sixth_tech_stack_button_icon = pathList.getPath_java();
                break;
            case "c":
                sixth_tech_stack_button_icon = pathList.getPath_c();
                break;
            case "cpp":
                sixth_tech_stack_button_icon = pathList.getPath_cpp();
                break;
            case "csharp":
                sixth_tech_stack_button_icon = pathList.getPath_csharp();
                break;
            case "php":
                sixth_tech_stack_button_icon = pathList.getPath_php();
                break;
            case "python":
                sixth_tech_stack_button_icon = pathList.getPath_python();
                break;
            case "html":
                sixth_tech_stack_button_icon = pathList.getPath_html();
                break;
            case "css":
                sixth_tech_stack_button_icon = pathList.getPath_css();
                break;
            case "javascript":
                sixth_tech_stack_button_icon = pathList.getPath_javascript();
                break;
            case "kotlin":
                sixth_tech_stack_button_icon = pathList.getPath_kotlin();
                break;
            case "swift":
                sixth_tech_stack_button_icon = pathList.getPath_swift();
                break;
            case "ruby":
                sixth_tech_stack_button_icon = pathList.getPath_ruby();
                break;
            case "r":
                sixth_tech_stack_button_icon = pathList.getPath_r();
                break;
            case "golang":
                sixth_tech_stack_button_icon = pathList.getPath_golang();
                break;
            default:
                sixth_tech_stack_button_icon = pathList.getPath_defaultSocialButtonIcon();
                break;
        }
        //-----------------------------------------------------------------------------
        // 자격증 영역 부분
        switch (certificate.getFirstCertificateButtonIcon()){
            case "server":
                first_certificate_button_icon = pathList.getPath_server();
                break;
            case "database":
                first_certificate_button_icon = pathList.getPath_database();
                break;
            case "cloud":
                first_certificate_button_icon = pathList.getPath_cloud();
                break;
            case "computer":
                first_certificate_button_icon = pathList.getPath_computer();
                break;
            case "security":
                first_certificate_button_icon = pathList.getPath_security();
                break;
            case "design":
                first_certificate_button_icon = pathList.getPath_design();
                break;
            default:
                first_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
                break;
        }
        switch (certificate.getSecondCertificateButtonIcon()){
            case "server":
                second_certificate_button_icon = pathList.getPath_server();
                break;
            case "database":
                second_certificate_button_icon = pathList.getPath_database();
                break;
            case "cloud":
                second_certificate_button_icon = pathList.getPath_cloud();
                break;
            case "computer":
                second_certificate_button_icon = pathList.getPath_computer();
                break;
            case "security":
                second_certificate_button_icon = pathList.getPath_security();
                break;
            case "design":
                second_certificate_button_icon = pathList.getPath_design();
                break;
            default:
                second_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
                break;
        }
        switch (certificate.getThirdCertificateButtonIcon()){
            case "server":
                third_certificate_button_icon = pathList.getPath_server();
                break;
            case "database":
                third_certificate_button_icon = pathList.getPath_database();
                break;
            case "cloud":
                third_certificate_button_icon = pathList.getPath_cloud();
                break;
            case "computer":
                third_certificate_button_icon = pathList.getPath_computer();
                break;
            case "security":
                third_certificate_button_icon = pathList.getPath_security();
                break;
            case "design":
                third_certificate_button_icon = pathList.getPath_design();
                break;
            default:
                third_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
                break;
        }
        switch (certificate.getFourthCertificateButtonIcon()){
            case "server":
                fourth_certificate_button_icon = pathList.getPath_server();
                break;
            case "database":
                fourth_certificate_button_icon = pathList.getPath_database();
                break;
            case "cloud":
                fourth_certificate_button_icon = pathList.getPath_cloud();
                break;
            case "computer":
                fourth_certificate_button_icon = pathList.getPath_computer();
                break;
            case "security":
                fourth_certificate_button_icon = pathList.getPath_security();
                break;
            case "design":
                fourth_certificate_button_icon = pathList.getPath_design();
                break;
            default:
                fourth_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
                break;
        }
        if (certificate.getFirstCertificateTitle().isEmpty()){
            first_certificate_title = "";
        }
        else {
            first_certificate_title = certificate.getFirstCertificateTitle();
        }

        if (certificate.getSecondCertificateTitle().isEmpty()){
            second_certificate_title = "";
        }
        else {
            second_certificate_title = certificate.getSecondCertificateTitle();
        }
        if (certificate.getThirdCertificateTitle().isEmpty()){
            third_certificate_title = "";
        }
        else {
            third_certificate_title = certificate.getThirdCertificateTitle();
        }
        if (certificate.getFourthCertificateTitle().isEmpty()){
            fourth_certificate_title = "";
        }
        else {
            fourth_certificate_title = certificate.getFourthCertificateTitle();
        }
        //-----------------------------------------------------------------------------
        // 포트폴리오 이미지 관련 부분
        // 1번 이미지
        if (portfolio.getPortfolioImg1().isEmpty()){
            portfolio_img[0] = linkList.getPortfolio_img(0);
        }
        else {
            portfolio_img[0] = portfolio.getPortfolioImg1();
        }
        // 2번 이미지
        if (portfolio.getPortfolioImg2().isEmpty()){
            portfolio_img[1] = linkList.getPortfolio_img(1);
        }
        else {
            portfolio_img[1] = portfolio.getPortfolioImg2();
        }
        // 3번 이미지
        if (portfolio.getPortfolioImg3().isEmpty()){
            portfolio_img[2] = linkList.getPortfolio_img(2);
        }
        else {
            portfolio_img[2] = portfolio.getPortfolioImg3();
        }
        // 4번 이미지
        if (portfolio.getPortfolioImg4().isEmpty()){
            portfolio_img[3] = linkList.getPortfolio_img(3);
        }
        else {
            portfolio_img[3] = portfolio.getPortfolioImg4();
        }
        // 5번 이미지
        if (portfolio.getPortfolioImg5().isEmpty()){
            portfolio_img[4] = linkList.getPortfolio_img(4);
        }
        else {
            portfolio_img[4] = portfolio.getPortfolioImg5();
        }
        // 6번 이미지
        if (portfolio.getPortfolioImg6().isEmpty()){
            portfolio_img[5] = linkList.getPortfolio_img(5);
        }
        else {
            portfolio_img[5] = portfolio.getPortfolioImg6();
        }

        //-----------------------------------------------------------------------------
        // 프로젝트 이미지 관련 부분
        // 1번 이미지
        if(project.getProjectImg1().isEmpty()){
            project_img_and_desc[0][0] = linkList.getProject_img_and_desc(0,0);
        }
        else {
            project_img_and_desc[0][0] = project.getProjectImg1();
        }
        // 2번 이미지
        if(project.getProjectImg2().isEmpty()){
            project_img_and_desc[1][0] = linkList.getProject_img_and_desc(1,0);
        }
        else {
            project_img_and_desc[1][0] = project.getProjectImg2();
        }
        // 3번 이미지
        if(project.getProjectImg3().isEmpty()){
            project_img_and_desc[2][0] = linkList.getProject_img_and_desc(2,0);
        }
        else {
            project_img_and_desc[2][0] = project.getProjectImg3();
        }
        // 4번 이미지
        if(project.getProjectImg4().isEmpty()){
            project_img_and_desc[3][0] = linkList.getProject_img_and_desc(3,0);
        }
        else {
            project_img_and_desc[3][0] = project.getProjectImg4();
        }
        // 5번 이미지
        if(project.getProjectImg5().isEmpty()){
            project_img_and_desc[4][0] = linkList.getProject_img_and_desc(4,0);
        }
        else {
            project_img_and_desc[4][0] = project.getProjectImg5();
        }
        // 6번 이미지
        if(project.getProjectImg6().isEmpty()){
            project_img_and_desc[5][0] = linkList.getProject_img_and_desc(5,0);
        }
        else {
            project_img_and_desc[5][0] = project.getProjectImg6();
        }
        // 프로젝트 설명 관련 부분 ---------------------------------------------------------
        // 1번 설명
        if(project.getProjectDesc1().isEmpty()){
            project_img_and_desc[0][1] = linkList.getProject_img_and_desc(0,1);
        }
        else {
            project_img_and_desc[0][1] = project.getProjectDesc1();
        }
        // 2번 이미지
        if(project.getProjectDesc2().isEmpty()){
            project_img_and_desc[1][1] = linkList.getProject_img_and_desc(1,1);
        }
        else {
            project_img_and_desc[1][1] = project.getProjectDesc2();
        }
        // 3번 이미지
        if(project.getProjectDesc3().isEmpty()){
            project_img_and_desc[2][1] = linkList.getProject_img_and_desc(2,1);
        }
        else {
            project_img_and_desc[2][1] = project.getProjectDesc3();
        }
        // 4번 이미지
        if(project.getProjectDesc4().isEmpty()){
            project_img_and_desc[3][1] = linkList.getProject_img_and_desc(3,1);
        }
        else {
            project_img_and_desc[3][1] = project.getProjectDesc4();
        }
        // 5번 이미지
        if(project.getProjectDesc5().isEmpty()){
            project_img_and_desc[4][1] = linkList.getProject_img_and_desc(4,1);
        }
        else {
            project_img_and_desc[4][1] = project.getProjectDesc5();
        }
        // 6번 이미지
        if(project.getProjectDesc6().isEmpty()){
            project_img_and_desc[5][1] = linkList.getProject_img_and_desc(5,1);
        }
        else {
            project_img_and_desc[5][1] = project.getProjectDesc6();
        }
    }

}