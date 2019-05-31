<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<%
	String referer = request.getHeader("referer");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOUQUET : 상세 게시글</title>
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
	section {
		width: 100%;
		height: auto;
	}
	.board_inline {
		width: 1080px;
		height: auto;
		border: 1px solid black;
		margin: 300px auto 30px;
		border-radius: 30px;
		box-shadow: 3px 3px 3px 3px #ccc;
		padding-bottom: 40px;
	}
	.comment_inline {
		width: 1080px;
		height: auto;
		border: 1px solid black;
		margin: 0px auto 30px;
		border-radius: 30px;
		box-shadow: 3px 3px 3px 3px #ccc;
		padding-bottom: 35px;
	}
	.board_topic {
		font-size: 30px;
		font-weight: 700;
		padding: 35px 0 10px 30px;
		color: #363636;
	}
	.font_style {
		font-size: 20px;
		font-weight: 600;
		padding: 20px 30px 10px 40px;
		display: inline-block;
		width: 813px;
	}
	.font_style2 {
		font-size: 20px;
		font-weight: 600;
		padding: 20px 30px 10px 40px;
		display: inline-block;
		width: 200px;
	}
	.input_style {
		width: 800px;
		font-size: 20px;
		margin-left: 19px;
		padding-left: 20px;
		font-weight: 600;
		border: 1px solid #A2A2A2;
		height: 35px;
	}
	.input_style2 {
		width: 216px;
		font-size: 20px;
		margin: 0 19px;
		padding-left: 20px;
		font-weight: 600;
		border: 1px solid #A2A2A2;
		height: 35px;
	}
	.info_table {
		width: 1040px;
		height: 35px;
		margin: 20px 17px;
	}
	.fa-heart {
		color: red;
	}
	#content_title {
		text-align: left;
		padding: 0 25px;
	}
	.info_table th {
		border: 1px solid #A2A2A2;
		height: 35px;
		font-size: 18px;
		width: 173px;
		background-color: #D8ADB6;
		color: white;
	}
	.info_table td {
		border: 1px solid #A2A2A2;
		padding: 0 10px;
		font-size: 17px;
		width: 173px;
		text-align: center;
		font-weight: 600;
		color: #363636;
	}
	.content {
		width: 1040px;
		border: 1px solid #A2A2A2;
		height: 500px; 
		margin: 0 auto;
		padding: 10px;
		font-size: 17px;
		font-weight: 600;
	}
	.btn_style {
		display: inline-block;
		height: 35px;
		line-height: 35px;
		border-radius: 7px;
		font-size: 16px;
		font-weight: 600;
		margin-top: 20px;
		margin-left: 20px;
		padding: 0 10px;
		background-color: #D8ADB6;
		color: white;
		cursor: pointer;
	}
	.float {
		float: right;
		
	}
	.board_inline div:nth-child(8) {
		margin-right: 20px;
	}
	.comment {
		font-size: 25px;
		font-weight: 700;
		padding: 35px 0px 20px 30px;
		color: #363636;
	}
	.comment span {
		color: #D8ADB6;
	}
	.comment_box {
		border: 1px solid #A2A2A2;
		width: 1040px;
		margin: 0 auto 15px;
		box-shadow: 2px 2px 2px 2px #ccc;
		color: #363636;
		height: auto;
	}
	.comment_box_name {
		display: inline-block;
		width: 885px;
		font-size: 18px;
		font-weight: 600;
		padding: 15px;
	}
	.comment_box_date {
		display: inline-block;
		width: 120px;
		font-size: 16px;
		font-weight: 600;
		padding: 15px;
	}
	.comment_box_content {
		border: 1px solid #A2A2A2;
		padding: 10px;
		font-size: 16px;
		font-weight: 600;
		width: 1000px;
		margin: 0 auto 15px;
	}
	.comment_not_user {
		line-height: 50px;
		padding: 15px;
		font-size: 25px;
		text-align: center;
		font-weight: 700;
		height: 120px;
		cursor: pointer;
	}
	.comment_not_user i {
		color: #A2A2A2;
	}
	.comment_not_user span {
		color: #D8ADB6;
		font-weight: 900;
	}
	.comment_not_comment {
		line-height: 50px;
		padding: 15px;
		font-size: 25px;
		text-align: center;
		font-weight: 700;
		height: 120px;
	}
	.comment_not_comment i {
		color: #A2A2A2;
		font-size: 40px;
	}
	.line {
		margin: 30px 0;
		border: 1px dashed black;
		width: 100%;
	}
	textarea {
		margin: 0 19px;
		width: 1040px;
		height: 500px;
		font-size: 20px;
		padding-left: 20px;
		padding-top: 10px;
		font-weight: 600;
		border: 1px solid #A2A2A2;
	}
	.font_style {
		font-size: 20px;
		font-weight: 600;
		padding: 20px 30px 10px 40px;
		display: inline-block;
	}
	.input_style {
		width: 1040px;
		font-size: 20px;
		margin: 0 19px;
		padding-left: 20px;
		font-weight: 500;
		border: 1px solid #A2A2A2;
		height: 35px;
		color: #363636;
	}
	.good_btn {
		display: inline-block;
		border: 1px solid #dadada;
		font-size: 20px;
		border-radius: 50%;
		margin-left: 319px;
		padding: 7px;
		color: red;
		cursor: pointer;
	}
	#good_btn_none {
		display: none;
	}
	.fa-heart {
		margin-top: 2px;
		padding: 0 1px;
	}
	
	#margin_bottom {
		margin-bottom: 20px;
	}
	
	#margin_right {
		margin-right: 20px;
	}
	.fa-user {
		font-size: 40px;
	}
	.reply_del {
		cursor: pointer;
	}
	.view_err_message {
		color: tomato;
		margin-left: 20px;
		margin-top: 20px;
		text-align: center;
		display: none;
		
	}
	#modal2 {
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
		height: 45px;
		line-height: 30px;
	}
	.modal_content {
		padding: 50px 10px 140px 10px;
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
	<div id="modal2">
		<div class="modal_page">
			<div class="modal_title">게시글 삭제</div>
			<div class="modal_content"><span>'해당 게시글'</span> 을 삭제하시겠습니까?<br><br>
				<a class="no_btn">아니오</a>
				<a class="yes_btn">네</a>
			</div>
		</div>
	</div>
	<section>
		<div class="board_inline">
			<div class="board_topic">질문 게시판</div>
			
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
			<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate" />
			
			<table class="info_table">
				<tr>
					<th>제목</th>
					<td colspan="5" id="content_title">${bDto.title}</td>
				</tr>
				<tr>
					<th>글번호</th>
					<td>${bDto.bno}</td>
					<th>작성자</th>
					<td>${bDto.writer}</td>
					<th>작성일</th>
					<td>
						<c:choose>
							<c:when test="${today == regdate}">
								<fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate}" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}" />
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr class="table_width">
					<th>첨부파일</th>
					<c:choose>
						<c:when test="${bDto.filesize > 0}">
							<c:choose>
								<c:when test="${bDto.filesize > 1024 * 1024}">
									<td><a href="download.bouquet?file=${bDto.filename}">${bDto.filename}<br>(<fmt:formatNumber type="number" pattern="0.00" value="${bDto.filesize / 1024 / 1024}"></fmt:formatNumber> MB)</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="download.bouquet?file=${bDto.filename}">${bDto.filename}<br>(<fmt:formatNumber type="number" pattern="0.00" value="${bDto.filesize / 1024}"></fmt:formatNumber> KB)</a></td>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<td>첨부된 파일 없음</td>
						</c:otherwise>
					</c:choose>
					
					<th>좋아요</th>
					<td><i class="fas fa-heart" ></i> <span id="goodcnt">${bDto.goodcnt}</span></td>
					<th>조회수</th>
					<td><i class="fas fa-eye"></i> ${bDto.viewcnt}</td>
				</tr>
			</table>
			<div class="content">${bDto.content}</div>
			
			<div class="btn_style" id="returnGo">게시글 목록</div>
			
			<div class="btn_style">답변</div>
			<c:if test="${!empty sessionScope.loginUser}">
				<div class="good_btn"><i class="far fa-heart"></i></div>
				<div class="good_btn" id="good_btn_none"><i class="fas fa-heart"></i></div>
			</c:if>
			<c:if test="${sessionScope.loginUser.bid == bDto.writer}">			
				<div class="btn_style float update_btn">게시글 수정</div>
				<div class="btn_style float delete_btn">게시글 삭제</div>
			</c:if>
		</div>
		<div class="comment_inline">
			<div id="commentList">
			</div>
		</div>
	</section>
	
	<script type="text/javascript">
	
		history.pushState(null, document.title, location.href);
		window.addEventListener('popstate', function(event){
			history.pushState(null, document.title, '<%=referer%>');
			location.reload(); //리프레쉬
		});
		
		/* // 뒤로가기 막기
		history.pushState(null, null, location.href);
		window.onpopstate = function () {
			history.go(1);
		} */
		
		$(document).ready(function(){
			comment_list();
			
			var flag = 0;
			var good_check = "${gDto.bid}";
			
			if(good_check != "") {
				$('.good_btn').eq(0).css('display', 'none');
				$('.good_btn').eq(1).css('display', 'inline-block');
				flag = 1;
			} else {
				$('.good_btn').eq(0).css('display', 'inline-block');
				$('.good_btn').eq(1).css('display', 'none');
				flag = 0;
			}
			
			$('.good_btn').click(function(){
				if(flag == 0) {
					$.ajax({
						url: "goodCntPlus.bouquet",
						type: "POST",
						dataType: "json",
						data: "bno=${bDto.bno}",
						async: false,
						success: function(data){
							if(data.result) {
								$('.good_btn').eq(0).css('display', 'none');
								$('.good_btn').eq(1).css('display', 'inline-block');
								$('#goodcnt').text(data.goodcnt);
							} 
						},
						error: function(){
							alert("System Error!!!");
						} 
					});
					flag = 1;
				} else {
					$.ajax({
						url: "goodCntMinus.bouquet",
						type: "POST",
						dataType: "json",
						data: "bno=${bDto.bno}",
						async: false,
						success: function(data){
							if(data.result) {
								$('.good_btn').eq(0).css('display', 'inline-block');
								$('.good_btn').eq(1).css('display', 'none');
								$('#goodcnt').text(data.goodcnt);
							} 
						},
						error: function(){
							alert("System Error!!!");
						} 
					});
					flag = 0;
				}
			}); 
			
			$('.delete_btn').click(function(){
				$('#modal2').css('display', 'flex');
			});
			
			$('.no_btn').click(function(){
				$('#modal2').css('display', 'none');
			});
		});
		
		$(document).on("click", "#returnGo", function(){
			location.href = "<%=referer%>";
		});
		
		function comment_list() {
			$.ajax({
				type: "post",
				url: "commentlist.bouquet",
				data: "bno=${bDto.bno}",
				success: function(result) {
					$("#commentList").html(result);
				}
			});
		}
		
		$(document).on("click", ".reply_btn", function(){
			oEditors.getById["replyInsert"].exec("UPDATE_CONTENTS_FIELD", []);
			
			
			var content = $('#replyInsert').val();
			
			if(content == "<p><br></p>") {
				$('.view_err_message').css("display", "block");
				return false;
			} else {
				var bno = "${bDto.bno}";
				$("#re_bno").val(bno);
				
				$.ajax({
					url: "replyAdd.bouquet",
					type: "POST",
					dataType: "json",
					data: $("#frm_reply").serialize(),
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					success: function(data){
						if(data.result == 1) {
							comment_list();
							$("#replyInsert").val("");
						}
					},
					error: function(){
						alert("System Error!!!");
					} 
				});
			}
		});
		
		$(document).on("click", ".reply_del", function(){
			var rno = $(this).attr("data_num");
			var bno = "${bDto.bno}";
			
			$.ajax({
				url: "replyRemove.bouquet",
				type: "POST",
				dataType: "json",
				data: "rno=" + rno + "&bno=" + bno,
				success: function(data){
					if(data.result == 1) {
						comment_list();
					}
				},
				error: function(){
					alert("System Error!!!");
				} 
			});
		});
		
		$(document).on("click", ".yes_btn", function(){
			location.href="removePlay.bouquet?bno=${bDto.bno}&filename=${bDto.filename}";
		});
		
		$(document).on("click", ".update_btn", function(){
			location.href="updateView.bouquet?bno=${bDto.bno}";
		});
		
	</script>
</body>
</html>