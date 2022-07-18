<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 템플릿 저장용 -->
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/modal.css">
<link rel="stylesheet" href="resources/css/home.css">
<script src="https://kit.fontawesome.com/30e8ed642c.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function goL() {
		// boardList 페이지로 이동
		// PathVariable을 사용 중인 페이지에서는 /ContextPath/를 붙이자
		// / == http://localhost:8083/
		location.href = 'selectMember.do';

	}
</script>

</head>
<body>
	<header>
		<!-- nav 태그 스따뚜 -->
		<nav class="nav_bar">
			<!-- nav 전체 -->
			<div class="nav_logo">
				<!-- nav 좌측 -->
				<a href="main.html"><i class="fa-solid fa-heart"></i> DOVIS</a>
			</div>
			<ul class="nav_menu">
				<!-- nav 중앙 -->
				<li><a href="#">home</a></li>
				<li><a href="#">schedule</a></li>
				<li><a href="#">calendar</a></li>
				<li><a href="#">chatting</a></li>
			</ul>
			<ul class="nav_icon">
				<!-- nav 우측 -->
				<li><a href="#"><i class="fa-solid fa-user"></i></a></li>
				<!-- 회원가입 -->
				<!--<li><i class="fa-solid fa-user-check"></i></li>로그인 -->
				<li><a href="#"><i class="fa-solid fa-user-gear"></i></a></li>
				<!-- 마이페이지 -->
			</ul>
			<a href="#" class="nav_toggle"> <i class="fa-solid fa-bars"></i>
			</a>
		</nav>
	</header>
	<main>
		<!-- 일정 공지 화면 -->
		<div class="modal">
			<div class="modal_body">
				<h3>To Do List</h3>
				<table class="modal_con">
					<tr>
						<td class="time">12:00</td>
						<td class="content"><i class="fa-regular fa-square"
							id="check_box"></i> **팀 김부장놈과 점심약속</td>
						<td class="edit">
							<button class="update_btn">수정</button>
							<button class="delete_btn">삭제</button>
						</td>
					</tr>
					<tr></tr>
				</table>
			</div>
		</div>
		<button class="modal_btn" id="check-btn">check</button>

		<!-- 테스트용 로그인 -->
		<div class="test_login">
		<c:if test="${empty loginVO}">
			<form action="selectMember.do" method="post">
				<table style="width:30%" align="center">
					<thead>
						<tr>
							<td>ID :</td>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<td>PW :</td>
							<td><input type="password" name="pw"></td>
						</tr>


						<tr>
							<td></td>
							<td align="right">
								<button type="submit">로그인</button>
							</td>
						</tr>
					</thead>

					<!-- 테스트용 멤버 조회 -->
					<tbody id="tbody_member">

					</tbody>

				</table>
			</form>
			</c:if>
			<c:if test="${!empty loginVO}">
			<div>			
				<label for="">${loginVO.nick}님 환영합니다</label>
				<button onclick="logout()">로그아웃</button>
			
			</div>
			</c:if>


		</div>




	</main>
	<footer>
		<div class="footer_con">스마트인재개발원 | 빅데이터 분석서비스 개발자과정 B</div>
	</footer>
	<script>
		$('#check_box').on("click", function() {
			$(this).removeClass()
			$(this).addClass("fa-solid fa-square-check")
		})
	</script>
	<script src="resources/js/modal.js"></script>
	<script src="resources/js/main.js"></script>

	<script src="resources/js/member.js"></script>

</body>
</html>