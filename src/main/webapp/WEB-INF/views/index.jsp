<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset ="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

    <link rel="stylesheet" href="../styles/base.css"> <!-- base CSS 파일 연결 -->
    <link rel="stylesheet" href="../styles/index.css"> <!-- index CSS 파일 연결 -->

    <script src="../scripts/index/change-image.js" defer></script> <!-- change-image js 파일 연결 -->
    <script src="../scripts/index/functions-of-each-button.js" defer></script> <!-- play-sound js 파일 연결 -->
    <script src="../scripts/index/keep-press-button.js" defer></script> <!-- keep-press-button js 파일 연결 -->
    <script src="../scripts/index/check-login.js" defer></script> <!-- login-check js 파일 연결 -->

  <title>CodeCanvas</title>
</head>
<body class="background hide-scroll">
<audio id="click-button-sound" src="../audio/click-button-app.mp3"></audio>
<audio id="click-home-button-sound" src="../audio/interface.mp3"></audio>

<div class="console-item bounce-in-top">
    <div class="console-img-frame">
        <img id="console_img" src="../images/index/console.png" alt="console" oncontextmenu="return false;">
        <div class="display-img-frame">
            <div class="loader">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
            <img id="display-img" src="../images/index/game-1.gif" alt="display-img" oncontextmenu="return false;">
            <p class="audiowide-regular" id="loader-text">Loading ...</p>
            <div id="error">
                <div id="error__icon">
                    <svg
                            fill="none"
                            height="24"
                            viewBox="0 0 24 24"
                            width="24"
                            xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                                d="m13 13h-2v-6h2zm0 4h-2v-2h2zm-1-15c-1.3132 0-2.61358.25866-3.82683.7612-1.21326.50255-2.31565 1.23915-3.24424 2.16773-1.87536 1.87537-2.92893 4.41891-2.92893 7.07107 0 2.6522 1.05357 5.1957 2.92893 7.0711.92859.9286 2.03098 1.6651 3.24424 2.1677 1.21325.5025 2.51363.7612 3.82683.7612 2.6522 0 5.1957-1.0536 7.0711-2.9289 1.8753-1.8754 2.9289-4.4189 2.9289-7.0711 0-1.3132-.2587-2.61358-.7612-3.82683-.5026-1.21326-1.2391-2.31565-2.1677-3.24424-.9286-.92858-2.031-1.66518-3.2443-2.16773-1.2132-.50254-2.5136-.7612-3.8268-.7612z"
                                fill="#393a37"
                        ></path>
                    </svg>
                </div>
                <div class="audiowide-regular" id="error__title">로그아웃 상태 입니다.</div>
            </div>
            <!-- 로그인 창이 띄워지는 부분 =================================================-->
            <form id="login_form">
            <div id="login_frame">
                <p class="audiowide-regular" id="login_heading">Login</p>
                <div id="login_email_field">
                    <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M13.106 7.222c0-2.967-2.249-5.032-5.482-5.032-3.35 0-5.646 2.318-5.646 5.702 0 3.493 2.235 5.708 5.762 5.708.862 0 1.689-.123 2.304-.335v-.862c-.43.199-1.354.328-2.29.328-2.926 0-4.813-1.88-4.813-4.798 0-2.844 1.921-4.881 4.594-4.881 2.735 0 4.608 1.688 4.608 4.156 0 1.682-.554 2.769-1.416 2.769-.492 0-.772-.28-.772-.76V5.206H8.923v.834h-.11c-.266-.595-.881-.964-1.6-.964-1.4 0-2.378 1.162-2.378 2.823 0 1.737.957 2.906 2.379 2.906.8 0 1.415-.39 1.709-1.087h.11c.081.67.703 1.148 1.503 1.148 1.572 0 2.57-1.415 2.57-3.643zm-7.177.704c0-1.197.54-1.907 1.456-1.907.93 0 1.524.738 1.524 1.907S8.308 9.84 7.371 9.84c-.895 0-1.442-.725-1.442-1.914z"></path>
                    </svg>
                    <label for="login_email"></label><input autocomplete="off" placeholder="Email" class="input-field" id="login_email" type="email">
                </div>
                <div id="login_password_field">
                    <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                    </svg>
                    <label for="login_password"></label><input placeholder="Password" class="input-field" id="login_password" type="password">
                    <pre class="audiowide-regular" id="login_explain_text"> PRESS       TO LOGIN</pre>
                    <button id="login_explain_button_a" onclick="return false;">
                        <svg id="login_explain_button_a_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                            <path d="M221.5 51.7C216.6 39.8 204.9 32 192 32s-24.6 7.8-29.5 19.7l-120 288-40 96c-6.8 16.3 .9 35 17.2 41.8s35-.9 41.8-17.2L93.3 384l197.3 0 31.8 76.3c6.8 16.3 25.5 24 41.8 17.2s24-25.5 17.2-41.8l-40-96-120-288zM264 320l-144 0 72-172.8L264 320z"></path>
                        </svg>
                    </button>
                    <pre class="audiowide-regular" id="login_explain_text2"> PRESS       TO REGISTER</pre>
                    <button id="login_explain_button_x" onclick="return false;">
                        <svg id="login_explain_button_x_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                            <path d="M376.6 84.5c11.3-13.6 9.5-33.8-4.1-45.1s-33.8-9.5-45.1 4.1L192 206 56.6 43.5C45.3 29.9 25.1 28.1 11.5 39.4S-3.9 70.9 7.4 84.5L150.3 256 7.4 427.5c-11.3 13.6-9.5 33.8 4.1 45.1s33.8 9.5 45.1-4.1L192 306 327.4 468.5c11.3 13.6 31.5 15.4 45.1 4.1s15.4-31.5 4.1-45.1L233.7 256 376.6 84.5z"></path>
                        </svg>
                    </button>
                    <pre class="audiowide-regular" id="login_explain_text3">EXIT</pre>
                    <button id="login_explain_button_b" onclick="return false;">
                        <svg id="login_explain_button_b_icon" fill="#DDDEDECE" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                            <path d="M64 32C28.7 32 0 60.7 0 96L0 256 0 416c0 35.3 28.7 64 64 64l128 0c70.7 0 128-57.3 128-128c0-46.5-24.8-87.3-62-109.7c18.7-22.3 30-51 30-82.3c0-70.7-57.3-128-128-128L64 32zm96 192l-96 0L64 96l96 0c35.3 0 64 28.7 64 64s-28.7 64-64 64zM64 288l96 0 32 0c35.3 0 64 28.7 64 64s-28.7 64-64 64L64 416l0-128z"></path>
                        </svg>
                    </button>
                </div>
            </div>
            </form>
            <!-- 회원가입 창이 띄워지는 부분 =================================================-->
            <form id="register_form">
            <div id="register_frame">
                <p class="audiowide-regular" id="register_heading">REGISTER</p>
                <div id="register_email_field">
                    <svg class="register-input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M13.106 7.222c0-2.967-2.249-5.032-5.482-5.032-3.35 0-5.646 2.318-5.646 5.702 0 3.493 2.235 5.708 5.762 5.708.862 0 1.689-.123 2.304-.335v-.862c-.43.199-1.354.328-2.29.328-2.926 0-4.813-1.88-4.813-4.798 0-2.844 1.921-4.881 4.594-4.881 2.735 0 4.608 1.688 4.608 4.156 0 1.682-.554 2.769-1.416 2.769-.492 0-.772-.28-.772-.76V5.206H8.923v.834h-.11c-.266-.595-.881-.964-1.6-.964-1.4 0-2.378 1.162-2.378 2.823 0 1.737.957 2.906 2.379 2.906.8 0 1.415-.39 1.709-1.087h.11c.081.67.703 1.148 1.503 1.148 1.572 0 2.57-1.415 2.57-3.643zm-7.177.704c0-1.197.54-1.907 1.456-1.907.93 0 1.524.738 1.524 1.907S8.308 9.84 7.371 9.84c-.895 0-1.442-.725-1.442-1.914z"></path>
                    </svg>
                    <label for="register_email"></label><input autocomplete="off" placeholder="Email" id="register_email" class="input-field" name="email" type="text">
                </div>
                <div id="register_password_field">
                    <svg class="register-input-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                    </svg>
                    <label for="register_password"></label><input placeholder="Password" class="input-field" id="register_password" name="password" type="password">
                </div>
                <div id="register_name_field">
                    <svg class="register-input-icon" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" viewBox="0 0 512 512">
                        <path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z"></path>
                    </svg>
                    <label for="register_name"></label><input placeholder="Name" class="input-field" id="register_name" name="name" type="text">
                </div>
                <div id="register_phone_field">
                    <svg class="register-input-icon" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" viewBox="0 0 512 512">
                        <path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"></path>
                    </svg>
                    <label for="register_phone"></label><input placeholder="Tel" class="input-field" id="register_phone" name="phone" type="tel" maxlength="11">
                </div>
                <div id="register_gender_field">
                    <svg class="register-input-icon" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" viewBox="0 0 512 512">
                        <path d="M160 0a48 48 0 1 1 0 96 48 48 0 1 1 0-96zm8 352l0-224 6.9 0c33.7 0 64.9 17.7 82.3 46.6l58.3 97c9.1 15.1 4.2 34.8-10.9 43.9s-34.8 4.2-43.9-10.9L232 256.9 232 480c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-128s0 0 0 0zM58.2 182.3c19.9-33.1 55.3-53.5 93.8-54.3l0 256s0 0 0 0l0 96c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-96-17.8 0c-10.9 0-18.6-10.7-15.2-21.1L93.3 248.1 59.4 304.5c-9.1 15.1-28.8 20-43.9 10.9s-20-28.8-10.9-43.9l53.6-89.2z"></path>
                    </svg>
                    <label for="register_gender"></label><input placeholder="Gender" class="input-field" id="register_gender" name="gender" type="text" maxlength="6">
                </div>
                <div id="register_birth_field">
                    <label for="register_birth"></label><input placeholder="Date" class="input-field" id="register_birth" name="birth" type="date">
                </div>
                <div id="register_address_field">
                    <svg class="register-input-icon" xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" viewBox="0 0 512 512">
                        <path d="M96 0C60.7 0 32 28.7 32 64l0 384c0 35.3 28.7 64 64 64l288 0c35.3 0 64-28.7 64-64l0-384c0-35.3-28.7-64-64-64L96 0zM208 288l64 0c44.2 0 80 35.8 80 80c0 8.8-7.2 16-16 16l-192 0c-8.8 0-16-7.2-16-16c0-44.2 35.8-80 80-80zm-32-96a64 64 0 1 1 128 0 64 64 0 1 1 -128 0zM512 80c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 64c0 8.8 7.2 16 16 16s16-7.2 16-16l0-64zM496 192c-8.8 0-16 7.2-16 16l0 64c0 8.8 7.2 16 16 16s16-7.2 16-16l0-64c0-8.8-7.2-16-16-16zm16 144c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 64c0 8.8 7.2 16 16 16s16-7.2 16-16l0-64z"></path>
                    </svg>
                    <label for="register_address"></label><input placeholder="Address" class="input-field" id="register_address" name="address" type="text">
                </div>
                <pre class="audiowide-regular" id="register_explain_text">EXIT</pre>
                <button id="register_explain_button_b" onclick="return false;">
                    <svg id="register_explain_button_b_icon" fill="#DDDEDECE" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                        <path d="M64 32C28.7 32 0 60.7 0 96L0 256 0 416c0 35.3 28.7 64 64 64l128 0c70.7 0 128-57.3 128-128c0-46.5-24.8-87.3-62-109.7c18.7-22.3 30-51 30-82.3c0-70.7-57.3-128-128-128L64 32zm96 192l-96 0L64 96l96 0c35.3 0 64 28.7 64 64s-28.7 64-64 64zM64 288l96 0 32 0c35.3 0 64 28.7 64 64s-28.7 64-64 64L64 416l0-128z"></path>
                    </svg>
                </button>
                <pre class="audiowide-regular" id="register_explain_text2">BACK</pre>
                <button id="register_explain_button_x" onclick="return false;">
                    <svg id="register_explain_button_x_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <path d="M376.6 84.5c11.3-13.6 9.5-33.8-4.1-45.1s-33.8-9.5-45.1 4.1L192 206 56.6 43.5C45.3 29.9 25.1 28.1 11.5 39.4S-3.9 70.9 7.4 84.5L150.3 256 7.4 427.5c-11.3 13.6-9.5 33.8 4.1 45.1s33.8 9.5 45.1-4.1L192 306 327.4 468.5c11.3 13.6 31.5 15.4 45.1 4.1s15.4-31.5 4.1-45.1L233.7 256 376.6 84.5z"></path>
                    </svg>
                </button>
                <pre class="audiowide-regular" id="register_explain_text3">PRESS       TO COMPLETE</pre>
                <button id="register_explain_button_a" onclick="return false;">
                    <svg id="register_explain_button_a_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <path d="M221.5 51.7C216.6 39.8 204.9 32 192 32s-24.6 7.8-29.5 19.7l-120 288-40 96c-6.8 16.3 .9 35 17.2 41.8s35-.9 41.8-17.2L93.3 384l197.3 0 31.8 76.3c6.8 16.3 25.5 24 41.8 17.2s24-25.5 17.2-41.8l-40-96-120-288zM264 320l-144 0 72-172.8L264 320z"></path>
                    </svg>
                </button>
            </div>
            </form>
            <!-- ========================================================================== -->
        </div>
        <button id="home-button" onclick="playHomeButtonSound()">
            <svg width="800px" height="800px" viewBox="0 0 1024 1024" id="home-button-icon" xmlns="http://www.w3.org/2000/svg">
                <path d="M981.4 502.3c-9.1 0-18.3-2.9-26-8.9L539 171.7c-15.3-11.8-36.7-11.8-52 0L70.7 493.4c-18.6 14.4-45.4 10.9-59.7-7.7-14.4-18.6-11-45.4 7.7-59.7L435 104.3c46-35.5 110.2-35.5 156.1 0L1007.5 426c18.6 14.4 22 41.1 7.7 59.7-8.5 10.9-21.1 16.6-33.8 16.6z" fill="#1C1C25FF"></path>
                <path d="M810.4 981.3H215.7c-70.8 0-128.4-57.6-128.4-128.4V534.2c0-23.5 19.1-42.6 42.6-42.6s42.6 19.1 42.6 42.6v318.7c0 23.8 19.4 43.2 43.2 43.2h594.8c23.8 0 43.2-19.4 43.2-43.2V534.2c0-23.5 19.1-42.6 42.6-42.6s42.6 19.1 42.6 42.6v318.7c-0.1 70.8-57.7 128.4-128.5 128.4z" fill="#1D347CFF"></path>
            </svg>
        </button>
        <button id="angle-right-button" onclick="playSoundButton();changeImage()">
            <svg id="angle-right-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10.25 16.25C10.1493 16.2466 10.0503 16.2227 9.95921 16.1797C9.86807 16.1367 9.78668 16.0756 9.72001 16C9.57956 15.8594 9.50067 15.6688 9.50067 15.47C9.50067 15.2713 9.57956 15.0806 9.72001 14.94L12.72 11.94L9.72001 8.94002C9.66069 8.79601 9.64767 8.63711 9.68277 8.48536C9.71786 8.33361 9.79933 8.19656 9.91586 8.09322C10.0324 7.98988 10.1782 7.92538 10.3331 7.90868C10.4879 7.89198 10.6441 7.92391 10.78 8.00002L14.28 11.5C14.4205 11.6407 14.4994 11.8313 14.4994 12.03C14.4994 12.2288 14.4205 12.4194 14.28 12.56L10.78 16C10.7133 16.0756 10.6319 16.1367 10.5408 16.1797C10.4497 16.2227 10.3507 16.2466 10.25 16.25Z" fill="#000000"></path>
            </svg>
        </button>
        <button id="angle-left-button" onclick="playSoundButton();reverseChangeImage()">
            <svg id="angle-left-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M13.75 16.25C13.6515 16.2505 13.5538 16.2313 13.4628 16.1935C13.3718 16.1557 13.2893 16.1001 13.22 16.03L9.72001 12.53C9.57956 12.3894 9.50067 12.1988 9.50067 12C9.50067 11.8013 9.57956 11.6107 9.72001 11.47L13.22 8.00003C13.361 7.90864 13.5285 7.86722 13.6958 7.88241C13.8631 7.89759 14.0205 7.96851 14.1427 8.08379C14.2649 8.19907 14.3448 8.35203 14.3697 8.51817C14.3946 8.68431 14.363 8.85399 14.28 9.00003L11.28 12L14.28 15C14.4205 15.1407 14.4994 15.3313 14.4994 15.53C14.4994 15.7288 14.4205 15.9194 14.28 16.06C14.1353 16.1907 13.9448 16.259 13.75 16.25Z" fill="#000000"></path>
            </svg>
        </button>
        <button id="left-big-button" onclick="playSoundButton();toggleSound()">
            <!-- 소리 켜짐 아이콘 (처음 보여지는 아이콘) -->
            <svg id="sound-on-icon" width="800px" height="800px" viewBox="-0.5 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M16.5493 4.50005C15.3193 4.04005 12.7093 5.49996 10.5493 7.40996H8.94922C7.88835 7.40996 6.87093 7.83145 6.12079 8.58159C5.37064 9.33174 4.94922 10.3491 4.94922 11.41V13.41C4.94922 14.4708 5.37064 15.4883 6.12079 16.2385C6.87093 16.9886 7.88835 17.41 8.94922 17.41H10.5493C12.6593 19.35 15.2693 20.78 16.5493 20.33C18.6493 19.55 18.9992 15.33 18.9992 12.41C18.9992 9.48996 18.6493 5.28005 16.5493 4.50005Z" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>

            <!-- 소리 꺼짐 아이콘 (숨겨진 아이콘) -->
            <svg id="sound-off-icon" width="800px" height="800px" viewBox="-0.5 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" style="display:none;">
                <path d="M10.9395 17.72C12.9395 19.5 15.3895 20.72 16.5495 20.33C18.6495 19.55 18.9995 15.3299 18.9995 12.4099C18.9995 11.5999 18.9995 10.68 18.8895 9.77002" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M18.1292 6.28008C18.0012 5.89129 17.795 5.53273 17.5233 5.22661C17.2516 4.9205 16.9201 4.67327 16.5493 4.50005C15.3193 4.04005 12.7093 5.49996 10.5493 7.40996H8.94922C7.88835 7.40996 6.87093 7.83145 6.12079 8.58159C5.37064 9.33174 4.94922 10.3491 4.94922 11.41V13.41C4.9489 14.1811 5.17151 14.936 5.59021 15.5835C6.00892 16.2311 6.60585 16.7438 7.3092 17.06" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M22 2.42004L2 22.42" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>
        </button>
        <button id="right-big-button" onclick="userButton()">
            <svg id="right-big-button-icon" width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="12" cy="6" r="4" stroke="#1C274C" stroke-width="1.5"></circle>
                <path d="M19.9975 18C20 17.8358 20 17.669 20 17.5C20 15.0147 16.4183 13 12 13C7.58172 13 4 15.0147 4 17.5C4 19.9853 4 22 12 22C14.231 22 15.8398 21.8433 17 21.5634" stroke="#1C274C" stroke-width="1.5" stroke-linecap="round"></path>
            </svg>
        </button>

        <button id="y-button" onclick="selectButtonA()">
            <svg id="y-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                <path d="M58 45.4C47.8 31 27.8 27.7 13.4 38S-4.3 68.2 6 82.6L160 298.3 160 448c0 17.7 14.3 32 32 32s32-14.3 32-32l0-149.7L378 82.6c10.3-14.4 6.9-34.4-7.4-44.6S336.2 31 326 45.4L192 232.9 58 45.4z"></path>
            </svg>
        </button>
        <button id="x-button" onclick="selectButtonX()">
            <svg id="x-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                <path d="M376.6 84.5c11.3-13.6 9.5-33.8-4.1-45.1s-33.8-9.5-45.1 4.1L192 206 56.6 43.5C45.3 29.9 25.1 28.1 11.5 39.4S-3.9 70.9 7.4 84.5L150.3 256 7.4 427.5c-11.3 13.6-9.5 33.8 4.1 45.1s33.8 9.5 45.1-4.1L192 306 327.4 468.5c11.3 13.6 31.5 15.4 45.1 4.1s15.4-31.5 4.1-45.1L233.7 256 376.6 84.5z"></path>
            </svg>
        </button>
        <button id="a-button" onclick="selectButtonA()">
            <svg id="a-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                <path d="M221.5 51.7C216.6 39.8 204.9 32 192 32s-24.6 7.8-29.5 19.7l-120 288-40 96c-6.8 16.3 .9 35 17.2 41.8s35-.9 41.8-17.2L93.3 384l197.3 0 31.8 76.3c6.8 16.3 25.5 24 41.8 17.2s24-25.5 17.2-41.8l-40-96-120-288zM264 320l-144 0 72-172.8L264 320z"></path>
            </svg>
        </button>
        <button id="b-button" onclick="selectButtonB()">
            <svg id="b-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                <path d="M64 32C28.7 32 0 60.7 0 96L0 256 0 416c0 35.3 28.7 64 64 64l128 0c70.7 0 128-57.3 128-128c0-46.5-24.8-87.3-62-109.7c18.7-22.3 30-51 30-82.3c0-70.7-57.3-128-128-128L64 32zm96 192l-96 0L64 96l96 0c35.3 0 64 28.7 64 64s-28.7 64-64 64zM64 288l96 0 32 0c35.3 0 64 28.7 64 64s-28.7 64-64 64L64 416l0-128z"></path>
            </svg>
        </button>
        <button id="logout-button" onclick="selectButtonLogout()">
            <svg id="logout-icon" fill="#EEE7E7FF" width="800px" height="800px" viewBox="0 0 96 96" xmlns="http://www.w3.org/2000/svg">
                <g>
                    <path d="M48,36a5.9966,5.9966,0,0,0,6-6V6A6,6,0,0,0,42,6V30A5.9966,5.9966,0,0,0,48,36Z"></path>
                    <path d="M76.0078,22.9746a6,6,0,0,0-8.0156,8.93A29.39,29.39,0,0,1,78,54a30,30,0,0,1-60,0A29.39,29.39,0,0,1,28.0078,31.9043a6,6,0,0,0-8.0156-8.93,42.0009,42.0009,0,1,0,56.0156,0Z"></path>
                </g>
            </svg>
        </button>
        </div>
    </div>
</body>
</html>

