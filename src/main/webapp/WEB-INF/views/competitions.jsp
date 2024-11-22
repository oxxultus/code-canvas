<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공모전 검색</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
<div class="container">
    <h1>공모전/대외활동 검색</h1>
    <div class="search-bar">
        <input type="text" id="search-input" placeholder="검색어를 입력하세요">
        <button id="search-button">🔍</button>
        <select id="category-select">
            <option value="">분야 선택</option>
            <option value="웹 개발">웹 개발</option>
            <option value="모바일 개발">모바일 개발</option>
            <option value="인공지능">인공지능</option>
        </select>
    </div>
    <div id="competition-results" class="competition-list"></div>
    <button class="home-button" onclick="location.href='/menu'">홈</button>
</div>
<script src="../scripts/information/competitions.js"></script>
</body>
</html>
