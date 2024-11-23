<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<%!

    // 주석 작성할라고 해둔거니까 지우면된다.

    /**
     * CSS 도 파일 복사해서 이름만 이파일이름이랑 동일하게 변경해주고
     *
     * 주석1: information 컨트롤러의 @GetMapping("/certificates") 를 참고해서 작성하면됩니다.
     *       - 검색 알고리즘 이니까 공모전/대외 활동도 검색 경우가 "텍스트"랑 "분야" 두가지니까 추가할 것도 없고 수정만 하면될겁니다.
     *       - items="${certificates} 은 컨트롤러에서 전달한 값이고 var="certificate"값은 사용할 변수 이름 입니다.
     *       - ${certificate.certificate_field} 해당 방식으로 사용하면됩니다.
     *
     *       - data-title="${certificate.certificate_title}" data-text="${certificate.certificate_description}" data-link="${certificate.certificate_link}"
     *       - 위에 해당 하는 값들은 .js 에서 사용하기위해 값을 임시저장하는 부분입니다.
     *
     * 주석2: 기존의 certificates 에서 사용하던 .js 파일을 복사해서 사용 하면 됩니다.
     *       - 수정해야 할 부분
     *          - //데이터 가져오기 부분
     *          - // certificate_count 증가 요청 부분
     *              - Information 컨트롤러에서 추가해야 한다. /increaseCertificateCount 컨트롤러 참고
     *              - 추가 했으면 config 폴더의 SecurityConfig에 추가 해 줘야한다.
     *          - 그정도만 하면 끝입니다.
     *
     * 주석3: 최종적으로 information 페이지의 top 공모전 순위를 나타내게 표시해야합니다.
     *       - 기존코드 있으니까 한번 해보세요. 간단합니다. 코드 복붙하고 수정조금만 하면 끝입니다.
     * */
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공모전 검색</title>

    <%--해당 여기 두가지는 수정하지 말 것--%>
    <link rel="stylesheet" href="../styles/base.css">
    <script src="../scripts/portfolio/play-sound.js" defer></script>

    <%--CSS 복사해서 추가시킬 것--%>

</head>
<body class="background">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<section>
    <div class="fade-in-bottom" id="community">
        <div id="community_frame">
            <div id="community_list_frame">
                <%--수정해야 할 부분.--%>
                <%--반드시 공모전/대외활동의 값을 불러와야 한다.--%>
                    <%--주석 1 확인--%>
                <c:forEach var="certificate" items="${certificates}">
                    <div class="card" onclick="playSoundButton();" data-title="${certificate.certificate_title}" data-text="${certificate.certificate_description}" data-link="${certificate.certificate_link}">
                        <img class="img" src="../images/community/language/${certificate.certificate_field}.png" alt="대표사진">
                        <div class="jua-regular title">${certificate.certificate_title} <!-- 자격증 제목 출력 -->
                        </div>
                    </div>
                </c:forEach>
            </div>
            <%--수정해야 할 부분.--%>
            <%--여기부분은 js 에서 관리하기 때문에 js 를 사용해서 처리할 것 이다.--%>
            <%--주석 2 확인--%>
            <div class="jua-regular" id="post_detail_frame">
                <div id="post_detail_title_frame">
                    <span id="post_detail_title"></span>
                </div>
                <div id="post_detail_text_frame">
                    <pre class="jua-regular" id="post_detail_text"></pre>
                </div>
                <button id="post_detail_noticeboard_frame">
                    <span id="post_detail_noticeboard">자격증 페이지 이동하기</span>
                </button>
                <button onclick="playSoundButton();" id="exit" type="submit"><span class="jua-regular" id="exit_text">나가기</span></button>
            </div>
        </div>
    </div>
    <div class="fade-in-top" id="search">
        <div id="search_frame">
            <form action="/certificates" method="get">
                <label for="write_search"></label>
                <input class="jua-regular" id="write_search" type="text" name="certificate_title" placeholder="검색어를 입력해 주세요">
                <svg id="write_search_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                </svg>
                <select onclick="playSoundButton();" class="jua-regular" id="language" name="certificate_field">
                    <option value="">분야 선택</option>
                    <option value="web">웹</option>
                    <option value="mobile" >모바일</option>
                    <option value="desktop" >데스크톱 애플리케이션</option>
                    <option value="data" >데이터</option>
                    <option value="embedded" >임베디드 소프트웨어</option>
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
        <input type="radio" name="tab" id="tab1" onclick="window.location.href='/home'" class="tab tab--1"/>
        <label class="tab_label" for="tab1">홈</label>

        <input type="radio" name="tab" onclick="window.location.href='/portfolio'" id="tab2" class="tab tab--2"/>
        <label class="tab_label" for="tab2">포트폴리오</label>

        <input type="radio"onclick="window.location.href='/community'" name="tab" id="tab3" class="tab tab--3"/>
        <label class="tab_label" for="tab3">커뮤니티</label>

        <input type="radio" name="tab" id="tab4" onclick="window.location.href='/information'" class="tab tab--4" checked/>
        <label class="tab_label" for="tab4">정보</label>

        <input type="radio" name="tab" id="tab5" onclick="window.location.href='/'" class="tab tab--5"/>
        <label class="tab_label" for="tab5">일정</label>

        <div class="indicator"></div>
    </div>
</nav>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
<script src="../scripts/certificates/show-certificate-detail.js"></script>
</body>
</html>
