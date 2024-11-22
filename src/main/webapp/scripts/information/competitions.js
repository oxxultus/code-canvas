const competitionsData = {
    "웹 개발": [
        {
            "name": "웹개발 챌린지",
            "link": "https://webchallenge.example.com",
            "image": "https://via.placeholder.com/150"
        },
        {
            "name": "프론트엔드 공모전",
            "link": "https://frontendcontest.example.com",
            "image": "https://via.placeholder.com/150"
        }
    ],
    "모바일 개발": [
        {
            "name": "모바일 앱 공모전",
            "link": "https://mobilecontest.example.com",
            "image": "https://via.placeholder.com/150"
        },
        {
            "name": "앱 UX/UI 챌린지",
            "link": "https://appuxchallenge.example.com",
            "image": "https://via.placeholder.com/150"
        }
    ],
    "인공지능": [
        {
            "name": "AI 융합 공모전",
            "link": "https://linkareer.com/activity/183451",
            "image": "https://via.placeholder.com/150"
        },
        {
            "name": "연말 캠페인 AI 공모전",
            "link": "https://www.allforyoung.com/posts/57475",
            "image": "https://imgur.com/pzOwUw3.png"
        }
    ]
};

// 공모전 데이터 표시
function displayCompetitions() {
    const resultsContainer = document.querySelector('#competition-results');
    resultsContainer.innerHTML = ''; // 기존 결과 초기화

    const category = document.querySelector('#category-select').value;

    if (competitionsData[category]) {
        competitionsData[category].forEach(competition => {
            const competitionItem = document.createElement('div');
            competitionItem.classList.add('competition-item');
            competitionItem.innerHTML = `
                <div class="competition-card">
                    <img src="${competition.image}" alt="${competition.name}" class="competition-image">
                    <div class="competition-info">
                        <a href="${competition.link}" target="_blank" class="competition-name">${competition.name}</a>
                        <p class="competition-date">${competition.date}</p>
                    </div>
                </div>
            `;
            resultsContainer.appendChild(competitionItem);
        });
    } else {
        resultsContainer.innerHTML = `<p>해당 분야의 공모전이 없습니다.</p>`;
    }
}

// 이벤트 리스너 설정
document.getElementById('category-select').addEventListener('change', displayCompetitions);
