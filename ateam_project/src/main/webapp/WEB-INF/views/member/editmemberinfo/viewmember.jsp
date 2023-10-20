<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.right align{
	text-align : right
}
</style>
</head>
<body>
<div>
	<label for="email">이메일</label>
	<div>${memberVO.email}</div>
		<label for="nickname">닉네임</label>
	<div>${memberVO.nickname}</div>	
	<div class="right-align">
		<a href="/memberInfo/modify/update-nickname/${memberVO.email}">수정</a>
	</div>
	<div>
		<label for="nickname">비밀번호</label>
		<a href="/memberInfo/modify/update-password/${memberVO.email}">수정</a>	
	</div>
</div>
</body>
</html>