<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Error</title>
  <style>
    body {
      margin: 0;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f8f9fa;
      font-family: Arial, sans-serif;
    }
    #error {
      text-align: center;
    }
    #icon {
      width: 80px;
      height: 80px;
      background-color: #dc3545;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0 auto 1rem;
    }
    #icon span {
      color: #fff;
      font-size: 2.5rem;
      font-weight: bold;
    }
    #title {
      font-size: 3rem;
      color: #dc3545;
      margin-bottom: 1rem;
    }
    #minTitle {
      font-size: 1.5rem;
      color: rgba(108, 117, 125, 0.8);
      line-height: 1.5;
    }
    #line {
      width: 50%;
      border: 1px solid #dee2e6;
      margin: 1rem auto;
    }
    #mainBack {
      margin-top: 1.5rem;
      padding: 0.75rem 1.5rem;
      font-size: 1rem;
      color: #6c757d;
      background-color: #e9ecef;
      border: 1px solid #dee2e6;
      border-radius: 30px;
      cursor: pointer;
      text-decoration: none;
    }
    #mainBack:hover {
      background-color: #dee2e6;
    }
  </style>
</head>
<body>
<div id="error">
  <div id="icon">
    <span>!</span>
  </div>
  <h1 id="title">404 Not Found</h1>
  <hr id="line">
  <h5 id="minTitle">페이지를 찾을 수 없습니다.<br>
    찾으시는 페이지의 경로가 잘못 되었거나,<br>
    주소의 변경 혹은 삭제로 인해 사용하실 수 없습니다.
  </h5>
  <a id="mainBack" href="/home">홈으로 가기</a>
</div>
</body>
</html>
