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
									name="talk"> </textarea>
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
	        var wsUri = "ws://localhost:8083/web6/echo.do";
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
	    }
	    
	   // * 1 메시지 전송
	   function sendMessage(){
		   
		   	talker = $('#talker').val();
			console.log("메제시 함수 화자: "+talker)
		   
		   // email과 content를 가져오기!
	  		const data = {
                "talker" : talker,
                "talk" : talker + ': ' + $('#talk').val()
            };
              
             
            let jsonData = JSON.stringify(data);
		   
		   websocket.send(jsonData);
		   console.log("메세지 보내기");
		   
		   // 대화창 비우기
		   $('#talk').val(""); 
		   
		   
	   }
	   
	    // * 2 메세지 수신
	    function onMessage(evt) {
	    	if(evt.data.includes("join this socket")){
	    		// 단순히 채팅방에 연결된 경우
	    		chat.append( $('#talker').val() + "님 환영합니다.")
	    	}else{
	    		let bt = document.createElement('button');
	    		// Div 생성하고, 글자 집어넣기~
	    		let textDiv = document.createElement('div');
	    		let newText = document.createTextNode( evt.data.split(" : ")[1]);
	    		textDiv.appendChild(newText);
	    		textDiv.appendChild(bt);
	    		bt.className += 'inTalk';
	    		textDiv.className += 'talk';
	    		
	    			    		
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
	    
	   // 특정 채팅 로그 클릭해서 디비로 보내기
	   $(document).on("click", ".inTalk", function(){ 
        	
        	console.log($(this).parent().text());
        	console.log("접속자: "+talker);
        	console.log("채팅 화자: "+ $(this).parent().text().split(": ")[0]);
        	console.log("채팅 내용: "+ $(this).parent().text().split(": ")[1]);
        	
        	$.ajax({
        		data: {talker: talker, talk : $(this).parent().text().split(": ")[1]},
        		url: "insertChatLog.do",
        		type: "post",
    			//dataType : "text",
    			context : this, 
    			success: function(res){
    				console.log("등록한 채팅 로그: "+$(this).parent().text());
    				alert("등록했습니다.");
    				
    			},
    			error: function(e){
    				alert("통신실패!");
    			} 
    		})
        	
        	
        });
	   
	
	</script>

</body>
</html>
