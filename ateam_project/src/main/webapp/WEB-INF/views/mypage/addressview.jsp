<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<label>주소:</label>
<div>${generalMemberVO.region}</div>
<a href="/memberInfo/modify/update-location/${generalMemberVO.generalMemberEmail}">수정</a>
<a href="/memberInfo/modify/delete-location/${generalMemberVO.generalMemberEmail}">삭제</a>
</body>
</html>