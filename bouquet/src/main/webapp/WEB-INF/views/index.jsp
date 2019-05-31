<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOUQUET</title>
<style type="text/css">
	.content_outline {
		width: 100%;
		height: auto;
		/*border: 1px solid black;*/
		background-color: #FFFFF6;
	}
	.content_inline {
		width: 1600px;
		height: auto;
		margin: 0 auto;
		/*border: 1px solid black;*/
		background-color: white;
	}
	.content_img {
		width: 1200px;
		height: 540px;
		/*border: 1px solid black;*/
		margin: 0 auto;
		padding-top: 50px;
		cursor: pointer;
	}
	.content_hotproduct {
		/*border: 1px solid black;*/
		width: 1360px;
		height: auto;
		margin: 0 auto;
		font-family: 'Dancing Script', cursive;
		font-weight: bold;
		font-size: 25px;
		color: #75828B;
	}
	.content_hotproduct > span {
		display: block;
		margin-top: 100px;
		margin-bottom: 20px;
	}
	.content_hotproduct > a > img {
		margin: 4.5px;
		opacity: 0.6;
		width: 440px;
		height: 440px;
	}
	.content_hotproduct > a > img:hover {
		opacity: 1;
	}
	.content_newproduct {
		width: 1360px;
		height: auto;
		margin: 0 auto;
		padding-bottom: 30px;
		font-family: 'Dancing Script', cursive;
		font-weight: bold;
		font-size: 25px;
		color: #75828B;
	}
	.content_newproduct > span {
		display: block;
		margin-top: 100px;
		margin-bottom: 20px;
	}
	.content_newproduct > a > img {
		margin: 4.5px;
		opacity: 0.6;
		width: 440px;
		height: 440px;
	}
	.content_newproduct > a > img:hover {
		opacity: 1;
	}
</style>
</head>
<body>
	<section>
		<div class="content_outline">
			<div class="content_inline">
				<div class="content_img">
					<img src="${path}/img/main01.jpg">
				</div>
				<div class="content_hotproduct">
					<span>♥ HOT PRODUCT ♥</span>
					<c:forEach items="${bestList}" var="bestDTO">
						<a href="#"><img src="${path}/img/${bestDTO.p_img}"></a>
					</c:forEach>
					
				</div>
				<div class="content_newproduct">
					<span>♥ NEW PRODUCT ♥</span>
					<c:forEach items="${newList}" var="newDTO">
						<a href="#"><img src="${path}/img/${newDTO.p_img}"></a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.idpw').focus(function(){
				$(this).css("border", "1px solid #D8ADB6");
			});

			$('.idpw').blur(function(){
				$(this).css("border", "1px solid #dadada");
			});

			$('#login_id').focus();

			$('#btn_login').click(function(){
				var valId = $('.idpw').first().val();
				var valPw = $('.idpw').last().val();

				if(valId == '') {
					$('.err_code').first().css("display", "block");
					$('#login_id').focus();
					return;
				} else {
					$('.err_code').first().css("display", "none");
				}
				if(valPw == '') {
					$('.err_code').last().css("display", "block");
					$('#login_pw').focus();
				} else {
					$('.err_code').last().css("display", "none");
				}
			});

			$('#modal_open').click(function(){
				$('#modal').css('display', 'flex');
				$('#login_id').focus();
			});
			$('#modal_close').click(function(){
				$('#modal').css('display', 'none');
				$('.idpw').val("");
			});
			$('#modal_close').mousedown(function(){
				$(this).css('border-bottom', '3px solid #D8ADB6').css('transform', 'scale(1.2)');
			});
			$('#modal_close').mouseup(function(){
				$(this).css('border', 'none').css('transform', 'scale(1)');
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
				} else {
					$('#topBtn').fadeOut();
				}
			});
			$('#topBtn').click(function(){
				$('html, body').animate({scrollTop : 0}, 800);
			});
			
		});
	</script>
</body>
</html>