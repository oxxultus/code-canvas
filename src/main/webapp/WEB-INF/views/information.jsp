<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>초보 개발자를 위한 웹사이트</title>
    <link rel="stylesheet" href="../styles/information.css"> <!-- CSS 파일 연결 -->
</head>
<body>
<header>
    <nav>
        <ul class="menu">
            <li><a href="/certificates">자격증</a></li>
            <li><a href="/competitions">공모전/대외활동</a></li>
        </ul>
    </nav>
</header>
<main>
    <div class="content">
        <!-- 자격증 TOP 3 -->
        <div class="top-section">
            <h2>분야별 자격증</h2>
            <div class="grid-container">
                <!-- 웹 개발 분야 -->
                <div class="card">
                    <h3>웹 개발</h3>
                    <ul>
                        <li>⦁ 웹 개발 전문가</li>
                        <li>⦁ HTML5 프로그래밍 자격증</li>
                        <li>⦁ JavaScript 개발자 인증</li>
                    </ul>
                </div>

                <!-- 모바일 개발 분야 -->
                <div class="card">
                    <h3>모바일 개발</h3>
                    <ul>
                        <li>⦁ 모바일 앱 개발 전문가</li>
                        <li>⦁ Android 개발 자격증</li>
                        <li>⦁ iOS 전문가</li>
                    </ul>
                </div>

                <!-- 데이터 분석 분야 -->
                <div class="card">
                    <h3>데이터 분석</h3>
                    <ul>
                        <li>⦁ 데이터 분석 전문가</li>
                        <li>⦁ SQL 마스터</li>
                        <li>⦁ 데이터 과학 인증</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 공모전 TOP 3 -->
        <div class="top-section">
            <h2>공모전/대외활동</h2>
            <div class="grid-container">
                <div class="card">공모전 1</div>
                <div class="card">공모전 2</div>
                <div class="card">공모전 3</div>
            </div>
        </div>
    </div>
    <!-- 홈 버튼 -->
    <div class="home-button">
        <button onclick="location.href='/'">메인</button>
    </div>
</main>
</body>
</html>
