<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // 중복된 PATH
    String path_AngleRightIcon = "M10.25 16.25C10.1493 16.2466 10.0503 16.2227 9.95921 16.1797C9.86807 16.1367 9.78668 16.0756 9.72001 16C9.57956 15.8594 9.50067 15.6688 9.50067 15.47C9.50067 15.2713 9.57956 15.0806 9.72001 14.94L12.72 11.94L9.72001 8.94002C9.66069 8.79601 9.64767 8.63711 9.68277 8.48536C9.71786 8.33361 9.79933 8.19656 9.91586 8.09322C10.0324 7.98988 10.1782 7.92538 10.3331 7.90868C10.4879 7.89198 10.6441 7.92391 10.78 8.00002L14.28 11.5C14.4205 11.6407 14.4994 11.8313 14.4994 12.03C14.4994 12.2288 14.4205 12.4194 14.28 12.56L10.78 16C10.7133 16.0756 10.6319 16.1367 10.5408 16.1797C10.4497 16.2227 10.3507 16.2466 10.25 16.25Z";
    String path_AngleLeftIcon = "M13.75 16.25C13.6515 16.2505 13.5538 16.2313 13.4628 16.1935C13.3718 16.1557 13.2893 16.1001 13.22 16.03L9.72001 12.53C9.57956 12.3894 9.50067 12.1988 9.50067 12C9.50067 11.8013 9.57956 11.6107 9.72001 11.47L13.22 8.00003C13.361 7.90864 13.5285 7.86722 13.6958 7.88241C13.8631 7.89759 14.0205 7.96851 14.1427 8.08379C14.2649 8.19907 14.3448 8.35203 14.3697 8.51817C14.3946 8.68431 14.363 8.85399 14.28 9.00003L11.28 12L14.28 15C14.4205 15.1407 14.4994 15.3313 14.4994 15.53C14.4994 15.7288 14.4205 15.9194 14.28 16.06C14.1353 16.1907 13.9448 16.259 13.75 16.25Z";

    // 단일 사용 PATH
    String path_ProfileTitleIcon = "M1.5 7.125c0-1.036.84-1.875 1.875-1.875h6c1.036 0 1.875.84 1.875 1.875v3.75c0 1.036-.84 1.875-1.875 1.875h-6A1.875 1.875 0 0 1 1.5 10.875v-3.75Zm12 1.5c0-1.036.84-1.875 1.875-1.875h5.25c1.035 0 1.875.84 1.875 1.875v8.25c0 1.035-.84 1.875-1.875 1.875h-5.25a1.875 1.875 0 0 1-1.875-1.875v-8.25ZM3 16.125c0-1.036.84-1.875 1.875-1.875h5.25c1.036 0 1.875.84 1.875 1.875v2.25c0 1.035-.84 1.875-1.875 1.875h-5.25A1.875 1.875 0 0 1 3 18.375v-2.25Z";
    String path_PortfolioTitleFrameIcon ="M1.5 6a2.25 2.25 0 0 1 2.25-2.25h16.5A2.25 2.25 0 0 1 22.5 6v12a2.25 2.25 0 0 1-2.25 2.25H3.75A2.25 2.25 0 0 1 1.5 18V6ZM3 16.06V18c0 .414.336.75.75.75h16.5A.75.75 0 0 0 21 18v-1.94l-2.69-2.689a1.5 1.5 0 0 0-2.12 0l-.88.879.97.97a.75.75 0 1 1-1.06 1.06l-5.16-5.159a1.5 1.5 0 0 0-2.12 0L3 16.061Zm10.125-7.81a1.125 1.125 0 1 1 2.25 0 1.125 1.125 0 0 1-2.25 0Z";
    String path_ProjectsTitleFrameIcon = "M5.566 4.657A4.505 4.505 0 0 1 6.75 4.5h10.5c.41 0 .806.055 1.183.157A3 3 0 0 0 15.75 3h-7.5a3 3 0 0 0-2.684 1.657ZM2.25 12a3 3 0 0 1 3-3h13.5a3 3 0 0 1 3 3v6a3 3 0 0 1-3 3H5.25a3 3 0 0 1-3-3v-6ZM5.25 7.5c-.41 0-.806.055-1.184.157A3 3 0 0 1 6.75 6h10.5a3 3 0 0 1 2.683 1.657A4.505 4.505 0 0 0 18.75 7.5H5.25Z";

    // 아래 부분은 동적을 변화 될 부분에 대한 PATH 기본값에 대한 변수 설정
    // social-button-icon 에 대한 기본 값 설정 (SVG: 메시지 모양의 아이콘)
    String path_defaultSocialButtonIcon = "M64 0C28.7 0 0 28.7 0 64L0 352c0 35.3 28.7 64 64 64l96 0 0 80c0 6.1 3.4 11.6 8.8 14.3s11.9 2.1 16.8-1.5L309.3 416 448 416c35.3 0 64-28.7 64-64l0-288c0-35.3-28.7-64-64-64L64 0z";

    // tech-stack-button-icon 과 Certificate 에 대한 기본 값에 대한 변수 설정 (SVG: 코드 모양의 아이콘)
    String path_defaultTechStackAndCertificateButtonIcon ="M392.8 1.2c-17-4.9-34.7 5-39.6 22l-128 448c-4.9 17 5 34.7 22 39.6s34.7-5 39.6-22l128-448c4.9-17-5-34.7-22-39.6zm80.6 120.1c-12.5 12.5-12.5 32.8 0 45.3L562.7 256l-89.4 89.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l112-112c12.5-12.5 12.5-32.8 0-45.3l-112-112c-12.5-12.5-32.8-12.5-45.3 0zm-306.7 0c-12.5-12.5-32.8-12.5-45.3 0l-112 112c-12.5 12.5-12.5 32.8 0 45.3l112 112c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256l89.4-89.4c12.5-12.5 12.5-32.8 0-45.3z";

    // 소셜 네트워크 영역에 대한 변수 선언 및 초기화
    String first_social_button_icon = path_defaultSocialButtonIcon,     // 기본 PATH 로 초기화
            second_social_button_icon = path_defaultSocialButtonIcon,   // 기본 PATH 로 초기화
            third_social_button_icon = path_defaultSocialButtonIcon,    // 기본 PATH 로 초기화
            fourth_social_button_icon = path_defaultSocialButtonIcon;   // 기본 PATH 로 초기화

    // 기술 스택 영역에 대한 변수 선언 및 초기화
    String first_tech_stack_button_icon = path_defaultTechStackAndCertificateButtonIcon,     // 기본 PATH 로 초기화
            second_tech_stack_button_icon = path_defaultTechStackAndCertificateButtonIcon,   // 기본 PATH 로 초기화
            third_tech_stack_button_icon = path_defaultTechStackAndCertificateButtonIcon,    // 기본 PATH 로 초기화
            fourth_tech_stack_button_icon = path_defaultTechStackAndCertificateButtonIcon,   // 기본 PATH 로 초기화
            fifth_tech_stack_button_icon = path_defaultTechStackAndCertificateButtonIcon,    // 기본 PATH 로 초기화
            sixth_tech_stack_button_icon = path_defaultTechStackAndCertificateButtonIcon;    // 기본 PATH 로 초기화

    // 자격증 영역에 대한 변수 선언 및 초기화
    String first_certificate_button_icon = path_defaultTechStackAndCertificateButtonIcon,     // 기본 PATH 로 초기화
            second_certificate_button_icon = path_defaultTechStackAndCertificateButtonIcon,   // 기본 PATH 로 초기화
            third_certificate_button_icon = path_defaultTechStackAndCertificateButtonIcon,    // 기본 PATH 로 초기화
            fourth_certificate_button_icon = path_defaultTechStackAndCertificateButtonIcon;   // 기본 PATH 로 초기화

    String first_certificate_title = "",    // 공백 으로 초기화
            second_certificate_title = "",  // 공백 으로 초기화
            third_certificate_title = "",   // 공백 으로 초기화
            fourth_certificate_title = "";  // 공백 으로 초기화

    // 포트폴리오 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    String[] portfolio_img = {
            "../images/examples/portfolio0.gif",  // 기본 이미지 설정
            "../images/examples/portfolio1.gif",  // 기본 이미지 설정
            "../images/examples/portfolio2.gif",  // 기본 이미지 설정
            "../images/examples/portfolio3.gif",  // 기본 이미지 설정
            "../images/examples/portfolio4.gif",  // 기본 이미지 설정
            "../images/examples/portfolio5.gif"   // 기본 이미지 설정
    };

    // 프로젝트 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    String[][] project_img_and_desc = {
            {"../images/examples/project0.gif", "Project 0 description here"},
            {"../images/examples/project1.gif", "Project 1 description here"},
            {"../images/examples/project2.gif", "Project 2 description here"},
            {"../images/examples/project3.gif", "Project 3 description here"},
            {"../images/examples/project4.gif", "Project 4 description here"},
            {"../images/examples/project5.gif", "Project 5 description here"}
    };
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeCanvas</title>

    <link rel="stylesheet" href="../styles/base.css">
    <link rel="stylesheet" href="../styles/portfolio.css" >

    <script src="../scripts/portfolio/play-sound.js" defer></script>
    <script src="../scripts/portfolio/check_login.js" defer></script>
