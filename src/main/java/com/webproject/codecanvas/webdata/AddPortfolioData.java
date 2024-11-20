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
            second_social_button_icon,
            third_social_button_icon,
            fourth_social_button_icon;

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
    private String[] portfolio_img;

    // 프로젝트 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    private String[][] project_img_and_desc;

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


        second_social_button_icon = pathList.getPath_defaultSocialButtonIcon();
        third_social_button_icon = pathList.getPath_defaultSocialButtonIcon();
        fourth_social_button_icon = pathList.getPath_defaultSocialButtonIcon();


        first_tech_stack_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        second_tech_stack_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        third_tech_stack_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        fourth_tech_stack_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        fifth_tech_stack_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        sixth_tech_stack_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();


        first_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        second_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        third_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();
        fourth_certificate_button_icon = pathList.getPath_defaultTechStackAndCertificateButtonIcon();

        first_certificate_title = "";
        second_certificate_title = "";
        third_certificate_title = "";
        fourth_certificate_title = "";

        portfolio_img = linkList.getPortfolio_img();
        project_img_and_desc = linkList.getProject_img_and_desc();
    }

}