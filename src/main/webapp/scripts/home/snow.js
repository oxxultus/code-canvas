document.addEventListener("DOMContentLoaded", () => {
    const snowContainer = document.querySelector('.snow-container');

    // 눈송이 개수
    const snowflakeCount = 50;

    for (let i = 0; i < snowflakeCount; i++) {
        const snowflake = document.createElement('div');
        snowflake.classList.add('snowflake');

        // 랜덤 위치와 속도
        const randomLeft = Math.random() * 100; // 0% ~ 100% 랜덤
        const randomDuration = Math.random() * 5 + 5; // 5s ~ 10s
        const randomDelay = Math.random() * 5; // 0s ~ 5s

        // 스타일 적용
        snowflake.style.left = `${randomLeft}%`;
        snowflake.style.animationDuration = `${randomDuration}s`;
        snowflake.style.animationDelay = `${randomDelay}s`;

        snowContainer.appendChild(snowflake);
    }
});
