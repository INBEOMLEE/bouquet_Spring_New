var joinValidate = {
	// 결과 메시지 출력시 사용하는 Text
	resultCode : {
		// 공통
		empty_val : {
			code : 1,
			desc : '필수 입력 정보입니다.'
		},
		space_length_val : {
			code : 2,
			desc : '공백 없이 입력해주세요.'
		},
		
		// ID
		success_id : {
			code : 0,
			desc : '멋진 아이디네요 :)'
		},
		invalid_id : {
			code : 3,
			desc : '올바른 아이디를 입력해주세요.'
		},
		length_id : {
			code : 4,
			desc : '아이디는 6자 이상 50자 이하로 작성해주세요.'
		},
		overlap_id : {
			code : 5,
			desc : '이미 사용 중인 아이디입니다.'
		},
		
		// PW REPW
		success_pw : {
			code : 0,
			desc : '사용 가능한 비밀번호입니다.'
		},
		invalid_pw : {
			code : 3,
			desc : '올바른 비밀번호를 입력해주세요.'
		},
		other_pw : {
			code : 4,
			desc : '입력하신 비밀번호가 일치하지 않습니다.'
		},
		
		// NAME
		success_name : {
			code : 0,
			desc : '멋진 이름이네요 :)'
		},
		invalid_name : {
			code : 3,
			desc : '이름은 표준 한글만 입력 가능합니다.'
		},
		length_name : {
			code : 4,
			desc : '이름은 2자 이상 4자 이하만 가능합니다.'
		},
		
		// PHONE
		success_phone : {
			code : 0,
			desc : '멋진 전화번호네요 :)'
		},
		invalid_phone : {
			code : 3,
			desc : '휴대폰 번호가 유효하지 않습니다.'
		},
		length_phone : {
			code : 4,
			desc : "'-' 없이 10, 11자로 입력해주세요."
		},
		number_phone : {
			code : 5,
			desc : '숫자만 입력해주세요.'
		},
		
		// EMAIL
		success_email : {
			code : 0,
			desc : '멋진 이메일이네요 :)'
		},
		invalid_email : {
			code : 3,
			desc : '올바른 이메일을 입력해주세요.'
		}
	},
	
	checkId : function(memId) {
		var regEmpty = /\s/g; // 공백체크 정규식
		var idreg = /[^a-z0-9-_.]+/g; // ID 유효성체크 정규식
		// 4. member.jsp에서 전달한 매개변수 memId로 유효성 체크 시작
		//   1) null값 체크                    if
		//   2) 값 사이의 공백값 체크            else if
		//   3) 유효한 값인지 체크(정규식)    else if
		//   4) 6~50자 이내 길이 체크          else if
		//   5) 성공: 유효한 값(중복유무X)   else
		if(memId == "" || memId.length == 0) {
			return this.resultCode.empty_val;
		} else if(memId.match(regEmpty)) {
			return this.resultCode.space_length_val;
		} else if(idreg.test(memId)) {
			return this.resultCode.invalid_id;
		} else if(memId.length < 6 || memId.length > 50) {
			return this.resultCode.length_id;
		} else {
			// 5. 입력받은 값이 ccw1104로 위의 유효성체크 4단계 통과
			//    하지만 중복된 아이디인지 검정 필요함
			// 6. return 결과값으로 success_id(code, desc)를 호출한 곳으로 전송
			//    code: 0, desc: '멋진 아이디네요:)'
			return this.resultCode.success_id;
		}
	},
	
	checkPw : function(memPw, memRepw) {
		var regEmpty = /\s/g;
		var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
		if(memPw == "" || memPw.length == 0) {
			return this.resultCode.empty_val;
		} else if(memPw.match(regEmpty)) {
			return this.resultCode.space_length_val;
		} else if(!pwReg.test(memPw)) {
			return this.resultCode.invalid_pw;
		} else {
			return this.resultCode.success_pw;
		}
	},
	checkRepw : function(memPw, memRepw) {
		var regEmpty = /\s/g;
		var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
		if(memRepw == "" || memRepw.length == 0) {
			return this.resultCode.empty_val;
		} else if(memRepw.match(regEmpty)) {
			return this.resultCode.space_length_val;
		} else if(!pwReg.test(memRepw)) {
			return this.resultCode.invalid_pw;
		} else {
			return this.resultCode.success_pw;
		}
	}
}


// ID 중복체크 Ajax
function ajaxCheck(memId) {
	var return_val = false;
	// 10. ajax 시작 !
	//     목적지 : idCheck.bouquet
	//     전달 데이터 : memId 데이터를 id 변수에 담아 전달
	//     데이터 포장방법 : json
	//     데이터 전달방법 : POST방식
	//   → 결과적으로 web.xml로 이동!
	$.ajax({
		url: "idCheck.bouquet",
		type: "POST",
		dataType: "json",
		data: "id="+memId,
		async: false,
		// 29. Action단에서 전송한 message와 id를 data 매개변수로 받음
		success: function(data){
			
			// 30. data.message의 값이 -1이면 → 중복 메시지 출력
			//     data.message의 값이 1이면 → 사용 가능 메시지 출력
			if(data.message == "-1") {
				$('.member_err_msg').eq(0).text('이미 사용 중인 아이디입니다.')
								   .css('display', 'block')
								   .css('color', 'tomato');
				return_val = false;
			} else {
				$('.member_err_msg').eq(0).text('멋진 아이디네요:)')
				                   .css('display', 'block')
								   .css('color', 'dodgerblue');
				return_val = true;
			}
		},
		error: function(){
			alert("System Error!!!");
		} 
	});
	return return_val;
}

function ajaxPwCheck(nowId, nowPw) {
	var return_val = false;
	$.ajax({
		url: "pwCheck.bouquet",
		type: "POST",
		dataType: "json",
		data: "id=" + nowId + "&pw=" + nowPw,
		async: false,
		success: function(data) {
			if(data.flag) {
				$('.pwAjax').eq(0).text('비밀번호가 일치합니다.')
               						     .css('display', 'block')
                                         .css('color', 'dodgerblue');
				return_val = true;
			} else {
				$('.pwAjax').eq(0).text('비밀번호가 일치하지 않습니다.')
				                             .css('display', 'block')
                                         .css('color', 'tomato');
				return_val = false;
			}
		},
		error:function() {
			alert("System Error♨");
		}
		
	});
	return return_val;
}