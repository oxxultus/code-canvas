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
            const link = card.getAttribute("data-link");

            // 상세보기 프레임에 데이터 삽입
            document.getElementById("post_detail_title").textContent = title;
            document.getElementById("post_detail_text").textContent = text;
            document.getElementById("post_detail_noticeboard").onclick = function() {
                window.open(link, '_blank');  // 새 탭에서 링크 열기
            };

            // 상세보기 프레임 보이기
            detailFrame.style.display = "flex";

            // competitions_count 증가 요청
            const competitionsTitle = title;  // 카드의 title을 사용

            fetch("/increaseCompetitionsCount", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    competitionsTitle: competitionsTitle  // 해당 자격증의 title 전달
                })
            })
                .then(response => response.json())
                .then(data => {
                    console.log('Competitions count updated:', data);
                    // 필요 시 업데이트된 데이터를 UI에 반영
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        });
    });

    // "나가기" 버튼 클릭 시 상세보기 프레임 숨기기
    document.getElementById("exit").addEventListener("click", () => {
        detailFrame.style.display = "none";
    });
});
