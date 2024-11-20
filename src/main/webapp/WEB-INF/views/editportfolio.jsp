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
    <link rel="stylesheet" href="../styles/editportfolio.css">

    <script src="../scripts/portfolio/play-sound.js" defer></script>
</head>
<body class="background hide">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<audio id="click-home-button-sound" src="../audio/click-button-app.mp3"></audio>
<section>
    <form action="api/portfolio/save" method="post">
    <%--프로필 영역 ================================================================================================== --%>
    <div class="first-fade-in-left" id="profile">
        <div id="profile_frame">
            <button id="profile_edit_button" type="submit">
                <span id="profile_edit_button_text" class="audiowide-regular">SAVE</span>
            </button>
            <div id="profile_image_frame">
                <img id="profile_image" alt="프로밀 이미지" src="../images/examples/profile2.gif"
                     oncontextmenu="return false;">
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
            <div class="social-button" onclick="playSoundButton();" id="first_social_button">
                <div class="social_radio_frame">
                    <label class="label">
                        <input value="facebook" name="firstSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Facebook</div>
                    </label>
                    <label class="label">
                        <input value="x" name="firstSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">X</div>
                    </label>
                    <label class="label">
                        <input value="instagram" name="firstSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Instagram</div>
                    </label>
                    <label class="label">
                        <input value="youtube" name="firstSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Youtube</div>
                    </label>
                    <label class="label">
                        <input value="github" name="firstSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Github</div>
                    </label>
                    <label class="label">
                        <input value="gitlab" name="firstSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Gitlab</div>
                    </label>
                    <label class="label">
                        <input value="default" name="firstSocialButtonIcon" class="radio-input" type="radio" checked>
                        <div class="radio-design"></div>
                        <div class="label-text">Default</div>
                    </label>
                </div>
                <label>
                    <input class="social_button_link" type="text" name="firstSocialButtonLink"
                           placeholder="https://github.com/oxxultus">
                </label>
            </div>
        </div>
        <div id="second_social_frame">
            <div class="social-button" onclick="playSoundButton();" id="second_social_button">
                <div class="social_radio_frame">
                    <label class="label">
                        <input value="facebook" name="secondSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Facebook</div>
                    </label>
                    <label class="label">
                        <input value="x" name="secondSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">X</div>
                    </label>
                    <label class="label">
                        <input value="instagram" name="secondSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Instagram</div>
                    </label>
                    <label class="label">
                        <input value="youtube" name="secondSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Youtube</div>
                    </label>
                    <label class="label">
                        <input value="github" name="secondSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Github</div>
                    </label>
                    <label class="label">
                        <input value="gitlab" name="secondSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Gitlab</div>
                    </label>
                    <label class="label">
                        <input value="default" name="secondSocialButtonIcon" class="radio-input" type="radio" checked>
                        <div class="radio-design"></div>
                        <div class="label-text">Default</div>
                    </label>
                </div>
                <label>
                    <input class="social_button_link" type="text" name="secondSocialButtonLink"
                           placeholder="https://github.com/oxxultus">
                </label>
            </div>
        </div>
        <div id="third_social_frame">
            <div class="social-button" onclick="playSoundButton();" id="third_social_button">
                <div class="social_radio_frame">
                    <label class="label">
                        <input value="facebook" name="thirdSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Facebook</div>
                    </label>
                    <label class="label">
                        <input value="x" name="thirdSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">X</div>
                    </label>
                    <label class="label">
                        <input value="instagram" name="thirdSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Instagram</div>
                    </label>
                    <label class="label">
                        <input value="youtube" name="thirdSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Youtube</div>
                    </label>
                    <label class="label">
                        <input value="github" name="thirdSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Github</div>
                    </label>
                    <label class="label">
                        <input value="gitlab" name="thirdSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Gitlab</div>
                    </label>
                    <label class="label">
                        <input value="default" name="thirdSocialButtonIcon" class="radio-input" type="radio" checked>
                        <div class="radio-design"></div>
                        <div class="label-text">Default</div>
                    </label>
                </div>
                <label>
                    <input class="social_button_link" type="text" name="thirdSocialButtonLink"
                           placeholder="https://github.com/oxxultus">
                </label>
            </div>
        </div>
        <div id="fourth_social_frame">
            <div class="social-button" onclick="playSoundButton();" id="fourth_social_button">
                <div class="social_radio_frame">
                    <label class="label">
                        <input value="facebook" name="fourthSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Facebook</div>
                    </label>
                    <label class="label">
                        <input value="x" name="fourthSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">X</div>
                    </label>
                    <label class="label">
                        <input value="instagram" name="fourthSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Instagram</div>
                    </label>
                    <label class="label">
                        <input value="youtube" name="fourthSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Youtube</div>
                    </label>
                    <label class="label">
                        <input value="github" name="fourthSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Github</div>
                    </label>
                    <label class="label">
                        <input value="gitlab" name="fourthSocialButtonIcon" class="radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="label-text">Gitlab</div>
                    </label>
                    <label class="label">
                        <input value="default" name="fourthSocialButtonIcon" class="radio-input" type="radio" checked>
                        <div class="radio-design"></div>
                        <div class="label-text">Default</div>
                    </label>
                </div>
                <label>
                    <input class="social_button_link" type="text" name="fourthSocialButtonLink"
                           placeholder="https://github.com/oxxultus">
                </label>
            </div>
        </div>
    </div>
    <%--자격증 부분 ================================================================================================== --%>
    <div class="second-fade-in-right" id="certificate">
        <div id="certificate_frame_1">
            <div onclick="playSoundButton()" class="certificate-button">
                <div class="certificate-icon-frame">
                    <div class="certificate-radio-frame">
                        <label class="certificate-label">
                            <input value="server" name="firstCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Server</div>
                        </label>
                        <label class="certificate-label">
                            <input value="database" name="firstCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Database</div>
                        </label>
                        <label class="certificate-label">
                            <input value="cloud" name="firstCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Cloud</div>
                        </label>
                        <label class="certificate-label">
                            <input value="computer" name="firstCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Computer</div>
                        </label>
                        <label class="certificate-label">
                            <input value="security" name="firstCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Security</div>
                        </label>
                        <label class="certificate-label">
                            <input value="design" name="firstCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Design</div>
                        </label>
                        <label class="certificate-label">
                            <input value="default" name="firstCertificateButtonIcon" class="certificate-radio-input" type="radio" checked>
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Default</div>
                        </label>
                    </div>
                </div>
                <label>
                    <input type="text" name="firstCertificateTitle" class="jua-regular certificate-title"
                           placeholder="자격증 이름">
                </label>
            </div>
        </div>
        <div id="certificate_frame_2">
            <div onclick="playSoundButton()" class="certificate-button">
                <div class="certificate-icon-frame">
                    <div class="certificate-radio-frame">
                        <label class="certificate-label">
                            <input value="server" name="secondCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Server</div>
                        </label>
                        <label class="certificate-label">
                            <input value="database" name="secondCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Database</div>
                        </label>
                        <label class="certificate-label">
                            <input value="cloud" name="secondCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Cloud</div>
                        </label>
                        <label class="certificate-label">
                            <input value="computer" name="secondCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Computer</div>
                        </label>
                        <label class="certificate-label">
                            <input value="security" name="secondCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Security</div>
                        </label>
                        <label class="certificate-label">
                            <input value="design" name="secondCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Design</div>
                        </label>
                        <label class="certificate-label">
                            <input value="default" name="secondCertificateButtonIcon" class="certificate-radio-input" type="radio" checked>
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Default</div>
                        </label>
                    </div>
                </div>
                <label>
                    <input type="text" name="secondCertificateTitle" class="jua-regular certificate-title"
                           placeholder="자격증 이름">
                </label>
            </div>
        </div>
        <div id="certificate_frame_3">
            <div onclick="playSoundButton()" class="certificate-button">
                <div class="certificate-icon-frame">
                    <div class="certificate-radio-frame">
                        <label class="certificate-label">
                            <input value="server" name="thirdCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Server</div>
                        </label>
                        <label class="certificate-label">
                            <input value="database" name="thirdCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Database</div>
                        </label>
                        <label class="certificate-label">
                            <input value="cloud" name="thirdCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Cloud</div>
                        </label>
                        <label class="certificate-label">
                            <input value="computer" name="thirdCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Computer</div>
                        </label>
                        <label class="certificate-label">
                            <input value="security" name="thirdCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Security</div>
                        </label>
                        <label class="certificate-label">
                            <input value="design" name="thirdCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Design</div>
                        </label>
                        <label class="certificate-label">
                            <input value="default" name="thirdCertificateButtonIcon" class="certificate-radio-input" type="radio" checked>
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Default</div>
                        </label>
                    </div>
                </div>
                <label>
                    <input type="text" name="thirdCertificateTitle" class="jua-regular certificate-title"
                           placeholder="자격증 이름">
                </label>
            </div>
        </div>
        <div id="certificate_frame_4">
            <div onclick="playSoundButton()" class="certificate-button">
                <div class="certificate-icon-frame">
                    <div class="certificate-radio-frame">
                        <label class="certificate-label">
                            <input value="server" name="fourthCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Server</div>
                        </label>
                        <label class="certificate-label">
                            <input value="database" name="fourthCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Database</div>
                        </label>
                        <label class="certificate-label">
                            <input value="cloud" name="fourthCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Cloud</div>
                        </label>
                        <label class="certificate-label">
                            <input value="computer" name="fourthCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Computer</div>
                        </label>
                        <label class="certificate-label">
                            <input value="security" name="fourthCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Security</div>
                        </label>
                        <label class="certificate-label">
                            <input value="design" name="fourthCertificateButtonIcon" class="certificate-radio-input" type="radio">
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Design</div>
                        </label>
                        <label class="certificate-label">
                            <input value="default" name="fourthCertificateButtonIcon" class="certificate-radio-input" type="radio" checked>
                            <div class="certificate-radio-design"></div>
                            <div class="certificate-label-text">Default</div>
                        </label>
                    </div>
                </div>
                <label>
                    <input type="text" name="fourthCertificateTitle" class="jua-regular certificate-title"
                           placeholder="자격증 이름">
                </label>
            </div>
        </div>
    </div>
    <%--기술 스텍 영역 ================================================================================================== --%>
    <div class="first-fade-in-right" id="tech-stack">
        <%--TODO Social 과 동일하게 조건문에 따른 SVG 파일 변경 기술 스택 부분--%>
        <div id="tech_stack_frame_1">
            <div class="tech-stack-button" onclick="playSoundButton()" id="first_tech_stack_button">
                <div class="tech-stack-radio-frame">
                    <label class="tech-label">
                        <input value="java" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Java</div>
                    </label>
                    <label class="tech-label">
                        <input value="c" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C</div>
                    </label>
                    <label class="tech-label">
                        <input value="cpp" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C++</div>
                    </label>
                    <label class="tech-label">
                        <input value="csharp" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C#</div>
                    </label>
                    <label class="tech-label">
                        <input value="php" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Php</div>
                    </label>
                    <label class="tech-label">
                        <input value="python" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Python</div>
                    </label>
                    <label class="tech-label">
                        <input value="html" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Html</div>
                    </label>
                    <label class="tech-label">
                        <input value="css" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Css</div>
                    </label>
                    <label class="tech-label">
                        <input value="javascript" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Javascript</div>
                    </label>
                    <label class="tech-label">
                        <input value="kotlin" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Kotlin</div>
                    </label>
                    <label class="tech-label">
                        <input value="swift" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Swift</div>
                    </label>
                    <label class="tech-label">
                        <input value="ruby" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Ruby</div>
                    </label>
                    <label class="tech-label">
                        <input value="r" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">R</div>
                    </label>
                    <label class="label">
                        <input value="golang" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Golang</div>
                    </label>
                    <label class="tech-label">
                        <input value="default" name="firstTechStackButtonIcon" class="tech-radio-input" type="radio"
                               checked>
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Default</div>
                    </label>
                </div>
            </div>
        </div>
        <div id="tech_stack_frame_2">
            <div class="tech-stack-button" onclick="playSoundButton()" id="second_tech_stack_button">
                <div class="tech-stack-radio-frame">
                    <label class="tech-label">
                        <input value="java" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Java</div>
                    </label>
                    <label class="tech-label">
                        <input value="c" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C</div>
                    </label>
                    <label class="tech-label">
                        <input value="cpp" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C++</div>
                    </label>
                    <label class="tech-label">
                        <input value="csharp" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C#</div>
                    </label>
                    <label class="tech-label">
                        <input value="php" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Php</div>
                    </label>
                    <label class="tech-label">
                        <input value="python" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Python</div>
                    </label>
                    <label class="tech-label">
                        <input value="html" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Html</div>
                    </label>
                    <label class="tech-label">
                        <input value="css" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Css</div>
                    </label>
                    <label class="tech-label">
                        <input value="javascript" name="secondTechStackButtonIcon" class="tech-radio-input"
                               type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Javascript</div>
                    </label>
                    <label class="tech-label">
                        <input value="kotlin" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Kotlin</div>
                    </label>
                    <label class="tech-label">
                        <input value="swift" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Swift</div>
                    </label>
                    <label class="tech-label">
                        <input value="ruby" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Ruby</div>
                    </label>
                    <label class="tech-label">
                        <input value="r" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">R</div>
                    </label>
                    <label class="label">
                        <input value="golang" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Golang</div>
                    </label>
                    <label class="tech-label">
                        <input value="default" name="secondTechStackButtonIcon" class="tech-radio-input" type="radio"
                               checked>
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Default</div>
                    </label>
                </div>
            </div>
        </div>
        <div id="tech_stack_frame_3">
            <div class="tech-stack-button" onclick="playSoundButton()" id="third_tech_stack_button">
                <div class="tech-stack-radio-frame">
                    <label class="tech-label">
                        <input value="java" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Java</div>
                    </label>
                    <label class="tech-label">
                        <input value="c" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C</div>
                    </label>
                    <label class="tech-label">
                        <input value="cpp" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C++</div>
                    </label>
                    <label class="tech-label">
                        <input value="csharp" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C#</div>
                    </label>
                    <label class="tech-label">
                        <input value="php" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Php</div>
                    </label>
                    <label class="tech-label">
                        <input value="python" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Python</div>
                    </label>
                    <label class="tech-label">
                        <input value="html" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Html</div>
                    </label>
                    <label class="tech-label">
                        <input value="css" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Css</div>
                    </label>
                    <label class="tech-label">
                        <input value="javascript" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Javascript</div>
                    </label>
                    <label class="tech-label">
                        <input value="kotlin" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Kotlin</div>
                    </label>
                    <label class="tech-label">
                        <input value="swift" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Swift</div>
                    </label>
                    <label class="tech-label">
                        <input value="ruby" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Ruby</div>
                    </label>
                    <label class="tech-label">
                        <input value="r" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">R</div>
                    </label>
                    <label class="label">
                        <input value="golang" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Golang</div>
                    </label>
                    <label class="tech-label">
                        <input value="default" name="thirdTechStackButtonIcon" class="tech-radio-input" type="radio"
                               checked>
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Default</div>
                    </label>
                </div>
            </div>
        </div>
        <div id="tech_stack_frame_4">
            <div class="tech-stack-button" onclick="playSoundButton()" id="fourth_tech_stack_button">
                <div class="tech-stack-radio-frame">
                    <label class="tech-label">
                        <input value="java" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Java</div>
                    </label>
                    <label class="tech-label">
                        <input value="c" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C</div>
                    </label>
                    <label class="tech-label">
                        <input value="cpp" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C++</div>
                    </label>
                    <label class="tech-label">
                        <input value="csharp" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C#</div>
                    </label>
                    <label class="tech-label">
                        <input value="php" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Php</div>
                    </label>
                    <label class="tech-label">
                        <input value="python" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Python</div>
                    </label>
                    <label class="tech-label">
                        <input value="html" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Html</div>
                    </label>
                    <label class="tech-label">
                        <input value="css" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Css</div>
                    </label>
                    <label class="tech-label">
                        <input value="javascript" name="fourthTechStackButtonIcon" class="tech-radio-input"
                               type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Javascript</div>
                    </label>
                    <label class="tech-label">
                        <input value="kotlin" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Kotlin</div>
                    </label>
                    <label class="tech-label">
                        <input value="swift" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Swift</div>
                    </label>
                    <label class="tech-label">
                        <input value="ruby" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Ruby</div>
                    </label>
                    <label class="tech-label">
                        <input value="r" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">R</div>
                    </label>
                    <label class="label">
                        <input value="golang" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Golang</div>
                    </label>
                    <label class="tech-label">
                        <input value="default" name="fourthTechStackButtonIcon" class="tech-radio-input" type="radio"
                               checked>
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Default</div>
                    </label>
                </div>
            </div>
        </div>
        <div id="tech_stack_frame_5">
            <div class="tech-stack-button" onclick="playSoundButton()" id="fifth_tech_stack_button">
                <div class="tech-stack-radio-frame">
                    <label class="tech-label">
                        <input value="java" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Java</div>
                    </label>
                    <label class="tech-label">
                        <input value="c" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C</div>
                    </label>
                    <label class="tech-label">
                        <input value="cpp" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C++</div>
                    </label>
                    <label class="tech-label">
                        <input value="csharp" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C#</div>
                    </label>
                    <label class="tech-label">
                        <input value="php" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Php</div>
                    </label>
                    <label class="tech-label">
                        <input value="python" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Python</div>
                    </label>
                    <label class="tech-label">
                        <input value="html" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Html</div>
                    </label>
                    <label class="tech-label">
                        <input value="css" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Css</div>
                    </label>
                    <label class="tech-label">
                        <input value="javascript" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Javascript</div>
                    </label>
                    <label class="tech-label">
                        <input value="kotlin" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Kotlin</div>
                    </label>
                    <label class="tech-label">
                        <input value="swift" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Swift</div>
                    </label>
                    <label class="tech-label">
                        <input value="ruby" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Ruby</div>
                    </label>
                    <label class="tech-label">
                        <input value="r" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">R</div>
                    </label>
                    <label class="label">
                        <input value="golang" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Golang</div>
                    </label>
                    <label class="tech-label">
                        <input value="default" name="fifthTechStackButtonIcon" class="tech-radio-input" type="radio"
                               checked>
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Default</div>
                    </label>
                </div>
            </div>
        </div>
        <div id="tech_stack_frame_6">
            <div class="tech-stack-button" onclick="playSoundButton()" id="sixth_tech_stack_button">
                <div class="tech-stack-radio-frame">
                    <label class="tech-label">
                        <input value="java" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Java</div>
                    </label>
                    <label class="tech-label">
                        <input value="c" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C</div>
                    </label>
                    <label class="tech-label">
                        <input value="cpp" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C++</div>
                    </label>
                    <label class="tech-label">
                        <input value="csharp" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">C#</div>
                    </label>
                    <label class="tech-label">
                        <input value="php" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Php</div>
                    </label>
                    <label class="tech-label">
                        <input value="python" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Python</div>
                    </label>
                    <label class="tech-label">
                        <input value="html" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Html</div>
                    </label>
                    <label class="tech-label">
                        <input value="css" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Css</div>
                    </label>
                    <label class="tech-label">
                        <input value="javascript" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Javascript</div>
                    </label>
                    <label class="tech-label">
                        <input value="kotlin" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Kotlin</div>
                    </label>
                    <label class="tech-label">
                        <input value="swift" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Swift</div>
                    </label>
                    <label class="tech-label">
                        <input value="ruby" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Ruby</div>
                    </label>
                    <label class="tech-label">
                        <input value="r" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">R</div>
                    </label>
                    <label class="label">
                        <input value="golang" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio">
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Golang</div>
                    </label>
                    <label class="tech-label">
                        <input value="default" name="sixthTechStackButtonIcon" class="tech-radio-input" type="radio"
                               checked>
                        <div class="radio-design"></div>
                        <div class="tech-label-text">Default</div>
                    </label>
                </div>
            </div>
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
    </form>
</section>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
</body>
</html>
