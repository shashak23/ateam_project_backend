<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필사진 생성하기</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	background-color: #f0f0f0;
}

.profile-container {
	margin-top: 50px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	width: 300px;
	margin: 0 auto;
}

.profile-image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	margin: 0 auto;
	display: block;
}

.file-input {
	margin-top: 20px;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin: 10px;
}
</style>
</head>
<body>
	<form method="post" enctype="multipart/form-data"
		action="/memberInfo/modify/modify-profile-pic">
		<input type="hidden" name="email" value="${memberVO.email}" />
		<div class="profile-container">
			<h1>프로필 사진</h1>
			<c:choose>
				<c:when test="${memberVO.profilePic eq 'https://w7.pngwing.com/pngs/384/868/png-transparent-person-profile-avatar-user-basic-ui-icon.png'}">
					<img src="${memberVO.profilePic}" class="profile-image" id="profile-image"/>
				</c:when>
				<c:otherwise>
					<img src="/member/file/download/${memberVO.email}" class="profile-image" id="profile-image"/>
				</c:otherwise>
			</c:choose>
			<div class="file-input">
				<input type="file" id="file" name="file" />
			</div>
		</div>

		<input type="submit" value="수정" />
		<button>
			<a href="/memberInfo/modify/delete-profile-pic/${memberVO.email}">삭제</a>
		</button>
		<button id="modalCloseProfile">닫기</button>
	</form>
</body>
</html>
