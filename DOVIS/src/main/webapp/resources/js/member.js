$(document).ready(() => {

	//ajax통신, 글 데이터가져오기
	$.ajax({
		url: 'memberList.do', // 어디로 요청보낼것인가 
		type: 'post',// GET? POST?
		data: {
			//'key(name)' :value -> 보내줄 데이터       
		},
		//dataType: 'json',//응답받는 데이터가 어떤 형태인지
		success: function (res) {
			//요청 성공했을때 실행되는 call back 함수
			//res --> 응답받는 데이터가 더 담기는 변수
			console.log(res[0].mem_id);


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
			$('#tbody_member').html('');
			for (let i = 0; i < res.length; i++) {
				tr = `
		                  <tr>
						   <td>`+ res[i].mem_id + `</td>
		                   <td>${res[i].mem_name} ${res[i].mem_dept} ${res[i].mem_position}</td>		                 
		                  </tr>                
		                  `;

				$('#tbody_member').append(tr);
			}
		},
		error: function (e) {
			//404,405,500 -> 요청 자체가 실패
			//e ---> 어떤 에러인지 담기는 변수
			alert('error');
		}
	});

})



function logout() {

	location.href = "logout.do";
}


