// // auth-check.js
//
// // 이벤트 핸들러의 중복 등록 확인을 위한 코드
// function checkAuthStatus() {
//   const authCheckExecuted = document.body.dataset.authCheckExecuted;
//   if (authCheckExecuted) return;
//
//   document.body.dataset.authCheckExecuted = "true";
//
//   fetch('/api/user/current', {
//     method: 'GET',
//     credentials: 'include', // 쿠키를 함께 전송하도록 설정
//     headers: {
//       'Content-Type': 'application/json'
//     }
//   })
//       .then(async response => {
//         if (response.ok) {
//           const data = await response.json();
//           // 로그인 상태일 때 UI 업데이트
//           updateUIForLoggedInUser(data);
//         } else {
//           // 로그인하지 않은 상태일 때 UI 업데이트
//           updateUIForLoggedOutUser();
//         }
//       })
//       .catch(error => {
//         console.error('인증 확인 중 오류 발생:', error);
//         handleAuthError();
//       });
// }
//
// // 로그인 상태일 때 UI 업데이트
// function updateUIForLoggedInUser(userData) {
//   const logoutButton = document.getElementById("logout-button");
//   const userInfo = document.getElementById("user-info");
//
//   if (logoutButton) logoutButton.style.display = "inline-block";
//   if (userInfo) userInfo.textContent = `${userData.name}님 환영합니다!`;
//
//   // 추가적인 UI 업데이트가 필요한 경우 여기에 구현
// }
//
// // 로그인하지 않은 상태일 때 UI 업데이트
// function updateUIForLoggedOutUser() {
//   const logoutButton = document.getElementById("logout-button");
//   const userInfo = document.getElementById("user-info");
//
//   if (logoutButton) logoutButton.style.display = "none";
//   if (userInfo) userInfo.textContent = "";
//
//   // 선택적: 로그인 권장 메시지 표시
//   showLoginRecommendation();
// }
//
// // 로그인 권장 메시지 표시
// function showLoginRecommendation() {
//   const message = "로그인을 진행하시면 여러가지 기능을 사용할 수 있습니다.";
//   // Toast 메시지나 모달을 사용하는 것을 권장합니다.
//   // alert() 대신 더 나은 UX를 제공하는 방법을 사용하세요.
//   showNotification(message);
// }
//
// // 알림 표시 함수 (Toast 메시지 예시)
// function showNotification(message) {
//   // Toast 메시지를 사용하는 경우
//   if (window.Toastify) {
//     Toastify({
//       text: message,
//       duration: 3000,
//       gravity: "top",
//       position: "center",
//     }).showToast();
//   } else {
//     // Fallback으로 alert 사용
//     alert(message);
//   }
// }
//
// // 인증 오류 처리
// function handleAuthError() {
//   console.error('인증 처리 중 오류가 발생했습니다.');
//   // 선택적: 에러 페이지로 리다이렉트 또는 에러 메시지 표시
//   window.location.href = '/error.html';
// }
//
// // 로그아웃 처리 함수
// // function logout() {
// //   fetch('/api/logout', {
// //     method: 'POST',
// //     credentials: 'include',
// //     headers: {
// //       'Content-Type': 'application/json'
// //     }
// //   })
// //       .then(response => {
// //         if (response.ok) {
// //           // 로그아웃 성공 시 처리
// //           window.location.href = '/index.html';
// //         } else {
// //           throw new Error('로그아웃 처리 중 오류가 발생했습니다.');
// //         }
// //       })
// //       .catch(error => {
// //         console.error('로그아웃 오류:', error);
// //         showNotification('로그아웃 처리 중 오류가 발생했습니다.');
// //       });
// // }
// //
// // 페이지 로드 시 인증 상태 확인
// // window.onload = () => {
// //   checkAuthStatus();
// // };
// //
// // 로그아웃 버튼 이벤트 리스너 등록 (HTML에 버튼이 있는 경우)
// // document.addEventListener('DOMContentLoaded', () => {
// //   const logoutButton = document.getElementById('logout-button');
// //   if (logoutButton) {
// //     logoutButton.addEventListener('click', logout);
// //   }
// // });


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