<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 문제 내용 조회</title>
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
	<h1>알고리즘 문제 내용 조회하기</h1>
	<div class="grid">
		
		<label for="algorithmTitle">제목</label>
		<div>${algorithmQuestionVO.algorithmTitle}</div>
		
		<label for="algorithmWriter">작성자</label>
		<div>${algorithmQuestionVO.algorithmWriter}</div>
		
		<label for="algorithmContent">문제 내용</label>
		<div>${algorithmQuestionVO.algorithmContent}</div>
		
		<form:form>
		<hidden>
		
		<label for="webIDE">웹IDE</label> <!-- 웹IDE 테이블에 신규생성? -->
		<div></div>
		</form:form>
		
		<label for="result">실행결과</label> <!-- 자동으로 랜덤 데이터 넣기 -->
		<div></div>
		
		<div class="btn-group">
				<div class="right-align">
					<a href="/algorithm/question/update/${algorithmQuestionVO.companyAlgorithmQuestionId}">수정</a>
					<a href="/algorithm/question/delete/${algorithmQuestionVO.companyAlgorithmQuestionId}">삭제</a>
				</div>
		</div>
		
	</div>
</body>
</html>