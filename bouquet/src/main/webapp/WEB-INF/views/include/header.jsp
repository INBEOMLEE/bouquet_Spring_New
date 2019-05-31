<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<link rel="stylesheet" href="${path}/css/header.css?v=1">
<title>BOUQUET</title>
</head>
<body>
	<div id="modal">
		<div id="modal_login">
			<header>
			<div class="header_logo">L O G I N</div>
		</header>
		<section>
			<div class="input_tag">
				<input type="text" class="idpw" id="login_id" name="" placeholder="아이디를 입력해주세요"></input>
			</div>
			<div class="input_tag">
				<input type="password" class="idpw" id="login_pw" name="" placeholder="비밀번호를 입력해주세요"></input>
			</div>
			<div class="idpw_find">
				<span class="id_find">아이디 찾기</span>
				<span>|</span>
				<span class="pw_find">비밀번호 찾기</span>
			</div>
			<div class="err_msg">등록되어 있지 않은 아이디 입니다.</div>
			<div class="login_btn">
				<button id="btn_login">로그인</button>
			</div>
			<div class="flatform_log">
				<div>
					<i class="fab fa-google"></i>
					<span class="google_log">구글 로그인</span>
				</div>
				<div>
					<img src="${path}/img/facebook.png">
					<span class="facebook_log">페이스북 로그인</span>
				</div>
			</div>
		</section>
		<button id="modal_close"><i class="fas fa-times"></i></button>
		</div>
	</div>
	<header class="index_header">
		<div class="header_outline">
			<div class="header_inline">
				<div class="header_icon">
					<a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
					<a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook"></i></a>
					<a href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
					<a href="https://www.google.co.kr/" target="_blank"><i class="fab fa-google"></i></a>
				</div>
				<div class="header_menu">
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<a id="modal_open" style="cursor: pointer;">로그인</a>
							<a href="${path}/constract.bouquet">회원가입</a>
						</c:when>
						<c:otherwise>
							<a>
								${sessionScope.loginUser.bname}
								( ${sessionScope.loginUser.bid} )
							</a>
							<a class="logout_btn">로그아웃</a>
							<a href="${path}/pwUpdate.bouquet">비밀번호 수정</a>
							<a href="${path}/infoUpdate.bouquet">회원정보 수정</a>
							<a href="${path}/dropMember.bouquet">회원 탈퇴</a>
						</c:otherwise>
					</c:choose>
					<a>고객센터</a>
				</div>
			</div>
		</div>
		<div class="logo_outline">
			<div class="logo_inline">
				<a href="index.bouquet"><img src="${path}/img/free_horizontal_on_white_by_logaster.png"></a>
			</div>
		</div>
		<nav>
			<div class="nav_outline">
				<div class="nav_inline">
					<ul>
						<li>
							<a>베스트상품</a>
							<div class="dropdown01">
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">BEST</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">SPECIAL</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">LUXURY</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">NOBLESS</a>
							</div>
						</li>
						<li>
							<a>새로운상품</a>
							<div class="dropdown01">
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">BEST</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">SPECIAL</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">LUXURY</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">NOBLESS</a>
							</div>
						</li>
						<li>
							<a>계절별상품</a>
							<div class="dropdown01">
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">BEST</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">SPECIAL</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">LUXURY</a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html">NOBLESS</a>
							</div>
						</li>
						<li>
							<a href="${path}/boardList.bouquet">질문게시판</a>
							<div class="dropdown01">
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html"></a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html"></a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html"></a>
								<a href="file:///D:/sublime_workspace/bouquet/bouquet_sel.html"></a>
							</div>
						</li>
						<div class="nav_search">
							<input type="search" name="search">
							<a><i class="fas fa-search"></i></a>
						</div>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="margin_div"></div>
	<aside>
		<button id="topBtn">
			<i class="fas fa-arrow-up"></i>
		</button>
	</aside>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn_login").click(function(){
				
				var id = $.trim($('#login_id').val());
				var pw = $.trim($('#login_pw').val());
				
				var regEmpty = /\s/g;
				
				// 1. null 체크
				// 2. 공백 체크
				
				if(id == null || id.length == 0) {
					$('.err_msg').text('필수 정보입니다.')
								 .css('display', 'block');
					return false;
				} else if(id.match(regEmpty)) {
					$('.err_msg').text('공백 없이 입력해주세요.')
					 			 .css('display', 'block');
					return false;
				}
				
				if(pw == null || pw.length == 0) {
					$('.err_msg').text('필수 정보입니다.')
								 .css('display', 'block');
					return false;
				} else if(pw.match(regEmpty)) {
					$('.err_msg').text('공백 없이 입력해주세요.')
					 			 .css('display', 'block');
					return false;
				}
				
				$.ajax({
					url: "login.bouquet",
					type: "POST",
					dataType: "json",
					data: "id="+id+"&pw="+pw,
					success: function(data) {
						if(data.message == "1") {
							location.reload();			
						} else if(data.message == "-1") {
							$('#login_id').select();
							$('.err_msg').text('회원 아이디 또는 비밀번호가 일치하지 않습니다.')
							             .css('display', 'block');
						}
					},
					error:function() {
						alert("System Error♨");
					}
				});
			});
			
			$('.logout_btn').click(function(){
				$.ajax({
					url: "logOutAjax.bouquet",
					type: "POST",
					dataType: "json",
					data: "",
					success: function(data) {
						location.reload();
					},
					errer:function() {
						alert("System Error♨");
					}
				});
			});
			
			$('#modal_open').click(function(){
				$('#modal').css('display', 'flex');
				$('#login_id').focus();
			});
			$('#modal_close').click(function(){
				$('.idpw').val("");
				$('.err_msg').css('display', 'none');
				$('#modal').css('display', 'none');
			});
			
			var flag = 0;
			$('.nav_search > a > i').click(function(){
				if(flag == 0) {
					$('.nav_search > input').css('width', '150px').css('border-bottom', '1px solid white');
					$('.nav_search > input').focus();
					flag = 1;
				} else {
					$('.nav_search > input').css('width', '0px').css('border-bottom', 'none');
					$('.nav_search > input').val("");
					flag = 0;
				}
			});

			$(window).scroll(function() {
				var scrollValue = $(this).scrollTop();
				if(scrollValue > 40) {
					$('#topBtn').fadeIn();
					$('.index_header').css('opacity', '0.2');
				} else {
					$('#topBtn').fadeOut();
					$('.index_header').css('opacity', '1');
				}
			});
			$('#topBtn').click(function(){
				$('html, body').animate({scrollTop : 0}, 800);
			});
			
			$('.index_header').hover(function(){
				$(this).css('transition', '0.7s').css('opacity', '1');
			});
			
		});
	</script>
</body>
</html>