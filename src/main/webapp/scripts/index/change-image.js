const images = ["../../images/index/chicken.gif", "../../images/index/study.gif", "../../images/index/programmer.gif", "../../images/index/game-1.gif","../../images/index/terminal.gif"];  // 이미지 파일 이름 배열
let currentIndex = 0;

function changeImage() {
    currentIndex = (currentIndex + 1) % images.length;  // 인덱스를 순환
    document.getElementById("display-img").src = images[currentIndex];
}

function reverseChangeImage() {
    currentIndex = (currentIndex - 1 + images.length) % images.length;  // 인덱스를 역순으로 순환
    document.getElementById("display-img").src = images[currentIndex];
}