</head>
<body class="background hide">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<audio id="click-home-button-sound" src="../audio/click-button-app.mp3"></audio>
<nav>
    <div class="fade-in-bottom tab-container">
        <input type="radio" name="tab" id="tab1" class="tab tab--1" />
        <label class="tab_label" for="tab1">홈</label>

        <input type="radio" name="tab" id="tab2" class="tab tab--2" checked />
        <label class="tab_label" for="tab2">포트폴리오</label>

        <input type="radio" name="tab" id="tab3" class="tab tab--3" />
        <label class="tab_label" for="tab3">커뮤니티</label>

        <input type="radio" name="tab" id="tab4" class="tab tab--4" />
        <label class="tab_label" for="tab4">정보</label>

        <input type="radio" name="tab" id="tab5" class="tab tab--5" />
        <label class="tab_label" for="tab5">설정</label>

        <div class="indicator"></div>
    </div>
</nav>
<section>
    <%--프로필 영역 ================================================================================================== --%>
    <div class="first-fade-in-left" id="profile">
        <div id="profile_frame">
            <%--프로필 이미지 추가해야됨--%>
            <div id="profile_image_frame"><%--해당 부분에 이미지 추가--%></div>
        </div>
        <svg id="profile-title-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
            <path fill-rule="evenodd" clip-rule="evenodd" d="<%= path_ProfileTitleIcon %>"></path>
        </svg>
        <p id="profile-title">CODE CANVAS</p>
    </div>
        <%--소셜 네트워크 영역 ================================================================================================== --%>
    <div class="second-fade-in-left" id="social">
        <div id="first_social_frame">
            <%--TODO 조건문에 따른 SVG 이미지 변경 아래 전부 적용--%>
            <button class="social-button" onclick="playSoundButton()" id="first_social_button">
                <svg class="social-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= first_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="second_social_frame">
            <button class="social-button" onclick="playSoundButton()" id="second_social_button">
                <svg class="social-button-icon"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= second_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="third_social_frame">
            <button class="social-button" onclick="playSoundButton()" id="third_social_button">
                <svg class="social-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= third_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="fourth_social_frame">
            <button class="social-button" onclick="playSoundButton()" id="fourth_social_button">
                <svg class="social-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= fourth_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
    </div>
        <%--포트폴리오 영역 ================================================================================================== --%>
    <div class="fade-in-top" id="portfolio">
        <div id="portfolio_title_frame">
            <svg id="portfolio_title_frame_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                <path fill-rule="evenodd" d="<%= path_PortfolioTitleFrameIcon %>" clip-rule="evenodd"></path>
            </svg>
            <p id="portfolio_title_frame_icon_text">PORTFOLIO</p>
        </div>
        <div id="portfolio_frame">
            <img id="portfolio_img" src="<%= portfolio_img[0] %>" oncontextmenu="return false;">
        </div>
        <script>
            // JSP 내 에서 가져온 portfolio_img 배열
            const portfolioImages = [
                "<%= portfolio_img[0] %>",
                "<%= portfolio_img[1] %>",
                "<%= portfolio_img[2] %>",
                "<%= portfolio_img[3] %>",
                "<%= portfolio_img[4] %>",
                "<%= portfolio_img[5] %>"
            ];

            // "examples"를 포함하지 않는 이미지만 필터링하여 저장
            const filteredPortfolioImages = portfolioImages.filter(image => !image.includes("examples"));

            // 사용할 배열 결정
            // 이 코드는 "examples"가 포함된 이미지를 제외한 이미지가 있으면 그것을 사용하고, 없으면 원본 배열을 사용합니다.
            const imagesToUse = filteredPortfolioImages.length > 0 ? filteredPortfolioImages : portfolioImages;

            // 초기 이미지 인덱스 설정
            let currentIndex = 0;

            // 이미지를 변경하는 함수 (순방향)
            function portfolioChangeImage() {
                currentIndex = (currentIndex + 1) % imagesToUse.length; // 인덱스를 순환
                document.getElementById("portfolio_img").src = imagesToUse[currentIndex];
            }

            // 이미지를 변경하는 함수 (역방향)
            function reversePortfolioChangeImage() {
                currentIndex = (currentIndex - 1 + imagesToUse.length) % imagesToUse.length; // 인덱스를 역순으로 순환
                document.getElementById("portfolio_img").src = imagesToUse[currentIndex];
            }
        </script>
        <button id="portfolio-angle-right-button" onclick="playSoundButton(); portfolioChangeImage()">
            <svg id="portfolio-angle-right-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleRightIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
        <button id="portfolio-angle-left-button" onclick="playSoundButton(); reversePortfolioChangeImage()">
            <svg id="portfolio-angle-left-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleLeftIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
    </div>
        <%--기술 스텍 영역 ================================================================================================== --%>
    <div class="first-fade-in-right" id="tech-stack">
        <%--TODO Social 과 동일하게 조건문에 따른 SVG 파일 변경 기술 스택 부분--%>
        <div id="tech_stack_frame_1">
            <button class="tech-stack-button" onclick="playSoundButton()" id="first_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= first_tech_stack_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_2">
            <button class="tech-stack-button" onclick="playSoundButton()" id="second_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= second_tech_stack_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_3">
            <button class="tech-stack-button" onclick="playSoundButton()" id="third_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= third_tech_stack_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_4">
            <button class="tech-stack-button" onclick="playSoundButton()" id="fourth_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= fourth_tech_stack_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_5">
            <button class="tech-stack-button" onclick="playSoundButton()" id="fifth_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= fifth_tech_stack_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_6">
            <button class="tech-stack-button" onclick="playSoundButton()" id="sixth_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= sixth_tech_stack_button_icon %>"></path>
                </svg>
            </button>
        </div>
    </div>
        <%--진행중인 프로젝트 영역 ================================================================================================== --%>
    <div class="fade-in-bottom" id="projects">
        <div id="projects_img_frame">
            <img id="projects_img" src="<%= project_img_and_desc[0][0] %>" oncontextmenu="return false;">
        </div>
        <div id="projects_explain_frame">
            <p class="jua-regular" id="projects_explain"><%= project_img_and_desc[0][1] %></p>
        </div>
        <script>
            // JSP에서 가져온 project_img_and_desc 배열을 JavaScript로 전달
            const projectImages = [
                <% for (int i = 0; i < project_img_and_desc.length; i++) { %>
                {
                    src: "<%= project_img_and_desc[i][0] %>",
                    desc: "<%= project_img_and_desc[i][1] %>"
                }<%= (i < project_img_and_desc.length - 1) ? "," : "" %>
                <% } %>
            ];

            // "examples"를 포함하지 않는 이미지만 필터링하여 저장
            const filteredProjectImages = projectImages.filter(image => !image.src.includes("examples"));

            // 사용할 배열 결정
            const ProjectImagesToUse = filteredProjectImages.length > 0 ? filteredProjectImages : projectImages;

            // 초기 이미지 인덱스 설정
            let projectCurrentIndex = 0;

            // 이미지를 변경하고 설명도 업데이트하는 함수 (순방향)
            function projectAndDescriptionChange() {
                if (ProjectImagesToUse.length > 0) {
                    projectCurrentIndex = (projectCurrentIndex + 1) % ProjectImagesToUse.length; // 인덱스를 순환
                    document.getElementById("projects_img").src = ProjectImagesToUse[projectCurrentIndex].src;
                    document.getElementById("projects_explain").innerText = ProjectImagesToUse[projectCurrentIndex].desc;
                }
            }

            // 이미지를 변경하고 설명도 업데이트하는 함수 (역방향)
            function reverseProjectAndDescriptionChange() {
                if (ProjectImagesToUse.length > 0) {
                    projectCurrentIndex = (projectCurrentIndex - 1 + ProjectImagesToUse.length) % ProjectImagesToUse.length; // 인덱스를 역순으로 순환
                    document.getElementById("projects_img").src = ProjectImagesToUse[projectCurrentIndex].src;
                    document.getElementById("projects_explain").innerText = ProjectImagesToUse[projectCurrentIndex].desc;
                }
            }
        </script>
        <div id="projects_title_frame">
            <svg id="projects_title_frame_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                <path d="<%= path_ProjectsTitleFrameIcon %>"></path>
            </svg>
            <p id="projects_title_frame_icon_text">PROJECTS</p>
        </div>
        <button id="projects-angle-right-button" onclick="playSoundButton(); projectAndDescriptionChange()">
            <svg id="projects-angle-right-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleRightIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
        <button id="projects-angle-left-button" onclick="playSoundButton(); reverseProjectAndDescriptionChange()">
            <svg id="projects-angle-left-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleLeftIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
    </div>
        <%--자격증 부분 ================================================================================================== --%>
    <div class="second-fade-in-right" id="certificate">
        <div id="certificate_frame_1">
            <button onclick="playSoundButton()" class="certificate-button">
                <span class="certificate-icon-frame">
                    <svg class="certificate-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                        <path d="<%= first_certificate_button_icon %>"></path>
                    </svg>
                </span>
                <span class="jua-regular certificate-title"><%= first_certificate_title%></span>
            </button>
        </div>
        <div id="certificate_frame_2">
            <button onclick="playSoundButton()" class="certificate-button">
                <span class="certificate-icon-frame">
                    <svg class="certificate-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                        <path d="<%= second_certificate_button_icon %>"></path>
                    </svg>
                </span>
                <span class="jua-regular certificate-title"><%= second_certificate_title%></span>
            </button>
        </div>
        <div id="certificate_frame_3">
            <button onclick="playSoundButton()" class="certificate-button">
                <span class="certificate-icon-frame">
                    <svg class="certificate-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                        <path d="<%= third_certificate_button_icon %>"></path>
                    </svg>
                </span>
                <span class="jua-regular certificate-title"><%= third_certificate_title%></span>
            </button>
        </div>
        <div id="certificate_frame_4">
            <button onclick="playSoundButton()" class="certificate-button">
                <span class="certificate-icon-frame">
                    <svg class="certificate-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                        <path d="<%= fourth_certificate_button_icon %>"></path>
                    </svg>
                </span>
                <span class="jua-regular certificate-title"><%= fourth_certificate_title %></span>
            </button>
        </div>
    </div>

</section>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
</body>
</html>
