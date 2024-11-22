<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="../styles/base.css">
    <link rel="stylesheet" href="../styles/home.css">
    <title>Home</title>
</head>
<body class="background">
<section>

</section>
<nav>
    <div class="fade-in-bottom tab-container">
        <input type="radio" name="tab" id="tab1" class="tab tab--1" checked/>
        <label class="tab_label" for="tab1">홈</label>

        <input type="radio" name="tab" id="tab2" class="tab tab--2" onclick="window.location.href='/portfolio'"/>
        <label class="tab_label" for="tab2">포트폴리오</label>

        <input type="radio" name="tab" id="tab3" onclick="window.location.href='/community'" class="tab tab--3"/>
        <label class="tab_label" for="tab3">커뮤니티</label>

        <input type="radio" name="tab" id="tab4" onclick="window.location.href='/information'" class="tab tab--4"/>
        <label class="tab_label" for="tab4">정보</label>

        <input type="radio" name="tab" id="tab5" onclick="window.location.href='/'" class="tab tab--5"/>
        <label class="tab_label" for="tab5">일정</label>

        <div class="indicator"></div>
    </div>
</nav>
<footer class="text-focus-in">
    <p>CodeCanvas &copy; 2024 - ALL RIGHT RESERVE</p>
</footer>
</body>
</html>
