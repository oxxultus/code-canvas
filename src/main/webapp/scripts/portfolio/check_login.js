// 이벤트 핸들러의 중복 등록 확인을 위한 코드
function checkAuthStatus() {
  // 인증 체크가 이미 실행되었는지 확인
  const authCheckExecuted = document.body.dataset.authCheckExecuted;
  if (authCheckExecuted) return;

  // 인증 체크를 실행한 것으로 표시
  document.body.dataset.authCheckExecuted = "true";

  // 보호된 API 엔드포인트 호출
  fetch('/api/auth/protected/portfolio', {
    method: 'GET',
    credentials: 'include' // 쿠키를 함께 전송하도록 설정
  })
    .then(async response => {
      if (response.ok) {
        // 응답이 성공적이면 사용자 데이터를 가져와서 환영 메시지를 표시
        const data = await response.json(); // id 값을 가지고 데이터를 검색하여 찾아서 반환한다.
        alert(`환영합니다, ${data.user.name}님! \n 주소: ${data.user.address} \n email: ${data.user.email}`); // test-code
      } else {
        // 응답이 실패하면 로그인 안내 메시지 표시 후 리디렉션
        alert("로그인을 진행하시면 여러가지 기능을 사용할 수 있습니다.");
        window.location.href = '/index.jsp';
      }
    })
    .catch(error => {
      // 오류가 발생하면 콘솔에 오류를 출력하고 로그인 페이지로 리디렉션
      console.error('오류 발생:', error);
      window.location.href = '/index.jsp';
    });
}

// 페이지가 로드될 때 checkAuthStatus 함수를 호출
window.onload = () => {
  checkAuthStatus();
};