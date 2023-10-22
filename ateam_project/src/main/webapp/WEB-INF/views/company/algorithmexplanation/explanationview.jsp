<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 해설 내용 조회</title>
<style type="text/css">
	* {
		color: #333;
		font-size: 17px;
	}

	div.grid {
		display: grid;
		grid-template-columns: 120px 1fr;
		grid-template-rows: 28px 28px 28px 28px 28px 28px 28px 28px;
		row-gap: 10px;
	}
	div.btn-group {
		display: grid;
		grid-column: 1 / 3;
	}
	div.right-align {
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
	<h1>알고리즘 해설 내용 조회하기</h1>
	<div class="grid">
		
		<label for="postTitle">제목</label>
		<div>${algorithmExplanationVO.postTitle}</div>
		
		<label for="algorithmWriter">작성자</label>
		<div>${algorithmExplanationVO.memberVO.nickname}</div>
		
		<label for="algorithmCategoryId">카테고리</label>
		<div>${algorithmExplanationVO.commonCodeVO.codeContent}</div>
		
		<label for="viewCnt">조회수</label>
		<div>${algorithmExplanationVO.viewCnt}</div>
		
		<label for="postDate">작성일</label>
		<div>${algorithmExplanationVO.postDate}</div>
		
		<label for="postContent">내용</label>
		<div>${algorithmExplanationVO.postContent}</div>
		
		<div class="btn-group">
		    <!-- 로그인 하지 않았을 때 -->
		    <c:if test="${empty sessionScope._LOGIN_USER_}">
		        <a href="/member/auth">로그인하기</a>
		    </c:if>
		    <!-- 해당 게시글을 작성한 기업회원이 로그인 했을 시 -->
		    <c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq algorithmExplanationVO.postWriter}">
			    <a href="/algorithm/explanation/update/${algorithmExplanationVO.companyAlgorithmExplanationId}">수정</a>
			    <a href="/algorithm/explanation/delete/${algorithmExplanationVO.companyAlgorithmExplanationId}">삭제</a>
		    </c:if>
		</div>
	</div>
</body>
</html>