<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOUQUET : 회원수정</title>
<style type="text/css">
	.section {
		background-color: #FFFFF6;
	}
	.inner_section {
		border: 1px solid white;
		width: 1440px;
		height: auto;
		margin: 0 auto;
		text-align: center;
		background-color: white;
	}
	.update_title {
		font-size: 30px;
		font-weight: 700;
		margin: 35px 0;
		color: #5A5A5A;
		letter-spacing: -1;
	}
	.join_menu {
		/*border: 1px solid black;*/
		width: 550px;
		padding: 10px;
		margin: 0 auto;
		border: 1px solid #D8ADB6;
		margin-top: 20px;
		border-radius: 5px;
		position: relative;
	}
	.join_menu:nth-child(1) {
		margin-top: 30px;
	}
	.join_minititle {
		width: 100%;
		text-align: left;
		font-size: 15px;
		padding: 0 0 10px 10px;
	}
	.join_menu input {
		width: 498px;
		height: 45px;
		font-size: 16px;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid #dadada;
	}
	.join_menu > span {
		display: block;
		text-align: left;
		padding: 10px 0 0 10px;
		font-size: 15px;
		color: tomato;
		display: none;
	}
	#email_id, #email_url {
		width: 185px;
		display: inline-block;
		float: left;
		flex: 1;
	}
	#email_url {
		width: 150px;
		margin-right: 4px;
	}
	h1 {
		display: inline-block;
		padding: 0;
		margin: 0;
		line-height: 45px;
		float: left;
		padding: 0 5px;
		font-weight: 200;
		color: #6C6C6C; 
	}
	#selmail {
		width: 120px;
		height: 45px;
		flex: 1;
		border: 1px solid #dadada;
		border-radius: 5px;				
	}
	.email_wrap {
		margin: 0 auto;
		/*border: 1px solid black;*/
		display: flex;
		width: 498px;
	}
	.address_wrap {
		width: 498px;
		text-align: left;
		margin: 0 auto;
	}
	.address_wrap input {
		width: 300px;
		padding: 10px;
		margin-top: 4px;
	}
	.address_wrap input:nth-child(2) {
		width: 193.5px;
		cursor: pointer;
		background: #D8B8B6;
		color: white;
		border: 1px solid #D8B8B6;
	}
	.address_wrap input:nth-child(3) {
		width: 100%;
	}
	.address_wrap input:nth-child(5) {
		width: 193.5px;
	}
	
	.btn_update {
		/* border: 1px solid black; */
		display: flex;
		width: 550px;
		margin: 20px auto;
		height: 50px;
		line-height: 50px;
	}
	.cancel_btn {
		flex: 1;
		color: black;
		background-color: white;
		font-weight: 700;
		color: #6C6C6C;
		cursor: pointer;
		font-size: 18px;
		border: 1px solid #dadada;
	}
	.update_btn {
		flex: 1;
		color: white;
		background-color: #D8B8B6;
		font-weight: 700;
		font-size: 18px;
		cursor: pointer;
	}
	.explanation {
		position: absolute;
		top: 0;
		right: -330px;
		width: 300px;
		height: 94px;
		border: 1px solid black;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid #D8ADB6;
		display: none;
	}
	.explanation span {
		display: block;
		padding-top: 16px;
		color: #D8ADB6;
	}
	#explanation_adr {
		height: 196px;
		padding-top: 60px;
	}

