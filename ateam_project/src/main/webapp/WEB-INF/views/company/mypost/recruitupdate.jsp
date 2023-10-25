<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 수정 ${companyRecruitVO.companyRecruitPostId}번글</h1>
	
	<form method="post" action="/recruit/update" modelAttribute="companyRecruitVO">
		<input type="hidden" name="companyRecruitId" value="${companyRecruitVO.companyRecruitId}"/>
	
	
	</form>
</body>
</html>