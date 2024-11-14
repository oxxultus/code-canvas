const leftBigButton = document.getElementById('left-big-button');

// 버튼 클릭 시 상태 토글
leftBigButton.addEventListener('click', function() {
    if (this.classList.contains('active')) {
        // 이미 활성화된 상태에서 클릭 시 상태를 해제
        this.classList.remove('active');
    } else {
        // 클릭 시 active 클래스를 추가
        this.classList.add('active');
    }
});