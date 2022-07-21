<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>DOVIS CHAT TEST</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.ChatWrapper {
	width: 100%;
	height: 100%;
}

#Chatting {
	
	width: 60%;
	height: 400px;
	background-color: #A9F5F2;
}
.content {
	width: 100%;
	height: 5%;
}
.my{
	text-align : right;
}
.others{
	text-align : left;
}
</style>

</head>
<body>

	<div class="container">
		<h2>DOVIS CHAT</h2>
		<div class="panel panel-default">
		
			<!-- 채팅 창-->
			<div class="panel-heading">채팅</div>
			<div class="panel-body" align="center">
				<div class="ChatWrapper">
					<div id="Chatting">
					
					
					</div>
					<br>
					<div style="width : 50%;">
						<div class="form-group">
							<label class="control-label col-sm-2" for="talker">사용자:</label>
							<div class="col-sm-8">
								<span> ${loginVO.mem_id} </span>
								<input type="hidden" class="form-control" id="talker"
									value ="${loginVO.mem_id}" name="talker">
								<input type="hidden" class="form-control" id="talker_n"
									value ="${loginVO.mem_name}" name="talker_n">
								<input type="hidden" class="form-control" id="talker_info"
									value ="${loginVO.mem_name} ${loginVO.mem_dept} ${loginVO.mem_position}" name="talker_info">			
								<%-- <input type="text" class="form-control" id="talker"
									value ="${loginVO.mem_id}" name="talker"> --%>
							</div>
							<!-- <button id="eCheck" class="btn btn-success col-sm-2">이름확인</button> -->
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-2" for="talk">Content:</label>
							<div class="col-sm-10">
								<textarea  rows="5" class="form-control" id="talk"
									name="talk" onkeyup="enterkey()"> </textarea>
							</div>
						</div>
						<div class="form-group">
							<button class="btn btn-info" id="sendMsg">전송</button>						
						</div>
					</div>

				</div>

			</div>
			<div class="panel-footer">DOVIS</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
		// 웹소켓
	    let websocket;
		let chat = $('#Chatting');
		let talker;
		
		let talker_info = $('#talker_info').val();
		
		let talker_n = $('#talker_n').val();
		// console.log("메제시 함수 화자 이름: "+talker_n)
		
		// 페이지가 로드 되면 websocket과 연결
		$(document).ready( connect )
		$('#sendMsg').on('click', function(){			
			sendMessage();
			console.log("메세지 전송");						
		});
		
		
		
		// 아래 이메일 확인은 로그인 세션 가져올 거라 필요없음
		// 이메일을 확정해야 사용할 수 있게 설정
		/* $('#eCheck').on("click", emailCheck)
		
		function emailCheck(){
			
			talker = $('#talker').val();
			console.log(talker)
			
			if(talker.length != ''){
				$('#talker').attr('readonly', 'readonly');
				$('#sendMsg').removeAttr('disabled');
			}
			
			
		} */
	
	    //입장 버튼을 눌렀을 때 호출되는 함수
	    function connect() {
	        // 웹소켓 주소
	        var wsUri = "ws://localhost:8084/web8/echo.do";
	        // 소켓 객체 생성
	        websocket = new WebSocket(wsUri);
	        //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
	        websocket.onopen = onOpen;
	        websocket.onmessage = onMessage;
	        websocket.onclose = function(evt){
	        	console.log(evt);
	        	console.log("세션종료")
	        }
	        console.log('연결완료');
	        console.log(websocket)
		}
	    
	    //웹 소켓에 연결되었을 때 호출될 함수
	    function onOpen() {
	    	console.log("웹소켓이 열렸습니다~");
	    	// chat.append(talker_n + "님이 입장하셨습니다.");
	    }
	    
	   // * 1 메시지 전송
	   function sendMessage(){
		   
		   	talker = $('#talker').val();
		   	talker_info = $('#talker_info').val();
			console.log("메제시 함수 화자: "+talker)
			console.log("메제시 함수 화자 이름: "+talker_n)
			console.log("메제시 함수 화자 정보: "+talker_info)
		   
		   // email과 content를 가져오기!
	  		const data = {
                "talker" : talker,
                "talk" : talker_n + ':' + $('#talk').val()
            };
              
            // JSON.stringify() : json 문자열로 변환함 
            let jsonData = JSON.stringify(data);
		   
		   websocket.send(jsonData);
		   console.log("메세지 보내기");
		   
		   // 대화창 비우기
		   $('#talk').val(""); 
		   
		   
	   }
	   
	   // 엔터로 채팅 전송
	   function enterkey() {
	        if (window.event.keyCode == 13) {
	        	sendMessage();
	        }
	    }
	   
	   
	    // * 2 메세지 수신
	    function onMessage(evt) {
	    	if(evt.data.includes("join this socket")){
	    		// 단순히 채팅방에 연결된 경우
	    		chat.append( $('#talker_n').val() + " 님 환영합니다.")
	    	}else{
	    		let bt = document.createElement('button');
	    		let pf = document.createElement('button');
	    		let smsg = document.createElement('span');
	    		let pid = document.createElement('input');
	    		let brr = document.createElement('br');
	    		// Div 생성하고, 글자 집어넣기~
	    		let textDiv = document.createElement('div');
	    		// 메세지만
	    		let newText = document.createTextNode( evt.data.split(":")[2].trim());
	    		// 이름만
	    		let pfc = document.createTextNode( evt.data.split(":")[0,1].trim());
	    		// 아이디만
	    		let oid = document.createTextNode( evt.data.split(":")[0].trim());
	    		textDiv.appendChild(pf);
	    		textDiv.appendChild(brr);
	    		pf.appendChild(pfc);
	    		pid.type = "hidden";
	    		pid.value = evt.data.split(":")[0].trim();
	    		//textDiv.appendChild(newText);
	    		smsg.appendChild(newText);
	    		textDiv.appendChild(smsg);
	    		textDiv.appendChild(pid);
	    		textDiv.appendChild(bt);
	    		bt.className += 'inTalk';
	    		pf.className += 'profile';
	    		//pf.className += 'profile_' +evt.data.split(" : ")[0];
	    		//pf.value(evt.data.split(" : ")[0]);
	    		smsg.className += 'talk_txt';
	    		pid.className += 'cid';
	    		textDiv.className += 'talk';
	    		console.log("evt.data 스플릿전 확인용: " + evt.data);
	    		//putpfc(evt);
 		
	    		// 사용자 구분해서 좌우 정렬
	    		if(evt.data.split(" : ")[0] == talker){
	    			textDiv.className += ' my';
	    		}else{
	    			textDiv.className += ' others';
	    		}
	    		
	    		// div화면에 추가하기
	    		chat.append(
	    				textDiv
	    		);
	    		
	    	}
	   }
	    
	    // div 바로 클릭 테스트
