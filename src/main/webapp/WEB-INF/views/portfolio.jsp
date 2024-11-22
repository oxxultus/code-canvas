<%@ page import="com.webproject.codecanvas.webdata.AddPortfolioData" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // 데이터 베이스로부터 데이터를 받아와 기본값 등을 설정한다.
    // .js 에서도 사용하기 위해서
    AddPortfolioData addPortfolioData = (AddPortfolioData) request.getAttribute("addPortfolioData");

    // 중복된 PATH
    String path_AngleRightIcon = addPortfolioData.getPath_AngleRightIcon();
    String path_AngleLeftIcon = addPortfolioData.getPath_AngleLeftIcon();

    // 단일 사용 PATH
    String path_ProfileTitleIcon = addPortfolioData.getPath_ProfileTitleIcon();
    String path_PortfolioTitleFrameIcon = addPortfolioData.getPath_PortfolioTitleFrameIcon();
    String path_ProjectsTitleFrameIcon = addPortfolioData.getPath_ProjectsTitleFrameIcon();

    // 아래 부분은 동적을 변화 될 부분에 대한 PATH 기본값에 대한 변수 설정
    // 소셜 네트워크 영역에 대한 변수 선언 및 초기화
    String first_social_button_icon = addPortfolioData.getFirst_social_button_icon(),
            second_social_button_icon = addPortfolioData.getSecond_social_button_icon(),
            third_social_button_icon = addPortfolioData.getThird_social_button_icon(),
            fourth_social_button_icon = addPortfolioData.getFourth_social_button_icon();
    String first_social_button_link = addPortfolioData.getFirst_social_button_Link(),
            second_social_button_link = addPortfolioData.getSecond_social_button_link(),
            third_social_button_link = addPortfolioData.getThird_social_button_link(),
            fourth_social_button_link = addPortfolioData.getFourth_social_button_link();

    // 기술 스택 영역에 대한 변수 선언 및 초기화
    String first_tech_stack_button_icon = addPortfolioData.getFirst_tech_stack_button_icon(),
            second_tech_stack_button_icon = addPortfolioData.getSecond_tech_stack_button_icon(),
            third_tech_stack_button_icon = addPortfolioData.getThird_tech_stack_button_icon(),
            fourth_tech_stack_button_icon = addPortfolioData.getFourth_tech_stack_button_icon(),
            fifth_tech_stack_button_icon = addPortfolioData.getFifth_tech_stack_button_icon(),
            sixth_tech_stack_button_icon = addPortfolioData.getSixth_tech_stack_button_icon();

    // 자격증 영역에 대한 변수 선언 및 초기화
    String first_certificate_button_icon = addPortfolioData.getFirst_certificate_button_icon(),
            second_certificate_button_icon = addPortfolioData.getSecond_certificate_button_icon(),
            third_certificate_button_icon = addPortfolioData.getThird_certificate_button_icon(),
            fourth_certificate_button_icon = addPortfolioData.getFourth_certificate_button_icon();

    String first_certificate_title = addPortfolioData.getFirst_certificate_title(),    // 공백 으로 초기화
            second_certificate_title = addPortfolioData.getSecond_certificate_title(),  // 공백 으로 초기화
            third_certificate_title = addPortfolioData.getThird_certificate_title(),   // 공백 으로 초기화
            fourth_certificate_title = addPortfolioData.getFourth_certificate_title();  // 공백 으로 초기화

    // 포트폴리오 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    String[] portfolio_img = addPortfolioData.getPortfolio_img();

    // 프로젝트 영역에 대한 변수 선언 및 초기화 (최대 6개만 입력 가능)
    String[][] project_img_and_desc = addPortfolioData.getProject_img_and_desc();

%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio</title>

    <link rel="stylesheet" href="../styles/base.css">
    <link rel="stylesheet" href="../styles/portfolio.css">

    <script src="../scripts/portfolio/play-sound.js" defer></script>
</head>
<body class="background hide">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<audio id="click-home-button-sound" src="../audio/click-button-app.mp3"></audio>
<nav>
    <div class="fade-in-bottom tab-container">
        <input type="radio" name="tab" id="tab1" onclick="window.location.href='/home'" class="tab tab--1"/>
        <label class="tab_label" for="tab1">홈</label>

        <input type="radio" name="tab" id="tab2" class="tab tab--2" checked/>
        <label class="tab_label" for="tab2">포트폴리오</label>

        <input type="radio" name="tab" id="tab3" onclick="window.location.href='/community'" class="tab tab--3"/>
        <label class="tab_label" for="tab3">커뮤니티</label>

        <input type="radio" name="tab" id="tab4" onclick="window.location.href='/information'" class="tab tab--4"/>
        <label class="tab_label" for="tab4">정보</label>

        <input type="radio" name="tab" id="tab5" onclick="window.location.href='/setting'" class="tab tab--5"/>
        <label class="tab_label" for="tab5">일정</label>

        <div class="indicator"></div>
    </div>
