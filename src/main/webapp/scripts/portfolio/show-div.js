// 버튼 클릭 시 버튼과 div를 사라지게 하는 기능
document.getElementById("showButton").addEventListener("click", function() {
    const div = document.getElementById("rock-certificate");
    const button = document.getElementById("showButton");

    // 애니메이션을 트리거하는 클래스 추가
    div.classList.add("hidden");
    button.classList.add("hidden");
});