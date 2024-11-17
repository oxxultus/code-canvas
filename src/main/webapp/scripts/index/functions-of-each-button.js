/**
 * index.jsp 의 각 버튼 별 기능을 담당하는 파일입니다.
 *
 * 작성자: oxxultus (김영진)
 * 최종 수정자: oxxultus (김영진)
 * 생성일: 2024-11-10
 * 업데이트일: 2024-11-12
*/
// ====================================================================================================================
/*
 * 소리를 키고 끌 수 있는 기능을 가진 버튼입니다.
*/
let isSoundOn = true;  // 소리 상태 (true: 켜짐, false: 꺼짐)

function toggleSound() {
    const sounds = document.querySelectorAll("audio");
    const soundOnIcon = document.getElementById("sound-on-icon");
    const soundOffIcon = document.getElementById("sound-off-icon");
    const clickSound = document.getElementById("click-button-sound"); // 클릭 버튼 소리

    if (isSoundOn) {
        // 소리 끄기: 모든 소리 멈추기
        sounds.forEach(sound => {
            sound.pause();  // 소리 멈추기
            sound.currentTime = 0;  // 소리 초기화
        });

        // 상태를 꺼지도록 설정
        isSoundOn = false;
        soundOnIcon.style.display = "none";  // 소리 켜기 아이콘 숨기기
        soundOffIcon.style.display = "block";  // 소리 끄기 아이콘 보이기
    } else {
        // 소리 켜기: 클릭 버튼 소리만 재생
        isSoundOn = true;

        // 클릭 버튼 소리만 재생 (다른 소리는 재생하지 않음)
        if (clickSound.paused || clickSound.ended) {
            clickSound.currentTime = 0;  // 소리 시작 위치 초기화
            clickSound.play();  // 새 소리 재생
        }

        // 아이콘 상태 변경
        soundOnIcon.style.display = "block";  // 소리 켜기 아이콘 보이기
        soundOffIcon.style.display = "none";  // 소리 끄기 아이콘 숨기기
    }
}
// ====================================================================================================================
/*
 * 기본적으로 버튼에 공통적인 소리를 사용하기 위한 함수입니다.
*/
function playSoundButton() {
    const sound = document.getElementById("click-button-sound");

    if (isSoundOn) {  // 소리가 켜져 있을 때만 재생
        sound.currentTime = 0;  // 소리 시작 위치 초기화
        sound.play();  // 새 소리 재생
    }
}
// ====================================================================================================================
/*
 * 홈 버튼을 눌렀을 때 적용되는 부분입니다.
*/
function playHomeButtonSound() {
    const sound = document.getElementById("click-home-button-sound");
    const defaultDelay = 0.2; // 소리 무음 시 기본 지연 시간 (초)

    const imageElement = document.getElementById("display-img");
    const loaderElement = document.querySelector(".loader");  // loader 클래스 요소
    const loaderTextElement = document.getElementById("loader-text");  // loader-text id 요소

    // 소리 재생
    if (isSoundOn) {  // 소리가 켜져 있을 때만 재생
        if (!sound.paused && !sound.ended) {
            sound.pause(); // 현재 소리 멈추기
            sound.currentTime = 0; // 소리 시작 위치 초기화
        }
        sound.play(); // 새 소리 재생
    }

    // 인증 확인 및 페이지 이동
    fetch('/api/user/current', {
        method: 'GET',
        credentials: 'include', // 쿠키를 함께 전송하도록 설정
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(async (response) => {
            if (response.ok) {
                const data = await response.json();
                alert(`환영합니다, ${data.name}님!`);

                // 소리 재생 시간 또는 기본 지연 시간 후 이미지 변경 및 페이지 이동
                setTimeout(function() {
                    // 이미지 변경
                    if (imageElement) {
                        imageElement.src = "../../images/index/dark-navy.png";
                    }

                    // loader 요소 보이게 하기
                    if (loaderElement) {
                        loaderElement.style.display = "flex";  // loader 보이기
                    }

                    if (loaderTextElement) {
                        loaderTextElement.style.display = "flex";  // loader 보이기
                    }

                    // 2초 뒤 페이지 이동
                    setTimeout(function() {
                        window.location.href = '/portfolio'; // 페이지 이동
                    }, 2000); // 2초 후 페이지 이동
                }, (isSoundOn ? (sound.duration || defaultDelay) : defaultDelay) * 1000);

            } else {
                alert("로그인이 필요합니다.");
                document.getElementById('login_form').reset();
                document.getElementById('register_form').reset();

                const loginFrame = document.getElementById("login_frame");
                loginFrame.style.display = "flex";
            }
        })
        .catch(error => {
            console.error('오류 발생:', error);
            alert("오류가 발생했습니다. 다시 시도해 주세요.");
            window.location.href = '/index';
        });
}
// ====================================================================================================================
/*
 * 사용자(로그인) 버튼을 눌렀을 때 적용되는 부분입니다.
*/
let isUserButton = false; // 로그인 창 상태 (true: 켜짐, false: 꺼짐)

function userButton() {
    const sound = document.getElementById("click-button-sound");
    const loginFrame = document.getElementById("login_frame");

    if (isSoundOn) {  // 소리가 켜져 있을 때만 재생
        if (!sound.paused && !sound.ended) {
            sound.pause(); // 현재 소리 멈추기
            sound.currentTime = 0; // 소리 시작 위치 초기화
        }
        sound.play(); // 새 소리 재생
    }

    // 예외 처리: 다른 버튼으로 인해 로그인창이 켜져있을 때 끄는 경우
    if (loginFrame.style.display === "flex") {
        loginFrame.style.display = "none";
        isUserButton = false;
        return;
    }

    // 현재 로그인 창의 상태를 반전시킴
    isUserButton = !isUserButton;

    // 로그인 여부 체크
    fetch('/api/user/current', {
        method: 'GET',
        credentials: 'include', // 쿠키를 함께 전송하도록 설정
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(async (response) => {
            if (response.status === 200) {
                const data = await response.json();
                alert(`당신은 이미 로그인 되어있습니다., ${data.name}님!`); // test-code
                window.location.href = '/index'; // 로그인 되어있을 경우 리디렉션
            } else {
                // 로그인 되어있지 않을 경우 처리
                if (isUserButton) {
                    // 로그인 창을 나타내기
                    loginFrame.style.display = "flex";
                    document.getElementById('login_form').reset();
                    document.getElementById('register_form').reset();
                } else {
                    // 로그인 창을 숨기기
                    loginFrame.style.display = "none";
                }
            }
        })
        .catch(error => {
            console.error('오류 발생:', error);
            alert("오류가 발생했습니다. 다시 시도해 주세요.");
            window.location.href = '/index';
        });
}
// ====================================================================================================================
/*
 * A 버튼을 눌렀을 때 적용되는 부분입니다.
*/
function selectButtonA() {
    // 클릭 소리 요소와 프레임 요소들을 가져옵니다.
    const sound = document.getElementById("click-button-sound");
    const loginFrame = document.getElementById("login_frame");
    const registerFrame = document.getElementById("register_frame");

    // 프레임의 현재 표시 상태를 가져옵니다.
    const loginFrameDisplay = getComputedStyle(loginFrame).display;
    const registerFrameDisplay = getComputedStyle(registerFrame).display;

    // 사운드 재생 여부를 확인하고 사운드 재생
    if (isSoundOn) {
        sound.currentTime = 0;
        sound.play();
    }

    if (loginFrameDisplay === "flex" && registerFrameDisplay === "none") {
        // 로그인 폼 입력값 검증
        const email = document.getElementById('login_email').value;
        const password = document.getElementById('login_password').value;

        // 이메일과 비밀번호가 모두 비어 있는지 확인
        if (!email && !password) {
            alert("이메일과 비밀번호를 입력해주세요.");
            return;
        }
        // 이메일이 비어 있는지 확인
        else if (!email) {
            alert("이메일을 입력해 주세요.");
            return;
        }
        // 비밀번호가 비어 있는지 확인
        else if (!password) {
            alert("비밀번호를 입력해 주세요.");
            return;
        }

        // 로그인 요청을 서버에 보냅니다.
        fetch('/api/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password }),
            credentials: 'include'
        })
            .then(async response => {
                const data = await response.json();
                if (response.status === 200) {
                    alert('로그인 성공!');
                    window.location.href = '/index'; // 로그인 성공 후 리디렉션
                } else {
                    alert('로그인 실패: ' + data.message);
                }
            })
            .catch(error => {
                console.error('로그인 오류:', error);
                alert('로그인 중 오류가 발생했습니다.');
            });
    } else if (loginFrameDisplay === "none" && registerFrameDisplay === "flex") {
        // 회원가입 폼 입력값 검증
        const email = document.getElementById('register_email').value;
        const password = document.getElementById('register_password').value;
        const phone = document.getElementById('register_phone').value;
        const gender = document.getElementById('register_gender').value;
        const name = document.getElementById('register_name').value;
        const address = document.getElementById('register_address').value;
        const birth = document.getElementById('register_birth').value;

        // 입력값 검증
        if (!email) {
            alert("이메일을 입력해 주세요.");
            return;
        }
        if (!password) {
            alert("비밀번호를 입력해 주세요.");
            return;
        }
        if (!phone) {
            alert("전화번호를 입력해 주세요.");
            return;
        }
        if (!gender) {
            alert("성별을 입력해 주세요.");
            return;
        }
        if (!name) {
            alert("이름을 입력해 주세요.");
            return;
        }
        if (!address) {
            alert("주소를 입력해 주세요.");
            return;
        }
        if (!birth) {
            alert("생일을 입력해 주세요.");
            return;
        }

        // 회원가입 요청을 서버에 보냅니다.
        fetch('/api/register', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password, phone, gender, name, address, birth }),
            credentials: 'include'
        })
            .then(async response => {
                const data = await response.json();
                if (response.status === 200) {
                    alert('회원가입 성공!');
                    window.location.href = '/index'; // 회원가입 성공 후 리디렉션
                } else {
                    alert('회원가입 실패: ' + data.message);
                }
            })
            .catch(error => {
                console.error('회원가입 오류:', error);
                alert('회원가입 중 오류가 발생했습니다.');
            });
    }
}
// ====================================================================================================================
/*
 * B 버튼을 눌렀을 때 적용되는 부분입니다.
*/
function selectButtonB() {
    const sound = document.getElementById("click-button-sound");
    const loginFrame = document.getElementById("login_frame");
    const registerFrame = document.getElementById("register_frame");

    if (isSoundOn) {
        sound.currentTime = 0;
        sound.play();
    }

    // 로그인 혹은 회원가입 창이 떠 있을 경우 버튼을 누르면 창이 닫아진다.
    const loginFrameDisplay = getComputedStyle(loginFrame).display;
    const registerFrameDisplay = getComputedStyle(registerFrame).display;

    if (loginFrameDisplay === "flex" || registerFrameDisplay === "flex" ) {
        isUserButton = !isUserButton;

        // 작성된 정보를 초기화 시키면서
        document.getElementById('login_form').reset();
        document.getElementById('register_form').reset();

        loginFrame.style.display = "none";
        registerFrame.style.display = "none";
    }
}
// ====================================================================================================================
/*
 * X 버튼을 눌렀을 때 적용되는 부분입니다.
*/
function selectButtonX() {
    const sound = document.getElementById("click-button-sound");
    const loginFrame = document.getElementById("login_frame");
    const registerFrame = document.getElementById("register_frame");

    if (isSoundOn) {
        sound.currentTime = 0;
        sound.play();
    }

    // 로그인 창이 띄워져 있을 때 x 버튼을 누르면 회원가입 창이 띄워진다.
    const loginFrameDisplay = getComputedStyle(loginFrame).display;
    const registerFrameDisplay = getComputedStyle(registerFrame).display;

    if (loginFrameDisplay === "flex" && registerFrameDisplay === "none" ) {
        document.getElementById('login_form').reset();
        document.getElementById('register_form').reset();
        registerFrame.style.display = "flex";
        loginFrame.style.display = "none";
    }
    else if (registerFrameDisplay === "flex" && loginFrameDisplay === "none" ) {
        document.getElementById('login_form').reset();
        document.getElementById('register_form').reset();
        registerFrame.style.display = "none";
        loginFrame.style.display = "flex";
    }
}
// ====================================================================================================================
/*
 * 로그아웃(logout) 버튼을 눌렀을 때 적용되는 부분입니다.
*/
function selectButtonLogout() {
    const sound = document.getElementById("click-button-sound");

    if (isSoundOn) {
        sound.currentTime = 0;
        sound.play();
    }

    // 로그인 여부 확인
    fetch('/api/user/current', {
        method: 'GET',
        credentials: 'include', // 쿠키를 함께 전송하도록 설정
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(async (response) => {
            if (response.status === 200) {
                // 로그아웃 요청
                return fetch('/logout', {
                    method: 'POST',
                    credentials: 'include', // 쿠키를 함께 전송하도록 설정
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });
            } else {
                // 로그인되어 있지 않음
                throw new Error('로그인이 되어 있지 않습니다.');
            }
        })
        .then(async (response) => {
            if (response.status === 200) {
                alert('로그아웃되었습니다.');
                window.location.href = '/index'; // 로그아웃 성공 시 리디렉션
            } else {
                alert('로그아웃에 실패했습니다. 다시 시도해주세요.');
            }
        })
        .catch(error => {
            console.error('오류 발생:', error);
            alert(error.message || '오류가 발생했습니다. 다시 시도해 주세요.');
        });
}
// ====================================================================================================================




