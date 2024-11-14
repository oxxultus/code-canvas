let isSoundOn = true;  // 소리 상태 (true: 켜짐, false: 꺼짐)

// 소리 상태 토글 (켜짐 / 꺼짐)
function toggleSound() {
    const sounds = document.querySelectorAll("audio");

    // 아이콘 상태를 변경
    const soundOnIcon = document.getElementById("sound-on-icon");
    const soundOffIcon = document.getElementById("sound-off-icon");
    const clickSound = document.getElementById("click-button-sound"); // 클릭 버튼 소리

    if (isSoundOn) {
        // 다른 소리 끄기
        sounds.forEach(sound => {
            if (sound !== clickSound) {  // 클릭 소리는 제외
                sound.pause();  // 소리 멈추기
                sound.currentTime = 0;  // 소리 시작 위치 초기화
            }
        });
        isSoundOn = false;  // 상태를 끄기로 설정
        soundOnIcon.style.display = "none";  // 소리 켜기 아이콘 숨기기
        soundOffIcon.style.display = "block";  // 소리 끄기 아이콘 보이기
    } else {
        // 클릭 버튼 소리는 계속 재생하고, 다른 소리는 켜기
        sounds.forEach(sound => {
            if (sound !== clickSound) {  // 클릭 소리는 제외
                sound.play();  // 소리 재생
            }
        });
        isSoundOn = true;  // 상태를 켜기로 설정
        soundOnIcon.style.display = "block";  // 소리 켜기 아이콘 보이기
        soundOffIcon.style.display = "none";  // 소리 끄기 아이콘 숨기기
    }
}

// 클릭 버튼 소리 계속 실행 (소리가 켜졌을 때만)
function playSoundButton() {
    const sound = document.getElementById("click-button-sound");
    if (isSoundOn) {  // 소리가 켜져 있을 때만 재생
        sound.currentTime = 0; // 소리가 여러 번 클릭해도 처음부터 재생되도록
        sound.play();
    }
}

// 버튼 2의 소리 재생 후 페이지 이동 (소리가 켜져 있을 때만)
function playHomeButtonSound() {
    const sound = document.getElementById("click-home-button-sound");
    const defaultDelay = 0.2; // 소리 무음 시 기본 지연 시간 (초)

    if (isSoundOn) {  // 소리가 켜져 있을 때만 재생
        if (!sound.paused && !sound.ended) {
            sound.pause(); // 현재 소리 멈추기
            sound.currentTime = 0; // 소리 시작 위치 초기화
        }
        sound.play(); // 새 소리 재생

        // 소리 재생 시간 또는 기본 지연 시간 후 페이지 이동
        setTimeout(function() {
            window.location.href = 'portfolio.jsp'; // 소리 재생 후 페이지 이동
        }, (sound.duration || defaultDelay) * 1000);
    } else {
        // 소리가 꺼져있을 때 기본 지연 시간 후 페이지 이동
        setTimeout(function() {
            window.location.href = 'portfolio.jsp';
        }, defaultDelay * 1000);
    }
}