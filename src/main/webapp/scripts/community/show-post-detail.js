document.addEventListener("DOMContentLoaded", () => {
    // 모든 카드 요소를 가져옴
    const cards = document.querySelectorAll(".card");
    const detailFrame = document.getElementById("post_detail_frame");

    // 카드 클릭 이벤트 설정
    cards.forEach(card => {
        card.addEventListener("click", () => {
            // 데이터 가져오기
            const title = card.getAttribute("data-title");
            const text = card.getAttribute("data-text");
            const language = card.getAttribute("data-language");
            const noticeboard = card.getAttribute("data-noticeboard");

            // 상세보기 프레임에 데이터 삽입
            document.getElementById("post_detail_title").textContent = title;
            document.getElementById("post_detail_text").textContent = text;
            document.getElementById("post_detail_language").textContent = `${language}`;
            document.getElementById("post_detail_noticeboard").textContent = noticeboard;

            // 상세보기 프레임 보이기
            detailFrame.style.display = "flex";
        });
    });

    // "나가기" 버튼 클릭 시 상세보기 프레임 숨기기
    document.getElementById("exit").addEventListener("click", () => {
        detailFrame.style.display = "none";
    });
});