/* 	    window.onload = function(){
	    	let tl = document.getElementsByClassName("talk my");
	    	tl.onclick = inputlog();
	    }
	    
	    function inputlog() {
	    	console.log('되는지 확인');
	    } */
	   // 프로필 클릭 테스트
	   function putpfc(evt){
	    let pfs = document.getElementsByClassName('profile_' +evt.data.split(" : ")[0]);
   	   	   pfs.onclick = pfc;
		   
	   } 
	   	   
	   function pfc(){
	    	console.log('프로필클릭확인');
	    }
	    
	   // 특정 채팅 로그 클릭해서 디비로 보내기
	   $(document).on("click", ".inTalk", function(){ 
        	
        	console.log($(this).parent().text());
        	console.log("접속자: "+talker);
        	console.log("접속자 이름: "+talker_n)
        	console.log("채팅: "+ $(this).parent().text());
        	console.log("채팅 화자: "+ $(this).siblings("button").text());
        	console.log("채팅 내용: "+ $(this).siblings(".talk_txt").text());
        	//console.log("채팅 화자: "+ $(this).parent().text().split("  ")[0]);
        	//console.log("채팅 내용: "+ $(this).parent().text().split("  ")[1]);
        	
        	$.ajax({
        		data: {talker: talker, talk : $(this).siblings(".talk_txt").text()},
        		url: "insertChatLog.do",
        		type: "post",
    			//dataType : "text",
    			context : this, 
    			success: function(res){
    				console.log("등록한 채팅 로그: "+$(this).siblings(".talk_txt").text());
    				alert("등록했습니다.");
    				
    			},
    			error: function(e){
    				alert("통신실패!");
    			} 
    		})
        	
        	
        });
	   
	   // 클릭해서 프로필 조회 sibiling input cid
	   $(document).on("click", ".profile", function(){ 
		    console.log("채팅 화자 아이디: "+ $(this).siblings("input").val());
		    // 아이디를 보내서 정보 조회
		    $.ajax({
        		data: {mem_id: $(this).siblings("input").val()},
        		url: "check.do",
        		type: "post",
    			//dataType : "text",
    			context : this, 
    			success: function(res){
    				//console.log("조회 멤버 ID: "+$(this).siblings("input").val());
    				console.log("조회: "+ res[0].mem_name);
    				//console.log(${checkP.mem_name} + ${checkP.mem_dept} + ${checkP.mem_position});
    				alert(res[0].mem_name +" " + res[0].mem_dept + " 부서 " + res[0].mem_position);
    				
    			},
    			error: function(e){
    				alert("통신실패!");
    			} 
    		}) 
		    
        	/* console.log($(this).parent().text());
        	console.log("접속자: "+talker);
        	console.log("접속자 이름: "+talker_n)
        	console.log("채팅: "+ $(this).parent().text());
        	console.log("채팅 화자 아이디: "+ $(this).siblings("input").val());
        	console.log("채팅 내용: "+ $(this).siblings(".talk_txt").text()); */
        	//console.log("채팅 화자: "+ $(this).parent().text().split("  ")[0]);
        	//console.log("채팅 내용: "+ $(this).parent().text().split("  ")[1]);
        	
        	/* $.ajax({
        		data: {talker: talker, talk : $(this).siblings(".talk_txt").text()},
        		url: "insertChatLog.do",
        		type: "post",
    			//dataType : "text",
    			context : this, 
    			success: function(res){
    				console.log("등록한 채팅 로그: "+$(this).siblings(".talk_txt").text());
    				alert("등록했습니다.");
    				
    			},
    			error: function(e){
    				alert("통신실패!");
    			} 
    		}) */
        	
        	
        });
	    
		//	     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	    /* window.setInterval(function() {
	        let elem = document.getElementById('Chatting');
	        elem.scrollTop = elem.scrollHeight;
	    }, 0);
	    */
	
	</script>

</body>
</html>
