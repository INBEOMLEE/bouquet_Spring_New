<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<c:if test="${sessionScope.loginUser == null}">
	<script>
		alert("로그인 하신 후 사용하세요.");
		location.href="${path}/boardList.bouquet?message=nologin";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOUQUET : 게시글 수정</title>
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
		margin: 300px auto 200px;
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
	.board_insert {
		display: inline-block;
		height: 35px;
		line-height: 35px;
		border-radius: 7px;
		font-size: 16px;
		font-weight: 600;
		margin-top: 20px;
		margin-right: 20px;
		margin-left: 20px;
		padding: 0 10px;
		background-color: #D8ADB6;
		color: white;
		cursor: pointer;
		width: 125px;
	}
	.float {
		float: right;
		width: 150px;
		text-align: center;
		font-size: 20px;
	}
	#close_file_btn {
		display: none;
		position: relative;
		top: 1px;
		cursor: pointer;
		color: #363636;
	}
	.register_err_message {
		color: tomato;
		margin-left: 20px;
		margin-top: 20px;
		text-align: center;
		display: none;
	}
	.close_file_btn {
		position: relative;
		top: 1px;
		cursor: pointer;
	}
	.file_msg {
		color: tomato;
		display: none;
	}
	#open_file_btn {
		color: yellowgreen;
		cursor: pointer;
	}
	.file_list_filesize {
		color: #363636;
	}
</style>
</head>
<body>
	<section>
		<div class="board_inline">
			<div class="board_topic">질문 게시판</div>
			<form action="modifyPlay.bouquet" method="POST" id="frm_bin" name="frm_bin" enctype="multipart/form-data">
				<div class="font_style">제목</div>
				<input type="text" class="input_style" id="input_title" name="input_title" value="${bDto.title}">
				<div class="font_style">내용</div>
				<textarea id="boardUpdate" class="input_content" name="input_content">${bDto.content}</textarea>
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
					 oAppRef: oEditors,
					 elPlaceHolder: "boardUpdate",
					 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
					 fCreator: "createSEditor2"
					});
				</script>
				<div class="register_err_message">내용을 입력해주세요.</div>
				<div class="font_style">작성자</div>
				<input type="text" class="input_style" id="input_writer" name="input_writer" value="${sessionScope.loginUser.bid}" readonly="readonly">
				<input class="board_insert" value="현재 첨부파일">
					<c:choose>
						<c:when test="${bDto.filesize > 0}">
							<div id="file_list" style="display: inline-block;">
								<span class="files" id="file_list_filename" style="height:29px; border: none; color: #363636;">${bDto.filename}</span>
								<c:choose>
									<c:when test="${bDto.filesize > 1024 * 1024}">
										<span class="file_list_filesize">(<fmt:formatNumber type="number" pattern="0.00" value="${bDto.filesize / 1024 / 1024}"></fmt:formatNumber> MB)</span>
									</c:when>
									<c:otherwise>
										<span class="file_list_filesize">(<fmt:formatNumber type="number" pattern="0.00" value="${bDto.filesize / 1024}"></fmt:formatNumber> KB)</span>
									</c:otherwise>
								</c:choose>
								<i class="fas fa-times close_file_btn" style="display: inline-block;"></i>
								<span class="file_msg">[첨부파일 삭제됨]
									<i class="fas fa-check" id="open_file_btn"></i>
								</span>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				<div class="board_insert float" id="update_btn">게시글 수정</div>
				<div id="file_wrap">
					<input type="file" name="uploadfile" id="uploadfile" style="display: none">
					<input type="button" class="btn btn-file board_insert" value="첨부파일 선택">
					<span class="files" id="file_name" style="height:29px; border: none;">선택된 파일 없음</span>
					<span id="now_file_size"></span>
					<i class="fas fa-times" id="close_file_btn" style="display: none"></i>
				</div>
				
				<input type="hidden" value="${bno}" name="input_bno">
				<input type="hidden" value="${bDto.filename}" name="input_basic_filename">
				<input type="hidden" value="${bDto.filesize}" name="input_basic_filesize">
				<input type="hidden" value="yes" name="input_check_yn" id="input_check_yn">
			</form>
		</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.btn-file').click(function(){
			$('#uploadfile').click();
		});
		
		$('#uploadfile').on('change', function(){
			var filesize = $(this)[0].files;
			if(filesize.length < 1) {
				$("#file_name").text("선택된 파일 없음");
				$("#close_file_btn").css("display", "none");
			} else {
				var filename = this.files[0].name;
				var size = this.files[0].size;
				var maxSize = 10 * 1024 * 1024; // 10mb
				
				if(size > maxSize) {
					alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
					$("#file_name").text("선택된 파일 없음");
					$("#uploadfile").val("");
					$("#now_file_size").text("");
				} else {
					$("#file_name").text(filename);
					if(size > (1024 * 1024)){
						var formSize = size/(1024*1024);
						$("#now_file_size").text("(" + formSize.toFixed(2) + "MB)");
					} else {
						var formSize = size/1024;
						$("#now_file_size").text("(" + formSize.toFixed(2) + "KB)");
					}
					$("#close_file_btn").css("display", "inline-block");
				}
			}
		});
		
		$('#close_file_btn').click(function(){
			$("#uploadfile").replaceWith($("#uploadfile").clone(true));
			$("#uploadfile").val("");
			$("#file_name").text("선택된 파일 없음");
			$('#close_file_btn').css("display", "none");
			$("#now_file_size").text("");
		});
		
		var filename = $('#file_list_filename').text();
		
		$('#update_btn').click(function(){
			oEditors.getById["boardUpdate"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var title = $('#input_title').val();
			var content = $('.input_content').val();
			
			if(title == "" || title.length == 0) {
				$('.register_err_message').css("display", "block")
				                          .text("제목을 입력해주세요.");
				return false;
			} else if(content == "<p><br></p>") {
				$('.register_err_message').css("display", "block")
                                          .text("내용을 입력해주세요.");
				return false;
			}
			
			$('#frm_bin').submit();
		});
		
		$('.close_file_btn').click(function(){
			$('#file_list_filename').css("color", "#AAA")
									.css("text-decoration", "line-through");
			$('.file_list_filesize').css("color", "#AAA")
									.css("text-decoration", "line-through");
			$('.file_msg').css("display", "inline-block");
			$('#input_check_yn').val("no");
			$(this).css("display", "none");
		});
		
		$('#open_file_btn').click(function(){
			$('#file_list_filename').css("color", "#363636")
							        .css("text-decoration", "none");
			$('.file_list_filesize').css("color", "#363636")
									.css("text-decoration", "none");
			$('.file_msg').css("display", "none");
			$('.close_file_btn').css("display", "inline-block");
			$('#input_check_yn').val("yes");
		});
		
		
	});
	</script>
</body>
</html>