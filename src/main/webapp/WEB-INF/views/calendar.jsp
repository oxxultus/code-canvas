<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>11월 달력</title>
  <style>
    #body {
      display: flex;
      align-items: center;
      background: rgb(28, 28, 37) /* 배경 색상 */
      radial-gradient(rgb(40, 40, 48) 20%, transparent 1%); /* 점 패턴 */
      background-size: 13px 13px;
      position: relative;
      justify-content: center; /* 가로 중앙 정렬 */
      overflow: hidden;
      width: 100vw; /* 전체 화면 너비 */
      height: 100vh; /* 전체 화면 높이 */
    }
    #tool {
      border: 2px solid rgba(94, 120, 228, 0.2);
      position: relative;
      background: rgba(100, 106, 198, 0.1);
      border-radius: 10px;
      padding: 20px;
      width: 900px;
      height: 600px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
    }
    #tool:hover {
      transform: translateY(-15px);
      transition: transform 1s ease-in-out;
    }
    #title {
      text-align: center;
      margin: 20px;
      font-size: 1.5em;
      color: white;
    }
    #buttonContainer {
      display: flex;
      justify-content: center;
      gap: 10px;
      margin-top: 10px;
    }
    #buttonNext,
    #buttonPrev {
      padding: 10px 20px;
      border-radius: 5px;
      background-color: rgb(105, 167, 218);
      border: none;
      color: white;
      cursor: pointer;
    }
    #buttonNext:hover,
    #buttonPrev:hover {
      background-color: rgba(69, 160, 73, 0.32);
      transition: all 0.3s ease-in-out;
    }
    #calendar {
      margin-top: 20px;
      width: 80%;
      text-align: center;
      background: rgba(100, 106, 198, 0.21);
      padding: 10px;
      border-radius: 5px;
      color: white;
    }
    #calendar th {
      background: rgba(50, 50, 50, 0.8);
      color: white;
      padding: 5px;
    }
    #calendar td {
      padding: 10px;
      background: rgba(255, 255, 255, 0.1);
      color: white;
    }
    #calendar td:hover {
      background: rgba(255, 255, 255, 0.3);
    }
    #buttonSubmit {
      position: absolute;
      bottom: 20px;
      right: 20px;
      padding: 10px 20px;
      border-radius: 5px;
      background-color: rgb(105, 167, 218);
      border: none;
      color: white;
      cursor: pointer;
    }
    #buttonSubmit:hover {
      background-color: rgba(69, 160, 73, 0.29);
      transition: all 0.3s ease-in-out;
    }
    #footer {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      text-align: center;
      background-color: rgba(0, 0, 0, 0.17);
      color: white;
    }
  </style>
</head>
<body id="body">
<form action="trash" method="post">
  <div id="tool">
      <span id="title">
        <span id="year">2024</span>년
        <span id="month">11</span>월
      </span>
    <div id="buttonContainer">
      <button id="buttonPrev" type="button">Prev</button>
      <button id="buttonNext" type="button">Next</button>
    </div>
    <hr>
    <table id="calendar" border="1">
      <thead>
      <tr>
        <th>일</th>
        <th>월</th>
        <th>화</th>
        <th>수</th>
        <th>목</th>
        <th>금</th>
        <th>토</th>
      </tr>
      </thead>
      <tbody id="calendar-body">
      </tbody>
    </table>
    <button id="buttonSubmit" type="submit">Save</button>
  </div>
</form>
<script>
  let currentDate = "2024-11-01";
  const scheduleData = JSON.parse(localStorage.getItem("calendarSchedules")) || {};

  function prevMonth(date) {
    const target = new Date(date);
    target.setDate(1);
    target.setMonth(target.getMonth() - 1);
    return getYmd(target);
  }

  function nextMonth(date) {
    const target = new Date(date);
    target.setDate(1);
    target.setMonth(target.getMonth() + 1);
    return getYmd(target);
  }

  function getYmd(target) {
    const month = ('0' + (target.getMonth() + 1)).slice(-2);
    return [target.getFullYear(), month, '01'].join('-');
  }

  function renderCalendar(date) {
    const target = new Date(date);
    const year = target.getFullYear();
    const month = target.getMonth();
    const firstWeekDay = new Date(year, month, 1).getDay();
    const thisDays = new Date(year, month + 1, 0).getDate();

    const tbody = document.getElementById("calendar-body");
    tbody.innerHTML = "";

    let row = document.createElement("tr");
    for (let i = 0; i < firstWeekDay; i++) {
      row.appendChild(document.createElement("td"));
    }

    for (let i = 1; i <= thisDays; i++) {
      const cell = document.createElement("td");
      cell.textContent = i;

      // 일정을 보여주기 위해 날짜 키 생성
      const dateKey = `${year}-${('0' + (month + 1)).slice(-2)}-${('0' + i).slice(-2)}`;

      // 일정이 존재하면 표시
      if (scheduleData[dateKey]) {
        const scheduleSpan = document.createElement("span");
        scheduleSpan.textContent = scheduleData[dateKey];
        scheduleSpan.style.color = "fuchsia";
        scheduleSpan.style.display = "block";
        scheduleSpan.style.fontSize = "0.8em";
        cell.appendChild(scheduleSpan);
      }

      // 셀 클릭 이벤트
      cell.addEventListener("click", () => {
        const schedule = prompt(`일정을 입력하세요 (${dateKey})`, scheduleData[dateKey] || "");
        if (schedule !== null) {
          scheduleData[dateKey] = schedule; // 일정 저장
          renderCalendar(currentDate); // 다시 렌더링
        }
      });

      if ((firstWeekDay + i - 1) % 7 === 0) {
        tbody.appendChild(row);
        row = document.createElement("tr");
      }
      row.appendChild(cell);
    }

    tbody.appendChild(row);
    document.getElementById("year").textContent = year;
    document.getElementById("month").textContent = month + 1;
  }

  document.getElementById("buttonPrev").addEventListener("click", () => {
    currentDate = prevMonth(currentDate);
    renderCalendar(currentDate);
  });

  document.getElementById("buttonNext").addEventListener("click", () => {
    currentDate = nextMonth(currentDate);
    renderCalendar(currentDate);
  });

  // Save 버튼 이벤트
  document.getElementById("buttonSubmit").addEventListener("click", (event) => {
    event.preventDefault(); // 폼 기본 동작 방지
    localStorage.setItem("calendarSchedules", JSON.stringify(scheduleData)); // 일정 저장
    alert("일정이 저장되었습니다!");
  });

  renderCalendar(currentDate);
</script>

<footer id="footer">
  <p> CodeCanvas © 2024 - ALL RIGHT RESERVE </p>
</footer>
</body>
</html>
