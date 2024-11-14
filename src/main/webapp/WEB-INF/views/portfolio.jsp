<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeCanvas</title>

    <link rel="stylesheet" href="../styles/base.css">
    <link rel="stylesheet" href="../styles/portfolio.css" >

    <audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
    <audio id="click-home-button-sound" src="../audio/click-button-app.mp3"></audio>

    <script src="../scripts/portfolio/show-div.js" defer></script>
    <script src="../scripts/portfolio/play-sound.js" defer></script>
<%--    <script src="../scripts/portfolio/check_login.js" defer></script>--%>
</head>
<body class="background hide">
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
    <div class="first-fade-in-left" id="profile">
        <div id="profile_frame"></div>
        <svg id="profile-title-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
            <path fill-rule="evenodd" d="M1.5 7.125c0-1.036.84-1.875 1.875-1.875h6c1.036 0 1.875.84 1.875 1.875v3.75c0 1.036-.84 1.875-1.875 1.875h-6A1.875 1.875 0 0 1 1.5 10.875v-3.75Zm12 1.5c0-1.036.84-1.875 1.875-1.875h5.25c1.035 0 1.875.84 1.875 1.875v8.25c0 1.035-.84 1.875-1.875 1.875h-5.25a1.875 1.875 0 0 1-1.875-1.875v-8.25ZM3 16.125c0-1.036.84-1.875 1.875-1.875h5.25c1.036 0 1.875.84 1.875 1.875v2.25c0 1.035-.84 1.875-1.875 1.875h-5.25A1.875 1.875 0 0 1 3 18.375v-2.25Z" clip-rule="evenodd" />
        </svg>
        <p id="profile-title">CODE CANVAS</p>
    </div>
    <div class="second-fade-in-left" id="social">
        <div id="first_social_frame"></div>
        <div id="second_social_frame"></div>
        <div id="third_social_frame"></div>
        <div id="fourth_social_frame"></div>
    </div>
    <div class="fade-in-top" id="portfolio">
        <div id="portfolio_title_frame">
            <svg id="portfolio_title_frame_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                <path fill-rule="evenodd" d="M1.5 6a2.25 2.25 0 0 1 2.25-2.25h16.5A2.25 2.25 0 0 1 22.5 6v12a2.25 2.25 0 0 1-2.25 2.25H3.75A2.25 2.25 0 0 1 1.5 18V6ZM3 16.06V18c0 .414.336.75.75.75h16.5A.75.75 0 0 0 21 18v-1.94l-2.69-2.689a1.5 1.5 0 0 0-2.12 0l-.88.879.97.97a.75.75 0 1 1-1.06 1.06l-5.16-5.159a1.5 1.5 0 0 0-2.12 0L3 16.061Zm10.125-7.81a1.125 1.125 0 1 1 2.25 0 1.125 1.125 0 0 1-2.25 0Z" clip-rule="evenodd" />
            </svg>
            <p id="portfolio_title_frame_icon_text">PORTFOLIO</p>
        </div>
        <div id="portfolio_frame"></div>
        <button id="portfolio-angle-right-button" onclick="playSoundButton()">
            <svg id="portfolio-angle-right-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10.25 16.25C10.1493 16.2466 10.0503 16.2227 9.95921 16.1797C9.86807 16.1367 9.78668 16.0756 9.72001 16C9.57956 15.8594 9.50067 15.6688 9.50067 15.47C9.50067 15.2713 9.57956 15.0806 9.72001 14.94L12.72 11.94L9.72001 8.94002C9.66069 8.79601 9.64767 8.63711 9.68277 8.48536C9.71786 8.33361 9.79933 8.19656 9.91586 8.09322C10.0324 7.98988 10.1782 7.92538 10.3331 7.90868C10.4879 7.89198 10.6441 7.92391 10.78 8.00002L14.28 11.5C14.4205 11.6407 14.4994 11.8313 14.4994 12.03C14.4994 12.2288 14.4205 12.4194 14.28 12.56L10.78 16C10.7133 16.0756 10.6319 16.1367 10.5408 16.1797C10.4497 16.2227 10.3507 16.2466 10.25 16.25Z" fill="#2A4AB2FF"/>
            </svg>
        </button>
        <button id="portfolio-angle-left-button" onclick="playSoundButton()">
            <svg id="portfolio-angle-left-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M13.75 16.25C13.6515 16.2505 13.5538 16.2313 13.4628 16.1935C13.3718 16.1557 13.2893 16.1001 13.22 16.03L9.72001 12.53C9.57956 12.3894 9.50067 12.1988 9.50067 12C9.50067 11.8013 9.57956 11.6107 9.72001 11.47L13.22 8.00003C13.361 7.90864 13.5285 7.86722 13.6958 7.88241C13.8631 7.89759 14.0205 7.96851 14.1427 8.08379C14.2649 8.19907 14.3448 8.35203 14.3697 8.51817C14.3946 8.68431 14.363 8.85399 14.28 9.00003L11.28 12L14.28 15C14.4205 15.1407 14.4994 15.3313 14.4994 15.53C14.4994 15.7288 14.4205 15.9194 14.28 16.06C14.1353 16.1907 13.9448 16.259 13.75 16.25Z" fill="#2A4AB2FF"/>
            </svg>
        </button>
    </div>
    <div class="first-fade-in-right" id="tech-stack">
        <div id="tech_stack_frame_1"></div>
        <div id="tech_stack_frame_2"></div>
        <div id="tech_stack_frame_3"></div>
        <div id="tech_stack_frame_4"></div>
        <div id="tech_stack_frame_5"></div>
        <div id="tech_stack_frame_6"></div>
    </div>
    <div class="fade-in-bottom" id="projects">
        <div id="projects_img_frame"></div>
        <div id="projects_explain_frame"></div>
        <div id="projects_title_frame">
            <svg id="projects_title_frame_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                <path d="M5.566 4.657A4.505 4.505 0 0 1 6.75 4.5h10.5c.41 0 .806.055 1.183.157A3 3 0 0 0 15.75 3h-7.5a3 3 0 0 0-2.684 1.657ZM2.25 12a3 3 0 0 1 3-3h13.5a3 3 0 0 1 3 3v6a3 3 0 0 1-3 3H5.25a3 3 0 0 1-3-3v-6ZM5.25 7.5c-.41 0-.806.055-1.184.157A3 3 0 0 1 6.75 6h10.5a3 3 0 0 1 2.683 1.657A4.505 4.505 0 0 0 18.75 7.5H5.25Z" />
            </svg>
            <p id="projects_title_frame_icon_text">PROJECTS</p>
        </div>
        <button id="projects-angle-right-button" onclick="playSoundButton()">
            <svg id="projects-angle-right-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10.25 16.25C10.1493 16.2466 10.0503 16.2227 9.95921 16.1797C9.86807 16.1367 9.78668 16.0756 9.72001 16C9.57956 15.8594 9.50067 15.6688 9.50067 15.47C9.50067 15.2713 9.57956 15.0806 9.72001 14.94L12.72 11.94L9.72001 8.94002C9.66069 8.79601 9.64767 8.63711 9.68277 8.48536C9.71786 8.33361 9.79933 8.19656 9.91586 8.09322C10.0324 7.98988 10.1782 7.92538 10.3331 7.90868C10.4879 7.89198 10.6441 7.92391 10.78 8.00002L14.28 11.5C14.4205 11.6407 14.4994 11.8313 14.4994 12.03C14.4994 12.2288 14.4205 12.4194 14.28 12.56L10.78 16C10.7133 16.0756 10.6319 16.1367 10.5408 16.1797C10.4497 16.2227 10.3507 16.2466 10.25 16.25Z" fill="#2A4AB2FF"/>
            </svg>
        </button>
        <button id="projects-angle-left-button" onclick="playSoundButton()">
            <svg id="projects-angle-left-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M13.75 16.25C13.6515 16.2505 13.5538 16.2313 13.4628 16.1935C13.3718 16.1557 13.2893 16.1001 13.22 16.03L9.72001 12.53C9.57956 12.3894 9.50067 12.1988 9.50067 12C9.50067 11.8013 9.57956 11.6107 9.72001 11.47L13.22 8.00003C13.361 7.90864 13.5285 7.86722 13.6958 7.88241C13.8631 7.89759 14.0205 7.96851 14.1427 8.08379C14.2649 8.19907 14.3448 8.35203 14.3697 8.51817C14.3946 8.68431 14.363 8.85399 14.28 9.00003L11.28 12L14.28 15C14.4205 15.1407 14.4994 15.3313 14.4994 15.53C14.4994 15.7288 14.4205 15.9194 14.28 16.06C14.1353 16.1907 13.9448 16.259 13.75 16.25Z" fill="#2A4AB2FF"/>
            </svg>
        </button>
    </div>
    <div class="second-fade-in-right" id="certificate">
        <div id="certificate_frame_1"></div>
        <div id="certificate_frame_2"></div>
        <div id="certificate_frame_3"></div>
        <div id="certificate_frame_4"></div>
        <div id="rock-certificate"></div>
        <button id="showButton"></button>
    </div>

</section>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
</body>
</html>
