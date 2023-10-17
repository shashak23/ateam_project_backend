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
<h3>${careerVO.careerId}</h3>
	<label for="previousCompanyName">회사명</label>
	<div>${careerVO.previousCompanyName}</div>
	<label for="jobTitle">직무</label>
	<div>${careerVO.jobTitle}</div>
	<label for="hireDate">입사일</label>
	<div>${careerVO.hireDate}</div>
	<label for="resignDate">퇴사일</label>
	<div>${careerVO.resignDate}</div>
	
	<div class="right-align">
		<a href="/memberInfo/modify/update-career/${careerVO.careerId}">수정</a>
		<a href="/memberInfo/modify/delete-career/${careerVO.careerId}">삭제</a>
	</div>
</div>
</body>
</html>