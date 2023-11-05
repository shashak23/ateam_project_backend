<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 홈페이지</title>
</head>
<script src="/js/lib/jquery-3.7.1.js"></script>
<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
	}
	.post_title_label,
	.post_content_label {
		color: gray;
		display: block;
		margin-bottom: 10px;
		font-size: 10pt;
	}

	.create_container {
			visibility: hidden;
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -80%);
			z-index: 10;
			box-shadow: 0 0 10px #19191948;
			border: 1px solid;
			width: 500px;
			padding: 30px;
			opacity: 0;
			border: none;
			border-radius: 5px;
			background-color: #ffffff;
			transition: 0.5s;
	}

	.create_container.active {
			visibility: visible;
			opacity: 1;
			transform: translate(-50%, -50%);
	}

	.create_container > * {
			margin-bottom: 10px;
	}

	.btn-close {
		position: absolute;
		top: 6px;
		right: 10px;
		background-color: transparent;
		font-size: 18px;
		color: #888;
		cursor: pointer;
	}

	.btn-close:hover {
			color: #191919;
	}

	.create_title {
			text-align: center;
	}

	#postTitle {
			border: 0px;
			background-color: #e9f3ff;
			width: 100%;
			height: 35px;
			padding: 0 15px;
			outline: none;
			color: #333;
	}

	#noticeContent {
			border: 0px;
			background-color: #e9f3ff;
			width: 100%;
			height: 200px;
			padding: 15px 15px;
			outline: none;
			color: #333;
			resize: none;
	}

	#postTitle::placeholder,
	#noticeContent::placeholder {
			color: #bbb;
	}

	#postTitle:focus::placeholder,
	#noticeContent:focus::placeholder {
			visibility: hidden;
	}

	.date_wrap {
			display: flex;
			justify-content: space-around;
	}

	#start-date, #end-date {
			outline: none;
	}

	.overlay {
		background-color: #47474754;
		position: fixed;
		width: 100%;
		height: 100vh;
		top: 0;
		left: 0;
		transition: 0.5s;
		opacity: 0;
		pointer-events: none;
	}

	.overlay.active {
			opacity: 1;
			pointer-events: all;
	}
</style>
<body>
<jsp:include page="../member/membermenu.jsp"></jsp:include>
	<p>
		※ 임시 홈페이지 입니다. (로그인 확인용)		
	</p>
	<c:choose>
		<c:when test="${empty sessionScope._LOGIN_USER_}">
			<div>
				로그인 하지 않았습니다.
			</div>
		</c:when>
		<c:otherwise>
			<div>
				현재 로그인된 아이디: <strong>${sessionScope._LOGIN_USER_.email}</strong>
			</div>
			<div>
				현재 로그인된 이름: <strong>${sessionScope._LOGIN_USER_.nickname}</strong>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="create_container">
		<div class="btn-close">&times;</div>
		<h1 class="create_title">공지</h1>
		<div>
			<label for="postTitle" class="post_title_label">제목</label>
			<div>${noticeVO.postTitle}</div>
		</div>
		<label for="noticeContent" class="post_content_label">내용</label>
		<p>${noticeVO.noticeContent}</p>
	</div>
	<div class="overlay"></div>
<script>
	$().ready(function() {
		$('.create_container, .overlay').addClass('active')

		$('.btn-close, .overlay').click(function() {
			$('.create_container, .overlay').removeClass('active')
		})
	})
</script>
</body>
</html>