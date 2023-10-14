<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소식 게시글 내용 조회</title>
<style type="text/css">
	* {
		color: #333;
		font-size: 17px;
	}

	div.grid {
		display: grid;
		grid-template-columns: 120px 1fr;
		grid-template-rows: 28px 28px 28px 28px 28px 28px 320px 1fr;
		row-gap: 10px;
	}
	div.grid > div.btn-group {
		display: grid;
		grid-column: 1 / 3;
	}
	div.grid div.right-align {
		text-align: right;
	}
	label {
		padding-left: 10px;
	}
	button, input, textarea {
		padding: 10px;
	}
</style>
</head>
<body>
	<h1>기업소식 게시글 내용 조회하기</h1>
	<div class="grid">
		<label for="postTitle">제목</label>
		<div>${companyNewsVO.postTitle}</div>
		
		<label for="postWriter">작성자</label>
		<div>${companyNewsVO.postWriter}</div>
		
		<label for="viewCnt">조회수</label>
		<div>${companyNewsVO.viewCnt}</div>
		
		<label for="postDate">작성일</label>
		<div>${companyNewsVO.postDate}</div>
		
		<label for="postContent">내용</label>
		<div>${companyNewsVO.postContent}</div>
		
		<div class="btn-group">
				<div class="right-align">
					<a href="/news/update/${companyNewsVO.companyNewsPostId}">수정</a>
					<a href="/news/delete/${companyNewsVO.companyNewsPostId}">삭제</a>
				</div>
		</div>
		
	</div>
</body>
</html>