<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<label>소개글</label>
<div>${generalMemberVO.selfIntro}</div>
<a href="/memberInfo/modify/update-introduction/${generalMemberEmail}">수정</a>
<a href="/memberInfo/modify/delete-introduction/${generalMemberEmail}">삭제</a>
</body>
</html>