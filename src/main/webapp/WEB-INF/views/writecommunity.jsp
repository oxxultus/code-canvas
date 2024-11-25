<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>게시판 작성</title>
  <link rel="stylesheet" href="../styles/base.css">
  <link rel="stylesheet" href="../styles/writecommunity.css">
  <link rel="icon" type="image/x-icon" href="../images/codecanvas.ico">
  <link rel="icon" type="image/png" href="../images/codecanvas.png">
  <script src="../scripts/portfolio/play-sound.js" defer></script>
</head>
<body class="background">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<section>
<form action="/api/community/save" method="post">
  <div class="fade-in-top" id="edit_community">
    <div id="community_title_frame">
      <svg id="community_title_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        <path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"></path>
      </svg>
      <p class="jua-regular" id="community_title">게시판 작성</p>
    </div>
    <!-- 버튼 -->
    <button onclick="playSoundButton();" id="reset" type="reset"><span class="jua-regular" id="reset_text">초기화</span></button>
    <button onclick="playSoundButton();" id="submit" type="submit"><span class="jua-regular" id="submit_text">작성</span></button>

    <div id="write_frame">
      <label for="write_title"></label>
      <input class="jua-regular" id="write_title" type="text" name="write_title" placeholder="제목을 입력해 주세요">

      <label for="write_detail"></label>
      <textarea class="jua-regular" id="write_detail" name="write_detail" placeholder="내용을 입력해 주세요"></textarea>
    </div>
  </div>
  <div class="fade-in-bottom" id="tag_frame">
    <div id="question_type">
      <div class="radio-button-container">
        <div class="radio-button">
          <input type="radio" class="radio-button__input" id="radio1" name="noticeboard" value="자유게시판" checked>
          <label class="radio-button__label" for="radio1">
            <span class="radio-button__custom"></span>
            자유게시판
          </label>
        </div>
        <div class="radio-button">
          <input type="radio" class="radio-button__input" id="radio2" name="noticeboard" value="질문게시판">
          <label class="radio-button__label" for="radio2">
            <span class="radio-button__custom"></span>
            질문게시판
          </label>
        </div>
        <div class="radio-button">
          <input onclick="playSoundButton();" type="radio" class="radio-button__input" id="radio3" name="noticeboard" value="강의게시판">
          <label class="radio-button__label" for="radio3">
            <span class="radio-button__custom"></span>
            강의게시판
          </label>
        </div>
        <div class="radio-button">
          <input onclick="playSoundButton();" type="radio" class="radio-button__input" id="radio4" name="noticeboard" value="정보게시판">
          <label class="radio-button__label" for="radio4">
            <span class="radio-button__custom"></span>
            정보게시판
          </label>
        </div>
      </div>
    </div>
      <div id="language_type">
        <div class="radio-button2-container">
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_1" name="language" value="java">
            <label class="radio-button2__label" for="radio2_1">
              <span class="radio-button2__custom"></span>
              JAVA
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_2" name="language" value="c">
            <label class="radio-button2__label" for="radio2_2">
              <span class="radio-button2__custom"></span>
              C/C++/C#
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_3" name="language" value="php">
            <label class="radio-button2__label" for="radio2_3">
              <span class="radio-button2__custom"></span>
              PHP
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_4" name="language" value="html">
            <label class="radio-button2__label" for="radio2_4">
              <span class="radio-button2__custom"></span>
              HTML
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_5" name="language" value="css">
            <label class="radio-button2__label" for="radio2_5">
              <span class="radio-button2__custom"></span>
              CSS
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_6" name="language" value="javascript">
            <label class="radio-button2__label" for="radio2_6">
              <span class="radio-button2__custom"></span>
              JAVASCRIPT
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_7" name="language" value="python">
            <label class="radio-button2__label" for="radio2_7">
              <span class="radio-button2__custom"></span>
              PYTHON
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_8" name="language" value="kotlin">
            <label class="radio-button2__label" for="radio2_8">
              <span class="radio-button2__custom"></span>
              KOTLIN
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_9" name="language" value="ruby">
            <label class="radio-button2__label" for="radio2_9">
              <span class="radio-button2__custom"></span>
              RUBY
            </label>
          </div>
          <div class="radio-button2">
            <input onclick="playSoundButton();" type="radio" class="radio-button2__input" id="radio2_10" name="language" value="default" checked>
            <label class="radio-button2__label" for="radio2_10">
              <span class="radio-button2__custom"></span>
              DEFAULT
            </label>
          </div>
        </div>
      </div>
  </div>
</form>
  <div class="first-fade-in-left" id="left_display_frame">
    <div class="display-frame">
      <img class="display-img" src="../images/community/write/display-left.png" alt="게임 gif">
    </div>
  </div>
  <div class="first-fade-in-right" id="right_display_frame">
    <div class="display-frame">
      <img class="display-img" src="../images/community/write/display-right.png" alt="게임 gif">
    </div>
  </div>
</section>
<nav>
  <div class="fade-in-bottom tab-container">
    <input onclick="playSoundButton();" type="radio" name="tab" id="tab1" onclick="window.location.href='/home'" class="tab tab--1"/>
    <label class="tab_label" for="tab1">홈</label>

    <input onclick="playSoundButton();" type="radio" name="tab" onclick="window.location.href='/portfolio'" id="tab2" class="tab tab--2"/>
    <label class="tab_label" for="tab2">포트폴리오</label>

    <input onclick="playSoundButton();" type="radio" name="tab" id="tab3" onclick="window.location.href='/community'" class="tab tab--3"checked/>
    <label class="tab_label" for="tab3">커뮤니티</label>

    <input onclick="playSoundButton();" type="radio" name="tab" id="tab4" onclick="window.location.href='/information'" class="tab tab--4"/>
    <label class="tab_label" for="tab4">정보</label>

    <input onclick="playSoundButton();" type="radio" name="tab" id="tab5" onclick="window.location.href='/home'" class="tab tab--5"/>
    <label class="tab_label" for="tab5">일정</label>

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
