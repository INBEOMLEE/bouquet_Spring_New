<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOUQUET : 회원탈퇴</title>
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
	.delete_title {
		font-size: 50px;
		font-weight: 700;
		margin: 35px 0;
		color: #5A5A5A;
		letter-spacing: -1;
	}
	.delete_content {
		width: 800px;
		border-radius: 15px;
		border: 2px solid black;
		margin: 0 auto;
		height: auto;
	}
	.delete_content span {
		color: #FFB9B9;
	}
	.content_title {
		font-size: 25px;
		font-weight: 700;
		color: #5A5A5A;
		margin: 40px 0;
	}
	.content {
		width: 720px;
		margin: 25px auto;
		font-size: 18px;
		font-weight: 600;
		text-align: left;
		color: #5A5A5A;
	
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
	.delete_btn {
		flex: 1;
		color: white;
		background-color: #D8B8B6;
		font-weight: 700;
		font-size: 18px;
		cursor: pointer;
	}
	#modal {
		position: fixed;
		z-index: 3;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.6);
		display: flex;
		justify-content: center;
		align-items: center;
		display: none;
	}
	.modal_title {
		background-color: #D8B8B6;
		color: white;
		border-radius: 15px 15px 0px 0px;
		font-size: 20px;
		padding: 10px;
		width: 700px;
		font-weight: 600;
		height: 30px;
		line-height: 30px;
	}
	.modal_content {
		padding: 50px 10px 80px 10px;
		width: 700px;
		text-align: center;
		color: #363636;
		font-size: 25px;
		font-weight: 600;
		background-color: white;
		height: 70px;
		border-radius: 0px 0px 15px 15px;
	}
	.modal_content span{
		color: #FFB9B9;
	}
	.no_btn {
		text-decoration: none;
		color: #5A5A5A;
		border-radius: 15px;
		border: 2px solid #5A5A5A;
		width: 130px;
		margin: 0px 50px;
		display: inline-block;
		font-size: 25px;
		font-weight: 600;
		line-height: 38px;
	}
	.yes_btn {
		text-decoration: none;
		color: #5A5A5A;
		border-radius: 15px;
		border: 2px solid #5A5A5A;
		width: 130px;
		margin: 0px 50px;
		display: inline-block;
		font-size: 25px;
		font-weight: 600;
		line-height: 38px;
	}
	.modal_content a:hover {
		background-color: #D8B8B6;
		border: 2px solid #D8B8B6;
		color: white;
	}
</style>
</head>
<body>
	
	<div id="modal">
		<div class="modal_page">
			<div class="modal_title">회원 탈퇴</div>
			<div class="modal_content">정말 <span>BOUQUET</span>를 탈퇴하시겠습니까?<br><br>
				<a href="#" class="no_btn">아니오</a>
				<a href="#" class="yes_btn">네</a>
			</div>
		</div>
	</div>
	<section>
		<div class="section">
			<div class="inner_section">
				<div class="delete_title">회원 탈퇴</div>
				<div class="delete_content">
					<div class="content_title"><span>"${sessionScope.loginUser.bname}"님</span> 회원 탈퇴 시 아래의 조치가 취해집니다.</div>
					<div class="content">1. 계정 정보는 <span>'개인 정보 보호 정책'에 따라 60일간 보관(잠김) 되며,</span> 60일이 경과된 후 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.</div>
					<div class="content">2. 작성된 게시물은 삭제되지 않으며, 익명 처리 후 <span>BOUQUET로 소유권이 귀속</span>됩니다.</div>
					<div class="content">3. 게시물 삭제가 필요한 경우에는 <span>관리자(dlsqja112@bouquet.co.kr)</span>로 문의해 주시기 바랍니다.</div>
				</div>
				<form class="form" method="POST" action="dropMemberPlay.bouquet" id="frm_mem">
					<!-- 비밀번호 -->
					<div class=join_menu>
						<div class="join_minititle">
							<label for="pw">비밀번호</label>
						</div>
						<input type="password" name="pw" id="pw" class="input_box" maxlength="20" placeholder="비밀번호를 입력해주세요.">
						<span class="pwAjax">올바른 값을 입력해주세요.</span>
					</div>
				</form>
				<div class="btn_box">
					<div class="cancel_btn">취소</div>
					<div class="delete_btn">탈퇴</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${path}/js/validation.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var state = false;
			$('#pw').blur(function(){
				var nowId = "${sessionScope.loginUser.bid}";
				var nowPw = $("#pw").val();
				
				state = ajaxPwCheck(nowId, nowPw);
				
			});
			
			$('.delete_btn').click(function(){
				if(state) {
					$('#modal').css('display', 'flex');
				} else {
					$('#pw').focus();
				}
			});
			
			$('.no_btn').click(function(){
				$('#modal').css('display', 'none');
			});
			
			$('.yes_btn').click(function(){
				$('#frm_mem').submit();
			});
			
		});
	</script>
</body>
</html>