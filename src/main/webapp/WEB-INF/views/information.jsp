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
                        <img class="img" src="../images/certificate/${certificate.certificate_field}.png" alt="대표사진">
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
                <%-- 해당 부분에 직접 데이터를 받아와서 출력하게 해보셈--%>
                <%-- 아래 forEach함수 부분만 수정하면 된다. --%>
                    <%-- 컨트롤러에서 페이지 로딩하기 이전에 값을 처리하고 데이터를 받아오면 된다. --%>
                <c:forEach var="certificate" items="${certificates}">
                    <div class="card" onclick="playSoundButton();">
                        <img class="img" src="../images/certificate/${certificate.certificate_field}.png" alt="대표사진">
                        <div class="jua-regular title">${certificate.certificate_title}</div> <!-- 자격증 제목 출력 -->
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
            <img src="../images/community/display-left0.gif" alt="왼쪽 디스플레이">
        </div>
    </div>
    <div class="first-fade-in-right" id="right_display_frame">
        <div class="display-frame">
            <img src="../images/community/display-left0.gif" alt="오른쪽 디스플레이">
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

        <input type="radio" name="tab" id="tab5" onclick="playSoundButton(); window.location.href='/home'" class="tab tab--5"/>
        <label class="tab_label" for="tab5">일정</label>

        <div class="indicator"></div>
    </div>
</nav>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
</body>
</html>
