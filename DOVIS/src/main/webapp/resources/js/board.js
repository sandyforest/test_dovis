$(document).ready(() => {

	//ajax통신, 글 데이터가져오기
	$.ajax({
		url: 'boardList.do', // 어디로 요청보낼것인가 
		type: 'post',// GET? POST?
		data: {
			//'key(name)' :value -> 보내줄 데이터       
		},
		//dataType: 'json',//응답받는 데이터가 어떤 형태인지
		success: function (res) {
			//요청 성공했을때 실행되는 call back 함수
			//res --> 응답받는 데이터가 더 담기는 변수
			console.log(res[2].writer);


			//table에 출력
			//출력 대상 선택

			// <td>`+ res[i].idx +`</td>
			// `` 백틱 내에서 ${변수} 문자열 사이에 변수를 집어넣는 게 가능
			// 하지만 jsp의 el과 문법이 겹쳐서, jsp 안에서는 사용 불가능
			// html에서 쓰는 jsp : thymeleaf

			//$('선택자').html('코드') : 안에 있는 코드 덮어쓰기
			//$('선택자').after('코드') : 태그 바로 뒤에(다음줄) 코드추가
			//$('선택자').before('코드'): 태그 바로 앞에(이전줄) 코드추가
			//$('선택자').append('코드'): 선택한 태그 안에 코드 누적 
			$('#tbody').html('');
			for (let i = 0; i < res.length; i++) {
				tr = `
		                  <tr>
						   <td>`+ res[i].idx + `</td>
		                   <td><a href="javascript:onoff(${res[i].idx});">${res[i].title}</a></td>
		                   <td>${res[i].writer}</td>
		                   <td>${res[i].indate.split(" ")[0]}</td>
		                   <td id = "count${res[i].idx}">${res[i].count}</td>		                 
		                  </tr>
		                  
		                  <tr id="board${res[i].idx}" style="display:none;">
		                  	<td colspan = "5">
		                  		<textarea rows="5" class="form-control">${res[i].content}</textarea>  
		                  	</td>
		                  </tr>                 
		                  `;

				$('#tbody').append(tr);
			}
		},
		error: function (e) {
			//404,405,500 -> 요청 자체가 실패
			//e ---> 어떤 에러인지 담기는 변수
			alert('error');
		}
	});

})



//(x)=> == function(x)
// 페이지가 열릴때, 실행
// $(document).ready( function(){})

// ===ajax===

// 조회수 업데이트 하기
//function open(idx){
// #board7
// $('선택자').css('스타일 이름') : 해당하는 스타일 값을 리턴
// $('#board'+idx).css('display') => none 리턴
// $('선택자').css('스타일 이름', '바꿔줄 값') : css 옵션 수정 시켜주는 함수
// $('#board' + idx).css('display') -> none
//$('#board'+idx).css('display','table-row');

//}

// 게시판 내용 열기-닫기
function onoff(idx) {

	// 조회수 업데이트
	// 태그 안에 있는 값을 가져올 때 쓰이는 함수
	// .html() : 매개변수 없어야 함(있으면 오버라이팅;덮어쓰기) & 닫는 태그가 있는 경우 사용
	// .val() : 닫는 태그 없는 경우 사용
	let count = Number($('#count' + idx).html());


	// #board7
	// $('선택자').css('스타일 이름') : 해당하는 스타일 값을 리턴
	// $('선택자').css('스타일 이름', '바꿔줄 값') :  CSS옵션을 수정 시켜주는 함수
	if ($('#board' + idx).css('display') == 'none') {
		$('#board' + idx).css('display', 'table-row');

		// 조회수 업데이트
		$.ajax({
			url: 'viewUpdate.do',
			type: 'post',
			data: {
				'idx': idx,
				'count': count + 1
			},
			success: function (res) {
				// 기존에 있던 조회수를 바꿔줘야 함
				$('#count' + idx).html(count + 1)
			},
			error: function (request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});


	} else if ($('#board' + idx).css('display') == 'table-row') {
		$('#board' + idx).css('display', 'none');
	}
}

	// .text()
	// .html() : 닫는태그가 있는 경우 사용
	// .val() : 닫는태그가 없는 경우 사용
/* function onoff(idx){
	  let count = Number($('#count'+idx).html());
  	
	  $.ajax({
		  url : 'viewUpdate.do',
		  type : 'post',
		  data : {
		   'idx' : idx,
		   'count' : count + 1
		  },
		  success : function(res){					
		   if($('#board'+idx).css('display') == 'none'){				 
			  $('#board'+idx).css('display','table-row')
			  $('#count'+idx).html( count + 1 )}
		   else if($('#board'+idx).css('display') != 'none'){
			  $('#board'+idx).css('display','none')}
		  },
		  error : function(e){ 
		   alert('error!') }
	   });								
 } */

