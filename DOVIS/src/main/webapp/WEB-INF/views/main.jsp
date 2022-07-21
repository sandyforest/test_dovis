<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dovis</title>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/main.css">
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
                <a href="home.do">
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
        <div class="text">정회장님 환영합니다:D</div>
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