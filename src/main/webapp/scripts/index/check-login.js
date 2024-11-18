// 이벤트 핸들러의 중복 등록 확인을 위한 코드
function checkAuthStatus() {
  const authCheckExecuted = document.body.dataset.authCheckExecuted;
  if (authCheckExecuted) return;

  document.body.dataset.authCheckExecuted = "true";

  fetch('/api/user/current', {
    method: 'GET',
    credentials: 'include', // 쿠키를 함께 전송하도록 설정
    headers: {
      'Content-Type': 'application/json'
    }
  })
      .then(async response => {
          // alert(response.status); // 테스트코드
        if (response.status === 200) {
          const data = await response.json();
          // alert(JSON.stringify(data, null, 2)); // 테스트코드
          updateUIForLoggedInUser(data);
        } else if (response.status === 401) {
          updateUIForLoggedOutUser();
        }
      })
      .catch(error => {
        console.error('오류 발생:', error);
        alert('오류 발생:', error);
        window.location.href = '/index';
      });
}

function updateUIForLoggedInUser(data) {
  document.getElementById("logout-button").style.display = "inline-block";
  alert(`환영합니다, ${data.name}님!`); // Notification or UI updating code here
}

function updateUIForLoggedOutUser() {
  alert("로그인이 필요합니다."); // Notification or UI updating code here
}

window.onload = () => {
  checkAuthStatus();
};