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
	<label for="schoolName">학교명</label>
	<div>${educationVO.schoolName}</div>
	<label for="schoolDepartment">학과명</label>
	<div>${educationVO.schoolDepartment}</div>
	<label for="degree">학위</label>
	<div>${educationVO.degrees}</div>
	
	<div class="right-align">
		<a href="/memberInfo/modify/update-education/${educationVO.educationId}">수정</a>
		<a href="/memberInfo/modify/delete-education/${educationVO.educationId}">삭제</a>
	</div>
</div>
</body>
</html>