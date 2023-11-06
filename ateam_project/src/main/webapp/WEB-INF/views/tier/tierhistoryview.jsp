<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 활동 내역 조회</title>
</head>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript"></script>
<body>
	<h2>멤버 활동 내역 조회</h2>
	<c:forEach items="${generalMemberListVO}" var="result">
		<ul>
			<li>${result}</li>
			<li>${result.GENERAL_MEMBER_EMAIL}</li>
			<li><a href="/freeboard/view/${result.GENERAL_POST_ID}">${result.GENERAL_POST_ID}</a></li>
			<li>${result.TYPE}</li>
		</ul>
	</c:forEach>
</body>
</html>