<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOUQUET : 비밀번호 수정</title>
<style type="text/css">
	.section {
		border-top: 1px solid #dadada;
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
	.pwupdate_title {
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
	.btn_box {
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
	.btn_agree {
		flex: 1;
		color: white;
		background-color: #D8B8B6;
		font-weight: 700;
		font-size: 18px;
		cursor: pointer;
	}
	.line {
		border: 2px solid #D8B8B6;
		margin: 30px auto;
		width: 550px;
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
				<div class="pwupdate_title">비밀번호 수정</div>
				<form class="form" method="POST" action="pwUpdatePlay.bouquet" id="frm_mem">
					<input type="hidden" name="id" value="${sessionScope.loginUser.bid}">
					<!-- 비밀번호 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="pw">비밀번호</label>
						</div>
						<input type="password" name="pw" id="pw" class="input_box" maxlength="20" placeholder="현재 비밀번호">
						<span class="pwAjax">올바른 값을 입력해주세요.</span>
						<div class="explanation">
							<span>영어와 숫자를 조합하여<br> 4~12자 이내로 입력해주세요.</span>
						</div>
					</div>
					<div class="line"></div>
					<div class=join_menu>
						<div class="join_minititle">
							<label for="new_pw">새 비밀번호</label>
						</div>
						<input type="password" name="new_pw" id="new_pw" class="input_box" maxlength="20" placeholder="새 비밀번호">
						<span class="pwAjax">올바른 값을 입력해주세요.</span>
						<div class="explanation">
							<span>영어와 숫자를 조합하여<br> 4~12자 이내로 입력해주세요.</span>
						</div>
					</div>
					<!-- 비밀번호 재확인 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="new_repw">새 비밀번호 재확인</label>
						</div>
						<input type="password" name="new_repw" id="new_repw" class="input_box" maxlength="20" placeholder="새 비밀번호 재확인">
						<span class="pwAjax">올바른 값을 입력해주세요.</span>
						<div class="explanation">
							<span>위에 입력하셨던 비밀번호와<br> 동일하게 입력해주세요.</span>
						</div>
					</div>
				</form>
				<div class="btn_box">
					<div class="cancel_btn">취소</div>
					<div class="btn_agree">재설정하기</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript" src="${path}/js/validation.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			var currentPw = false;
			var newPwEq = false;
			
			$('#pw').blur(function(){
				var nowId = "${sessionScope.loginUser.bid}";
				var nowPw = $("#pw").val();
				if(nowPw != null || nowPw.length != 0) {
					currentPw = ajaxPwCheck(nowId, nowPw);
				}
			});
			
			// pw
			// 1) null
			// 2) 공백체크
			// 3) 정규식
			
			$('#new_pw').blur(function(){
				var memPw = $.trim($('#new_pw').val());
				var memRepw = $.trim($('#new_repw').val());
				var checkResult = joinValidate.checkPw(memPw, memRepw);
				
				if(checkResult.code != 0) {
					$('.pwAjax').eq(1).text(checkResult.desc)
									   .css('display', 'block')
									   .css('color', 'tomato');
					return false;
				} else {
					$('.pwAjax').eq(1).text(checkResult.desc)
									   .css('display', 'block')
									   .css('color', 'dodgerblue');
					if(memRepw != "" || memRepw.length != 0) {	
						if(memPw == memRepw) {
							$('.pwAjax').eq(2).text("비밀번호가 일치합니다.")
							  				   .css('display', 'block')
							  				   .css('color', 'dodgerblue');
							newPwEq = true;
						} else {
							$('.pwAjax').eq(2).text("입력하신 비밀번호가 일치하지 않습니다.")
							  				   .css('display', 'block')
							  				   .css('color', 'tomato');
							newPwEq = false;
							return false;
						}
					}
					return true;
				}
				return false;
			});
			
			// repw
			// 1) null
			// 2) 공백체크
			// 3) 정규식
			// 4) pw != repw

			$('#new_repw').blur(function(){
				var memPw = $.trim($('#new_pw').val());
				var memRepw = $.trim($('#new_repw').val());
				var checkResult = joinValidate.checkRepw(memPw, memRepw);
				
				if(checkResult.code != 0) {
					$('.pwAjax').eq(2).text(checkResult.desc)
									   .css('display', 'block')
									   .css('color', 'tomato');
					return false;
				} else {
					$('.pwAjax').eq(2).text(checkResult.desc)
									   .css('display', 'block')
									   .css('color', 'dodgerblue');
					if(memPw != "" || memPw.length != 0) {	
						if(memPw == memRepw) {
							$('.pwAjax').eq(1).text("비밀번호가 일치합니다.")
							  				   .css('display', 'block')  
							  				   .css('color', 'dodgerblue');
							newPwEq = true;
						} else {
							$('.pwAjax').eq(1).text("입력하신 비밀번호가 일치하지 않습니다.")
							  				   .css('display', 'block') 
							  				   .css('color', 'tomato');
							newPwEq = false;
							return false;
						}
					}
					return true;
				}
				return false;
			});
			
			$('.btn_agree').click(function(){
				var postPw = $("#pw").val();
				var newPw = $('#new_pw').val();
				// 1. 현재 비밀번호가 맞는지 확인
				if(!currentPw) {
					$('#pw').focus();
					return false;
				} else if(!newPwEq) { // 2. 새 비밀번호와 새 비밀번호 확인 유효성 체크
					return false;
				} else if(postPw == newPw) { // 3. 현재 비밀번호와 새 비밀번호가 같은지 체크
					$('.pwAjax').eq(1).text("현재 비밀번호와 다르게 입력해주세요.")
					   							      .css('display', 'block')
									  	 	          .css('color', 'tomato');
					return false;
				}
				$('#frm_mem').submit();
			});
			
			
			
			var 
				form = $('#join_frm'),
				upw = $('#pw'),
				unpw = $('#new_pw'),
				unrepw = $('#new_repw');

			upw.focus(function(){
				// alert('test');
				$('.explanation').eq(0).css('display', 'block');
			});
			
			upw.blur(function(){
				$('.explanation').eq(0).css('display', 'none');
			});
	
			unpw.focus(function(){
				// alert('test');
				$('.explanation').eq(1).css('display', 'block');
			});
			
			unpw.blur(function(){
				$('.explanation').eq(1).css('display', 'none');
			});
			
			unrepw.focus(function(){
				// alert('test');
				$('.explanation').eq(2).css('display', 'block');
			});
			
			unrepw.blur(function(){
				$('.explanation').eq(2).css('display', 'none');
			});
		});
	</script>
</body>
</html>