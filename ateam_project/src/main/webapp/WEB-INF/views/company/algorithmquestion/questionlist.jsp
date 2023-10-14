<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 문제 게시판</title>
</head>
<style >
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}

	table.table {
		border-collapse: collapse;
		border: 1px solid #DDD;
		margin: 10px;
	}
	table.table > thead > tr {
		background-color: #FFF;
	}
	table.table > thead th {
		padding: 10px;
		color:#333;
	}
	table.table th, table.table td {
		border-right: 1px solid #F0F0F0;
	}
	table.table th:last-child, table.table td:last-child {
		border-right: none;
	}
	table.table > tbody tr:nth-child(odd) {
		background-color: #f5f5f5;
	}
	table.table > tbody tr:hover {
		background-color: #FAFAFA;
	}
	table.table > tbody td {
		padding: 10px;
		color: #333;
	}



</style>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>카테고리</th>
				<th>작성자</th>
				<th>문제 제목</th>
				<th>문제 내용 미리보기</th>
				<th>난이도</th>
				<th>정답률</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
				<c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion">
					<tr>
						<td>${algorithmquestion.algorithmCategoryId}</td>
						<td>${algorithmquestion.algorithmWriter}</td>
						<td>
							<a href="/algorithm/question/view/${algorithmquestion.companyAlgorithmQuestionId}">
								<c:out value="${algorithmquestion.algorithmTitle}" />
							</a>
						</td>
						<td>${algorithmquestion.algorithmContent}</td>
						<td>${algorithmquestion.algorithmTierId}</td>
						<td>정답률</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>

	


</body>
</html>