</style>
</head>
<body>
	<section>
		<div class="section">
			<div class="inner_section">
				<div class="update_title">회원 수정</div>
				<form class="form" method="POST" action="infoUpdatePlay.bouquet" id="form">
					<!-- 아이디 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="id">아이디</label>
						</div>
						<input type="text" name="id" id="id" class="input_box" maxlength="20" placeholder="아이디를 입력해주세요." readonly="readonly" value="${sessionScope.loginUser.bid}">
						<span class="error_message">올바른 값을 입력해주세요.</span>
						<div class="explanation">
							<span>소문자 영어와 숫자를 조합하여<br> 6~50자 이하로 입력해주세요.</span>
						</div>
					</div>
					<!-- 이름 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="name">이름</label>
						</div>
						<input type="text" name="name" id="name" class="input_box" maxlength="4" placeholder="이름을 입력해주세요." value="${sessionScope.loginUser.bname}">
						<span class="error_message">올바른 값을 입력해주세요.</span>
						<div class="explanation">
							<span>한글(Korean) 이름으로<br> 2~4자 이내로 입력해주세요.</span>
						</div>
					</div>
					<!-- 전화번호 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="phone">전화번호</label>
						</div>
						<input type="text" name="phone" id="phone" class="input_box" maxlength="11" placeholder="전화번호를 입력해주세요." value="${sessionScope.loginUser.bphone}">
						<span class="error_message">올바른 값을 입력해주세요.</span>
						<div class="explanation">
							<span>'-' 없이 숫자로만 입력해주세요.<br>ex ) 01012345678</span>
						</div>
					</div>
					<!-- 이메일 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="phone">이메일</label>
						</div>
						<div class="email_wrap">
							<input type="text" id="email_id" name="email_id" placeholder="이메일을 입력해주세요.">
							<h1>@</h1>
							<input type="text" id="email_url" name="email_url" placeholder="이메일 선택">
							<select id="selmail">
								<option value="">이메일 선택</option>
								<option value="directVal">직접입력
								</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com
								</option>
							</select>
						</div>
						<span class="error_message">올바른 값을 입력해주세요.</span>
						<div class="explanation">
							<span>본인이 자주 사용하시는<br> 이메일을 정확하게 입력해주세요.</span>
						</div>
					</div>

					<!-- 주소 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="phone">주소</label>
						</div>
						<div class=address_wrap>
							<input type="text" name="zipcode" id="sample6_postcode" placeholder="우편번호" value="${sessionScope.loginUser.bzipcode}">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<input type="text" name="addr1" id="sample6_address" placeholder="주소" value="${sessionScope.loginUser.baddr1}">
							<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소" value="${sessionScope.loginUser.baddr2}">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" >
						</div>
						<span class="error_message">올바른 값을 입력해주세요.</span>
						<div class="explanation" id="explanation_adr">
							<span>우편번호 찾기를 이용하시면<br>편리하게 주소입력을 하실 수 있습니다.</span>
						</div>
					</div>
					<div class="btn_update">
						<div class="cancel_btn">취소</div>
						<div class="update_btn btn_agree">회원수정</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp" %>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			var email = "${sessionScope.loginUser.bemail}";
			
			var index = email.indexOf('@');
			var email_id = email.substring(0, index);
			var email_url = email.substring(index + 1);
			
			$('#email_id').attr('value', email_id);
			$('#email_url').attr('value', email_url);
			
			
			// name
			// 1) null
			// 2) 공백체크
			// 3) 정규식
			
			$('#name').blur(function(){
				var name = $.trim($(this).val());
				var regKor = /[^가-힣]/;
				var regEmpty = /\s/g;
				
				if(name == "" || name.lengh == 0) {
					$('.error_message').eq(1).text('필수입력 정보입니다.')
					   				   .css('display', 'block')
					  				   .css('color', 'tomato');
					return false;
				} else if(name.match(regEmpty)) {
					$('.error_message').eq(1).text('공백 없이 입력해주세요.')
					                   .css('display', 'block')
					                   .css('color', 'tomato');
			 		return false;
				} else if(regKor.test(name)) {
					$('.error_message').eq(1).text('이름은 표준 한글만 입력 가능합니다.')
									   .css('display', 'block')
									   .css('color', 'tomato');
					return false;
				} else if(name.length < 2 || name.length > 4) { 
					$('.error_message').eq(1).text('이름은 2자 이상 4자 이하여만 합니다.')
									   .css('display', 'block')
									   .css('color', 'tomato');
					return false;
				} else {
					$('.error_message').eq(1).text('멋진 이름이네요!')
									   .css('display', 'block')
									   .css('color', 'dodgerblue');
				}
			});
			
			// phone
			// 1) null
			// 2) 공백체크
			// 3) 정규식
			
			$('#phone').blur(function(){
				var phone = $.trim($(this).val());
				var regEmpty = /\s/g;
				var regPhone = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;
				if(phone == "" || phone.lengh == 0) {
					$('.error_message').eq(2).text('필수입력 정보입니다.')
					   				   .css('display', 'block')
					  				   .css('color', 'tomato');
					return false;
				} else if(phone.match(regEmpty)) {
					$('.error_message').eq(2).text('공백 없이 입력해주세요.')
					                   .css('display', 'block')
					                   .css('color', 'tomato');
			 		return false;
				} else if($.isNumeric(phone) == false) {
					$('.error_message').eq(2).text('숫자만 입력해주세요.')
					                   .css('display', 'block')
					                   .css('color', 'tomato');
					return false;
				} else if(phone.indexOf("01") != 0) {
					$('.error_message').eq(2).text('휴대폰 번호가 유효하지 않습니다.')
					                   .css('display', 'block')
					                   .css('color', 'tomato');
					return false;
				} else if(!(phone.length == 10 || phone.length == 11)) {
					$('.error_message').eq(2).text("'-' 없이 10, 11자로 입력해주세요.")
					                   .css('display', 'block')
					                   .css('color', 'tomato');
					return false;
				} else {
					$('.error_message').eq(2).text('멋진 전화번호네요!')
									   .css('display', 'block')
									   .css('color', 'dodgerblue');
				}		
			});
			
			$('#email_id').blur(function(){
				var email = $.trim($(this).val());
				var url = $.trim($('#email_url').val());
				var regEmpty = /\s/g;
				var emailReg = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
				
				if(email == "" || email.lengh == 0) {
					$('.error_message').eq(3).text('필수입력 정보입니다.')
					   				   .css('display', 'block')
					  				   .css('color', 'tomato');
					return false;
				} else if(email.match(regEmpty)) {
					$('.error_message').eq(3).text('공백 없이 입력해주세요.')
					                   .css('display', 'block')
					                   .css('color', 'tomato');
			 		return false;
				} else if(url != "" || url.length != 0) {
					var fullMail = email + "@" + url;
					if(!emailReg.test(fullMail)) {
						$('.error_message').eq(3).text('올바른 이메일을 입력해주세요.')
										   .css('display', 'block')
										   .css('color', 'tomato');
						return false;
					} else {
						$('.error_message').eq(3).text('멋진 이메일이네요!')
										   .css('display', 'block')
										   .css('color', 'dodgerblue');
					}
				} else {
					$('.error_message').eq(3).text('')
					return false;
				}
			});
			
			$('#email_url').blur(function(){
				var email = $.trim($('#email_id').val());
				var url = $.trim($(this).val());
				var regEmpty = /\s/g;
				var emailReg = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
				
				if(url == "" || url.lengh == 0) {
					$('.error_message').eq(3).text('필수입력 정보입니다.')
					   				   .css('display', 'block')
					  				   .css('color', 'tomato');
					return false;
				} else if(url.match(regEmpty)) {
					$('.error_message').eq(3).text('공백 없이 입력해주세요.')
					                   .css('display', 'block')
					                   .css('color', 'tomato');
			 		return false;
				} else if(email != "" || email.length != 0) {
					var fullMail = email + "@" + url;
					if(!emailReg.test(fullMail)) {
						$('.error_message').eq(3).text('올바른 이메일을 입력해주세요.')
										   .css('display', 'block')
										   .css('color', 'tomato');
						return false;
					} else {
						$('.error_message').eq(3).text('멋진 이메일이네요!')
										   .css('display', 'block')
										   .css('color', 'dodgerblue');
					}
				} else {
					$('.error_message').eq(3).text('')
					return false;
				}
			});
			$('#sample6_detailAddress').blur(function(){
				var addr = $.trim($(this).val());
				if(addr == "" || addr.lengh == 0) {
					$('.error_message').eq(4).text('필수입력 정보입니다.')
					   				   .css('display', 'block')
					  				   .css('color', 'tomato');
					return false;
				} else {
					$('.error_message').eq(4).text('주소 입력이 완료 되었습니다.')
						   				     .css('display', 'block')
						  				     .css('color', 'dodgerblue');
				}
				
			});
			
			$('#selmail').change(function() {
				var selmail = $(this).val();

				if(selmail == 'directVal') {
					$('#email_url').val("");
					$('#email_url').focus();
					$('#email_url').removeAttr('readonly');
				} else {
					$('#email_url').val(selmail);
					$('#email_url').prop('readonly', true);
					$('#email_url').blur();
				}
			});
			
			var 
			uid = $('#id'),
			upw = $('#pw'),
			urepw = $('#repw'),
			uname = $('#name'),
			uphone = $('#phone'),
			umail = $('#email_id'),
			uurl = $('#email_url');

			// input 태그에 따른 설명 띄우기
	
			uname.focus(function(){
				// alert('test');
				$('.explanation').eq(1).css('display', 'block');
			});
			
			uname.blur(function(){
				$('.explanation').eq(1).css('display', 'none');
			});
			
	
			uphone.focus(function(){
				// alert('test');
				$('.explanation').eq(2).css('display', 'block');
			});
			
			uphone.blur(function(){
				$('.explanation').eq(2).css('display', 'none');
			});
	
			
	
			$('.email_wrap > input').focus(function(){
				// alert('test');
				$('.explanation').eq(3).css('display', 'block');
			});
	
			$('.email_wrap > input').blur(function(){
				// alert('test');
				$('.explanation').eq(3).css('display', 'none');
			});
	
			$('.address_wrap > input').focus(function(){
				// alert('test');
				$('.explanation').eq(4).css('display', 'block');
			});
	
			$('.address_wrap > input').blur(function(){
				// alert('test');
				$('.explanation').eq(4).css('display', 'none');
			});
			
			$('.btn_agree').click(function(){
				$('#form').submit();
			});
			
		});
		
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
</body>
</html>