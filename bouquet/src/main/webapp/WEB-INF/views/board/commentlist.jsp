<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="comment">댓글 <span>${replyList.size()}</span></div>
	
	<c:forEach items="${replyList}" var="replyview">
		<div class="comment_box">
			<div class="comment_box_name">${replyview.writer}</div>
			<div class="comment_box_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${replyview.regdate}" /></div>
			
			<c:if test="${sessionScope.loginUser.bid == replyview.writer}">
				<a class="reply_del" data_num="${replyview.rno}"><i class="fas fa-times"></i></a>
			</c:if>
			
			
			
			<div class="comment_box_content">${replyview.content}</div>
		</div>
	</c:forEach>
	
	<c:if test="${replyList.size() == 0}">
		<div class="comment_box comment_not_comment">
			<i class="fas fa-exclamation-triangle"></i>
			<br>
			등록된 댓글이 없습니다.
		</div>
	</c:if>
	
	<c:choose>
		<c:when test="${empty sessionScope.loginUser}">
			<div class="comment_box comment_not_user">
				<i class="fas fa-user"></i>
				<br>
				<span>로그인</span> 후에 이용해주세요.
			</div>
		</c:when>
		<c:otherwise>
			<div class="line"></div>
			<form action="replyAdd.bouquet" method="POST" name="frm_reply" id="frm_reply">
				<div class="font_style">작성자</div>
				<input type="text" class="input_style" id="margin_bottom" name="re_writer" value="${sessionScope.loginUser.bid}" readonly="readonly">
				<textarea id="replyInsert" name="re_textarea"></textarea>
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
					 oAppRef: oEditors,
					 elPlaceHolder: "replyInsert",
					 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
					 fCreator: "createSEditor2"
					});
				</script>
				<div class="view_err_message">내용을 입력해주세요.</div>
				<div class="btn_style">게시글 목록</div>
				<div class="btn_style float reply_btn" id="margin_right">댓글 등록</div>
				<input type="hidden" id="re_bno" name="re_bno">
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>