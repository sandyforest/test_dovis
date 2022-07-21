<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/start.css">
</head>
<body>
    <div class="header"></div>
    
    <div class="main">
        <div class="container">
            <div class="login_header">
                <h1>login</h1>
            </div>
            <div class="login_main">
            <c:if test="${empty loginVO}">
                <form action="selectMember.do" method="post">
                    <table class="login_table">
                        <tr>
                            <td>
                                <span>
                                    <ion-icon name="person-outline"></ion-icon>
                                    <input type="text" placeholder="id" name="mem_id">
                                </span><br>
                            </td>
                            <td rowspan="2">
                                <button class="login" type="submit">login</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>
                                    <ion-icon name="lock-closed-outline"></ion-icon>
                                    <input type="password" placeholder="password" name="mem_pw">
                                </span><br>
                            </td>
                        </tr>
                    </table>
                </form>
              </c:if>
              
              
              <div class="login_btn">
                    <!-- 네이버아이디로로그인 버튼 노출 영역 -->
                    <div id="naverIdLogin"></div>
                    <!-- //네이버아이디로로그인 버튼 노출 영역 -->
                    <div class="modal">
                        <div class="modal_body">
                            <p>
                            <h2 style="font-weight: bold;">회원가입</h2>
                            </p>
                            <section id="join-section">
                                <form>
                                    <div class="join2">
                                        <p>아이디</p>
                                        <input type="text" name="user_ID" placeholder="아이디 입력">
                                        <p>비밀번호</p>
                                        <input type="password" name="user_PW1" value="" placeholder="비밀번호 입력">
                                        <p>비밀번호 재확인</p>
                                        <input type="password" name="user_PW2" value="" placeholder="비밀번호 입력">
                                    </div>
                                    <div class="join1">
                                        <p>이름</p>
                                        <input type="text" name="user_name" value="" placeholder="이름 입력">
                                        <p>부서</p>
                                        <input type="text" name="user_name" value="" placeholder="부서 입력">
                                        <p>직급</p>
                                        <input type="text" name="user_name" value="" placeholder="직급 입력">
                                        <br>
                                    </div>
                                    <button type="submit" value="제출" class="j-submit">제출</button>
                                </form>
                            </section>
                        </div>
                    </div>
                    <button class="join">join</button>
                </div>
              
              
            </div>
        </div>
    </div>
    <div class="footer"></div>
    
    <!-- join 모달 -->
        <script>
        const body = document.querySelector('body');
        const modal = document.querySelector('.modal');
        const join = document.querySelector('.join');
  
        join.addEventListener('click', funtion(){
          modal.classList.toggle('show');
  
          if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
          }
        });
  
        modal.addEventListener('click', (event) => {
          if (event.target === modal) {
            modal.classList.toggle('show');
  
            if (!modal.classList.contains('show')) {
              body.style.overflow = 'auto';
            }
          }
        });
      </script>
      
    <!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "PZpRFvR2PIPOcLfij2tr",
			callbackUrl : "http://localhost:8083/web7/dovis.do", // 로그인 후 보여줄 화면
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : {
				color : "white",
				type : 3,
				height : 60
			}
		/* 로그인 버튼의 타입을 지정 */
		});
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		window.addEventListener('load', function() {
			naverLogin.getLoginStatus(function(status) {
				if (status) {
					var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
					console.log(naverLogin.user);

					if (email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});

		var testPopUp;
		function openPopUp() {
			testPopUp = window
					.open("https://nid.naver.com/nidlogin.logout", "_blank",
							"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp() {
			testPopUp.close();
		}

		function naverLogout() {
			openPopUp();
			setTimeout(function() {
				closePopUp();
			}, 1000);
		}
	</script>
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>