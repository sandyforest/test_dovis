<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dovis calendar</title>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.js"></script>
<script src='resources/js/calendar.js'></script>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/calendar.css">
<link rel="stylesheet" href="resources/css/calendar-main.css">
</head>
<body>
<script>
        document.addEventListener('DOMContentLoaded', function () {
          var calendarEl = document.getElementById('calendar');
          var calendar = new FullCalendar.Calendar(calendarEl, {
              slotMinTime:'08:00', // day 시작 시간
              slotMaxTime: '22:00', //  day 끝 시간
              headerToolbar: {
                  left: 'prevYear,prev today next,nextYear',
                  center: 'title',
                  right: 'dayGridMonth,listWeek,timeGridDay'
              },
              views: {
                  listWeek: { buttonText: 'week' }
              },
              initialDate: '2022-07-13',
              navLinks: true, // can click day/week names to navigate views
              selectable: true,
              selectMirror: true,
              select: function (arg) {
                  var title = prompt('내용 입력해주세요 ~ ');
                  if (title) {
                      calendar.addEvent({
                          title: title,
                          start: arg.start,
                          end: arg.end,
                          allDay: arg.allDay
                      })
                  }
                  calendar.unselect()
              },
              eventClick: function (arg) {
                  if (confirm('일정을 삭제하시겠습니까?')) {
                      arg.event.remove()
                  }
              },
              weekNumbers: true,
              editable: true,
              selectable: true,
              dayMaxEvents: true, // allow "more" link when too many events
              events: [
                  {
                      title: '굿', // 일정내용
                      start: '2022-07-27' // 0000-00-00 날짜
                  }
              ]
          });
          calendar.render();
      });
      </script>
</head>
<body>
    <div class="sidebar">
        <div class="logo_content">
            <div class="logo">
                <i class='bx bxs-ghost bx-spin' style='color:#859bfd'></i>
                <div class="logo_name">Dovis</div>
            </div>
            <i class='bx bx-menu' id="btn"></i>
        </div>
        <ul class="nav_list">
            <li>
                <a href="home.html">
                    <i class='bx bx-home-alt-2' ></i>
                    <span class="link_name">home</span>
                </a>
                <span class="tooltip">home</span>
            </li>
            <li>
                <a href="calendar.do">
                    <i class='bx bx-calendar' ></i>
                    <span class="link_name">calendar</span>
                </a>
                <span class="tooltip">calendar</span>
            </li>
            <li>
                <a href="chat.do">
                    <i class='bx bx-chat'></i>
                    <span class="link_name">message</span>
                </a>
                <span class="tooltip">message</span>
            </li>
            <li>
                <a href="setting.do">
                    <i class='bx bx-cog' ></i>
                    <span class="link_name">setting</span>
                </a>
                <span class="tooltip">setting</span>
            </li>
            <li>
                <a href="logout.html">
                    <i class='bx bx-exit'></i>
                    <span class="link_name">logout</span>
                </a>
                <span class="tooltip">logout</span>
            </li>
        </ul>
    </div>
    <div class="home_content">
        <div class="text">
            <div id='calendar'></div>
        </div>
    </div>
    <script>
        let btn = document.querySelector("#btn");        
        let sidebar = document.querySelector(".sidebar");        
        
        btn.onclick = function() {
            sidebar.classList.toggle("active");
        }
    </script>
</body>
</html>