</nav>
<section>
    <%--프로필 영역 ================================================================================================== --%>
    <div class="first-fade-in-left" id="profile">
        <div id="profile_frame">
            <button id="profile_edit_button" onclick="window.location.href='/editportfolio'">
                <span id="profile_edit_button_text" class="audiowide-regular">EDIT</span>
            </button>
            <div id="profile_image_frame">
                <img id="profile_image" alt="프로밀 이미지" src="../images/examples/profile2.gif" oncontextmenu="return false;">
            </div>
        </div>
        <svg id="profile-title-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
             class="size-6">
            <path fill-rule="evenodd" clip-rule="evenodd" d="<%= path_ProfileTitleIcon %>"></path>
        </svg>
        <p id="profile-title">CODE CANVAS</p>
    </div>
    <%--소셜 네트워크 영역 ================================================================================================== --%>
    <div class="second-fade-in-left" id="social">
        <div id="first_social_frame">
            <%--TODO 조건문에 따른 SVG 이미지 변경 아래 전부 적용--%>
            <button class="social-button"
                    onclick="playSoundButton(); window.open('<%=first_social_button_link%>', '_blank')"
                    id="first_social_button">
                <svg class="social-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= first_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="second_social_frame">
            <button class="social-button"
                    onclick="playSoundButton(); window.open('<%=second_social_button_link%>', '_blank')"
                    id="second_social_button">
                <svg class="social-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= second_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="third_social_frame">
            <button class="social-button"
                    onclick="playSoundButton(); window.open('<%=third_social_button_link%>', '_blank')"
                    id="third_social_button">
                <svg class="social-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= third_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
        <div id="fourth_social_frame">
            <button class="social-button"
                    onclick="playSoundButton(); window.open('<%=fourth_social_button_link%>', '_blank')"
                    id="fourth_social_button">
                <svg class="social-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="<%= fourth_social_button_icon %>"></path>
                </svg>
            </button>
        </div>
    </div>
    <%--기술 스텍 영역 ================================================================================================== --%>
    <div class="first-fade-in-right" id="tech-stack">
        <%--TODO Social 과 동일하게 조건문에 따른 SVG 파일 변경 기술 스택 부분--%>
        <div id="tech_stack_frame_1">
            <button class="tech-stack-button" onclick="playSoundButton()" id="first_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <g transform="translate(50, 50)">
                        <path d="<%= first_tech_stack_button_icon %>"></path>
                    </g>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_2">
            <button class="tech-stack-button" onclick="playSoundButton()" id="second_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <g transform="translate(50, 50)">
                        <path d="<%= second_tech_stack_button_icon %>"></path>
                    </g>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_3">
            <button class="tech-stack-button" onclick="playSoundButton()" id="third_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <g transform="translate(50, 50)">
                        <path d="<%= third_tech_stack_button_icon %>"></path>
                    </g>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_4">
            <button class="tech-stack-button" onclick="playSoundButton()" id="fourth_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <g transform="translate(50, 50)">
                        <path d="<%= fourth_tech_stack_button_icon %>"></path>
                    </g>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_5">
            <button class="tech-stack-button" onclick="playSoundButton()" id="fifth_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <g transform="translate(50, 50)">
                        <path d="<%= fifth_tech_stack_button_icon %>"></path>
                    </g>
                </svg>
            </button>
        </div>
        <div id="tech_stack_frame_6">
            <button class="tech-stack-button" onclick="playSoundButton()" id="sixth_tech_stack_button">
                <svg class="tech-stack-button-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <g transform="translate(50, 50)">
                        <path d="<%= sixth_tech_stack_button_icon %>"></path>
                    </g>
                </svg>
            </button>
        </div>
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
    <%--포트폴리오 영역 ================================================================================================== --%>
    <div class="fade-in-top" id="portfolio">
        <div id="portfolio_title_frame">
            <svg id="portfolio_title_frame_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                 fill="currentColor" class="size-6">
                <path fill-rule="evenodd" d="<%= path_PortfolioTitleFrameIcon %>" clip-rule="evenodd"></path>
            </svg>
            <p id="portfolio_title_frame_icon_text">PORTFOLIO</p>
        </div>
        <div id="portfolio_frame">
            <img id="portfolio_img" alt="포트폴리오 이미지" src="<%= portfolio_img[0] %>" oncontextmenu="return false;">
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
            <svg id="portfolio-angle-right-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleRightIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
        <button id="portfolio-angle-left-button" onclick="playSoundButton(); reversePortfolioChangeImage()">
            <svg id="portfolio-angle-left-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleLeftIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
    </div>
    <%--진행중인 프로젝트 영역 ================================================================================================== --%>
    <div class="fade-in-bottom" id="projects">
        <div id="projects_img_frame">
            <img id="projects_img" alt="프로젝트 이미지" src="<%= project_img_and_desc[0][0] %>" oncontextmenu="return false;">
        </div>
        <div id="projects_explain_frame">
            <p class="jua-regular" id="projects_explain"><%= project_img_and_desc[0][1] %>
            </p>
        </div>
        <script>
            // JSP 에서 가져온 project_img_and_desc 배열을 JavaScript로 전달
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
            <svg id="projects_title_frame_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                 fill="currentColor" class="size-6">
                <path d="<%= path_ProjectsTitleFrameIcon %>"></path>
            </svg>
            <p id="projects_title_frame_icon_text">PROJECTS</p>
        </div>
        <button id="projects-angle-right-button" onclick="playSoundButton(); projectAndDescriptionChange()">
            <svg id="projects-angle-right-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleRightIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
        <button id="projects-angle-left-button" onclick="playSoundButton(); reverseProjectAndDescriptionChange()">
            <svg id="projects-angle-left-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="<%= path_AngleLeftIcon %>" fill="#2A4AB2FF"></path>
            </svg>
        </button>
    </div>
</section>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
</body>
</html>
