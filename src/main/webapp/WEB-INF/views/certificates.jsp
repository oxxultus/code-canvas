<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자격증 정보 검색</title>
    <link rel="stylesheet" href="../styles/certificates.css">
    <link rel="stylesheet" href="../styles/base.css">
    <link rel="icon" type="image/x-icon" href="../images/codecanvas.ico">
    <link rel="icon" type="image/png" href="../images/codecanvas.png">
    <script src="../scripts/portfolio/play-sound.js" defer></script>
    <script>
        // 자격증 데이터
        const certificateData = [
            {
                field: "웹",
                certificates: ["웹 개발 전문가",
                    "HTML5 프로그래밍 자격증",
                    "CSS 디자이너",
                    "JavaScript 개발자 인증",
                    "React 개발자 자격증",
                    "웹 보안 전문가"]
            },
            {
                field: "모바일",
                certificates: ["모바일 앱 개발 전문가",
                    "Android 개발 자격증",
                    "iOS 전문가",
                    "Flutter 앱 개발 인증",
                    "모바일 UI/UX 디자이너"]
            },
            {
                field: "데스크톱 애플리케이션",
                certificates: ["C++ 개발자 인증",
                    "Visual Studio 전문가",
                    "Windows 애플리케이션 개발 자격증",
                    "JavaFX 프로그래머",
                    ".NET 개발자 인증"]
            },
            {
                field: "데이터",
                certificates: ["데이터 분석 전문가",
                    "SQL 마스터",
                    "데이터 과학 인증",
                    "빅데이터 전문가",
                    "데이터 시각화 인증"]
            },
            {
                field: "임베디드 소프트웨어",
                certificates: ["임베디드 소프트웨어 전문가",
                    "마이크로컨트롤러 프로그래머",
                    "ARM 프로세서 인증",
                    "RTOS 전문가",
                    "FPGA 개발 인증"]
            },
            {
                field: "게임",
                certificates: ["게임 개발 전문가",
                    "Unity 인증 전문가",
                    "Unreal Engine 개발자",
                    "게임 그래픽 디자이너 인증",
                    "VR/AR 게임 개발 전문가"]
            },
            {
                field: "인공지능",
                certificates: ["AI 전문가",
                    "머신러닝 자격증",
                    "딥러닝 마스터",
                    "TensorFlow 개발자 인증",
                    "AI 모델 최적화 전문가"]
            },
            {
                field: "보안",
                certificates: ["정보 보안 전문가",
                    "네트워크 보안 인증",
                    "침투 테스트 전문가",
                    "클라우드 보안 전문가",
                    "사이버 보안 관리사"]
            }
        ];

        // 검색어와 선택된 분야에 맞는 자격증 필터링
        function filterResults(searchTerm, selectedField) {
            const resultsContainer = document.querySelector('.results-container');
            const resultsHeader = resultsContainer.querySelector('h2');
            const existingResults = resultsContainer.querySelectorAll('.result-item');

            // 기존 결과 제거
            existingResults.forEach(item => item.remove());

            let filteredCertificates = [];

            if (selectedField === "모든 자격증") {
                // 모든 분야에서 자격증 목록 필터링
                certificateData.forEach(category => {
                    category.certificates.forEach(cert => {
                        if (cert.toLowerCase().includes(searchTerm.toLowerCase())) {
                            filteredCertificates.push(cert);
                        }
                    });
                });
            } else {
                // 선택된 분야에서 자격증 목록 필터링
                const selectedCategory = certificateData.find(item => item.field === selectedField);
                if (selectedCategory) {
                    selectedCategory.certificates.forEach(cert => {
                        if (cert.toLowerCase().includes(searchTerm.toLowerCase())) {
                            filteredCertificates.push(cert);
                        }
                    });
                }
            }

            // 결과 제목 업데이트
            resultsHeader.textContent = searchTerm ? `'${searchTerm}'에 대한 검색 결과` : `${selectedField} 자격증`;

            // 필터링된 자격증 결과 추가
            filteredCertificates.forEach(cert => {
                const resultItem = document.createElement('div');
                resultItem.className = 'result-item';
                resultItem.textContent = cert;
                resultsContainer.appendChild(resultItem);
            });

            // 결과가 없으면 "결과 없음" 메시지 추가
            if (filteredCertificates.length === 0) {
                const noResults = document.createElement('div');
                noResults.className = 'result-item';
                noResults.textContent = '검색 결과가 없습니다.';
                resultsContainer.appendChild(noResults);
            }
        }

        // 드롭다운에서 선택된 분야에 맞춰 결과 업데이트
        function updateResults(field) {
            const searchInput = document.querySelector('#searchInput');
            const searchTerm = searchInput.value;

            // 검색어 필터링 및 결과 업데이트
            filterResults(searchTerm, field);
        }

        // 드롭다운 클릭 이벤트 추가
        function setupDropdown() {
            const dropdownItems = document.querySelectorAll('.dropdown-content a');
            dropdownItems.forEach(item => {
                item.addEventListener('click', event => {
                    event.preventDefault();
                    const selectedField = event.target.textContent;
                    updateResults(selectedField);
                });
            });
        }

        // 검색 버튼 클릭 시 결과 업데이트
        function setupSearchButton() {
            const searchButton = document.querySelector('.search-btn');
            searchButton.addEventListener('click', function () {
                const searchInput = document.querySelector('#searchInput');
                const searchTerm = searchInput.value;
                const selectedField = document.querySelector('.dropdown-btn').textContent;

                if (searchTerm === "") {
                    // 검색어가 없으면 모든 자격증을 표시
                    filterResults(searchTerm, "모든 자격증");
                } else {
                    filterResults(searchTerm, selectedField);
                }
            });
        }

        // DOM 로드 후 이벤트 바인딩
        window.onload = function () {
            setupDropdown();
            setupSearchButton(); // 검색 버튼 이벤트 설정
        };
    </script>
</head>
<body class="background">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<section>
    <div class="fade-in-bottom" id="community">
        <div id="community_frame">
            <div id="community_list_frame">
                <c:forEach var="certificate" items="${certificates}">
                    <div class="card" onclick="playSoundButton();" data-title="${certificate.certificate_title}" data-text="${certificate.certificate_description}" data-link="${certificate.certificate_link}">
                        <img class="img" src="../images/community/language/${certificate.certificate_field}.png" alt="대표사진">
                        <div class="jua-regular title">${certificate.certificate_title} <!-- 자격증 제목 출력 -->
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

        <input type="radio" name="tab" id="tab5" onclick="window.location.href='/home'" class="tab tab--5"/>
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

