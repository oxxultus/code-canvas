<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공모전/대외활동 검색</title>

    <link rel="stylesheet" href="../styles/competitions.css">
    <link rel="stylesheet" href="../styles/base.css">
    <script src="../scripts/portfolio/play-sound.js" defer></script>


</head>
<body class="background">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<section>
    <div class="fade-in-bottom" id="community">
        <div id="community_frame">
            <div id="community_list_frame">

                <c:forEach var="competitions" items="${competitions}">
                    <div class="card" onclick="playSoundButton();" data-title="${competitions.competitions_title}" data-text="${competitions.competitions_description}" data-link="${competitions.competitions_link}">
                        <img class="img" src="../images/competitions/${competitions.competitions_field}.png" alt="대표사진">
                        <div class="jua-regular title">${competitions.competitions_title} <!-- 자격증 제목 출력 -->
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="jua-regular" id="post_detail_frame">
                <div id="post_detail_title_frame">
                    <span id="post_detail_title"></span>
                </div>
                <div id="post_detail_text_frame">
                    <pre class="jua-regular" id="post_detail_text"></pre>
                </div>
                <button id="post_detail_noticeboard_frame">
                    <span id="post_detail_noticeboard">공모전/대외활동 페이지 이동하기</span>
                </button>
                <button onclick="playSoundButton();" id="exit" type="submit"><span class="jua-regular" id="exit_text">나가기</span></button>
            </div>
        </div>
    </div>
    <div class="fade-in-top" id="search">
        <div id="search_frame">
            <form action="/competitions" method="get">
                <label for="write_search"></label>
                <input class="jua-regular" id="write_search" type="text" name="competitions_title" placeholder="검색어를 입력해 주세요">
                <svg id="write_search_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                </svg>
                <select onclick="playSoundButton();" class="jua-regular" id="language" name="competitions_field">
                    <option value="">분야 선택</option>
                    <option value="web">웹</option>
                    <option value="data" >데이터</option>
                    <option value="game" >게임</option>
                    <option value="ai" >인공지능</option>
                    <option value="security" >보안</option>
                </select>
                <button id="submit" type="submit" onclick="playSoundButton();"><span class="jua-regular" id="submit_text" >검색</span></button>
            </form>
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
        <input type="radio" name="tab" id="tab1" onclick="window.location.href='/home'" class="tab tab--1"/>
        <label class="tab_label" for="tab1">홈</label>

        <input type="radio" name="tab" onclick="window.location.href='/portfolio'" id="tab2" class="tab tab--2"/>
        <label class="tab_label" for="tab2">포트폴리오</label>

        <input type="radio"onclick="window.location.href='/community'" name="tab" id="tab3" class="tab tab--3"/>
        <label class="tab_label" for="tab3">커뮤니티</label>

        <input type="radio" name="tab" id="tab4" onclick="window.location.href='/information'" class="tab tab--4" checked/>
        <label class="tab_label" for="tab4">정보</label>

        <input type="radio" name="tab" id="tab5" onclick="window.location.href='/'" class="tab tab--5"/>
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
<script src="../scripts/competitions/show-competitions-detail.js"></script>
</body>
</html>
