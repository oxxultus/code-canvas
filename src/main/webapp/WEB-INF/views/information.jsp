<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/information.css"> <!-- CSS 파일 연결 -->
    <link rel="stylesheet" href="../styles/base.css">
    <link rel="icon" type="image/x-icon" href="../images/codecanvas.ico">
    <link rel="icon" type="image/png" href="../images/codecanvas.png">
    <script src="../scripts/portfolio/play-sound.js" defer></script>
    <title>Information</title>
</head>
<body class="background">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<section>
    <div class="fade-in-top" id="certificate_frame_title">
        <div id="certificate_frame_text_title">
            <span class="jua-regular" id="certificate_title">자격증 검색 순위</span>
        </div>
    </div>
    <div class="fade-in-bottom" id="top_certificate_frame">
        <div id="certificate_frame">
            <div id=certificate_top_list_frame>
                <c:forEach var="certificate" items="${certificates}">
                    <div class="card" onclick="playSoundButton();">
                        <img class="img" src="../images/certificates/${certificate.certificate_field}.png" alt="대표사진">
                        <div class="jua-regular title">${certificate.certificate_title}</div> <!-- 자격증 제목 출력 -->
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="button_frame">
            <button onclick="playSoundButton();" id="certificate_button">
                <span class="jua-regular" onclick="window.location.href='/certificates'" id="certificate_button_text">더 알아보기</span>
            </button>
        </div>
    </div>
    <div class="fade-in-top" id="competitions_frame_title">
        <div id="competitions_frame_text_title">
            <span class="jua-regular" id="competitions_title">공모전/대외활동 검색 순위</span>
        </div>
    </div>
    <div class="fade-in-bottom" id="top_competitions_frame">
        <div id="competitions_frame">
            <div id=competitions_top_list_frame>
                <c:forEach var="competition" items="${competitions}">
                    <div class="card" onclick="playSoundButton();">
                        <img class="img" src="../images/competitions/${competition.competitions_field}.png" alt="대표사진">
                        <div class="jua-regular title">${competition.competitions_title}</div> <!-- 자격증 제목 출력 -->
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="button_frame">
            <button onclick="playSoundButton();" id="competitions_button">
                <span class="jua-regular" onclick="window.location.href='/competitions'" id="competitions_button_text">더 알아보기</span>
            </button>
        </div>
    </div>
    <div class="first-fade-in-left" id="left_display_frame">
        <div class="display-frame">
            <img src="../images/community/display-left.png" alt="왼쪽 디스플레이">
        </div>
    </div>
    <div class="first-fade-in-right" id="right_display_frame">
        <div class="display-frame">
            <img src="../images/community/display-right.png" alt="오른쪽 디스플레이">
        </div>
    </div>
</section>
<nav>
    <div class="fade-in-bottom tab-container">
        <input type="radio" name="tab" id="tab1" onclick="playSoundButton(); window.location.href='/home'" class="tab tab--1"/>
        <label class="tab_label" for="tab1">홈</label>

        <input type="radio" name="tab" id="tab2" class="tab tab--2" onclick="playSoundButton(); window.location.href='/portfolio'"/>
        <label class="tab_label" for="tab2">포트폴리오</label>

        <input type="radio" name="tab" id="tab3" onclick="playSoundButton(); window.location.href='/community'" class="tab tab--3"/>
        <label class="tab_label" for="tab3">커뮤니티</label>

        <input type="radio" name="tab" id="tab4" onclick="playSoundButton(); window.location.href='/information'" class="tab tab--4" checked/>
        <label class="tab_label" for="tab4">정보</label>

        <input type="radio" name="tab" id="tab5" onclick="playSoundButton(); window.location.href='/'" class="tab tab--5"/>
        <label class="tab_label" for="tab5">메인</label>

        <div class="indicator"></div>
    </div>
    <form action="/logout" method="post">
        <button class="montserrat Btn fade-in-bottom">

            <div class="sign"><svg viewBox="0 0 512 512"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg></div>

            <div class="text">Logout</div>
        </button>
    </form>
</nav>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
</body>
</html>
