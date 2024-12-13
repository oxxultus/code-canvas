// DOMContentLoaded 이벤트: 문서의 모든 콘텐츠가 로드되었을 때 실행
document.addEventListener("DOMContentLoaded", () => {
    // 눈송이를 담을 컨테이너 요소를 선택
    const snowContainer = document.querySelector('.snow-container');

    // 눈송이 개수 설정
    const snowflakeCount = 50;

    // 설정한 개수만큼 눈송이 생성
    for (let i = 0; i < snowflakeCount; i++) {
        // 눈송이 역할을 할 div 요소 생성
        const snowflake = document.createElement('div');
        // 눈송이에 클래스 추가 (스타일링에 사용)
        snowflake.classList.add('snowflake');

        // 눈송이의 랜덤한 위치와 애니메이션 속성 설정
        const randomLeft = Math.random() * 100; // 화면 가로축(0% ~ 100%) 랜덤 위치
        const randomDuration = Math.random() * 5 + 5; // 애니메이션 지속시간(5초 ~ 10초)
        const randomDelay = Math.random() * 5; // 애니메이션 시작 지연 시간(0초 ~ 5초)

        // 스타일 속성으로 눈송이의 위치와 애니메이션 설정
        snowflake.style.left = `${randomLeft}%`;
        snowflake.style.animationDuration = `${randomDuration}s`;
        snowflake.style.animationDelay = `${randomDelay}s`;

        // 생성된 눈송이를 컨테이너에 추가
        snowContainer.appendChild(snowflake);
    }
});
