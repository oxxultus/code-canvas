<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자격증 정보 검색</title>
    <link rel="stylesheet" href="../styles/certificates.css">
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
<body>
<main>
    <div class="search-container">
        <h1>자격증 정보 검색</h1>
        <div class="search-box">
            <form method="get" action="/certificates">
                <label for="searchInput"></label><input type="text" placeholder="검색어를 입력하세요" name="searchInput" id="searchInput" value="${param.searchInput}">
                <button class="search-btn" type="submit">🔍</button>
            </form>
            <div class="dropdown">
                <button class="dropdown-btn">분야 ▼</button>
                <div class="dropdown-content">
                    <a href="?searchInput=${param.searchInput}&field=웹">웹</a>
                    <a href="?searchInput=${param.searchInput}&field=모바일">모바일</a>
                    <a href="?searchInput=${param.searchInput}&field=데스크톱 애플리케이션">데스크톱 애플리케이션</a>
                    <a href="?searchInput=${param.searchInput}&field=임베디드 소프트웨어">임베디드 소프트웨어</a>
                    <a href="?searchInput=${param.searchInput}&field=게임">게임</a>
                    <a href="?searchInput=${param.searchInput}&field=데이터">데이터</a>
                    <a href="?searchInput=${param.searchInput}&field=인공지능">인공지능</a>
                    <a href="?searchInput=${param.searchInput}&field=보안">보안</a>
                    <a href="?searchInput=${param.searchInput}&field=모든 자격증">모든 자격증</a> <!-- 모든 자격증을 선택할 수 있는 항목 추가 -->
                </div>
            </div>
        </div>
    </div>

    <div class="results-container">
        <h2>
            <c:choose>
                <c:when test="${not empty param.searchInput}">
                    '${param.searchInput}'에 대한 검색 결과
                </c:when>
                <c:otherwise>
                    ${param.field} 자격증
                </c:otherwise>
            </c:choose>
        </h2>

        <c:forEach var="cert" items="${filteredCertificates}">
            <div class="result-item">${cert}</div>
        </c:forEach>

        <c:if test="${empty filteredCertificates}">
            <div class="result-item">검색 결과가 없습니다.</div>
        </c:if>
    </div>

    <div class="navigation">
        <button class="home-btn" onclick="location.href='/information'">홈</button>
    </div>
</main>
</body>
</html>

