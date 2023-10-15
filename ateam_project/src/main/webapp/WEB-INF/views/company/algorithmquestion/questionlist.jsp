<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 문제 게시판</title>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#search-btn").click(function() {
			$("#search-form").attr({
				"method": "get",
				"action": "/algorithm/question/list"
			}).submit()
		})
	})
</script>
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
    <form id="search-form"
	      method="get"
	      action="/algorithm/question/list">
	      	<div>
			    <select name="searchType">
			        <option value="algorithmTitle" ${searchAlgorithmQuestionVO.searchType eq 'algorithmTitle' ? 'selected':''}>제목</option>
			        <option value="algorithmContent" ${searchAlgorithmQuestionVO.searchType eq 'algorithmContent' ? 'selected':''}>내용</option>
			        <option value="algorithmWriter" ${searchAlgorithmQuestionVO.searchType eq 'algorithmWriter' ? 'selected':''}>기업명</option>
			    </select>
			    <input type="text" name="searchKeyword" value="${searchAlgorithmQuestionVO.searchKeyword}"/>
			    <button id="search-btn">검색</button>
	      </div>
	</form>
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
						<td>${algorithmquestion.memberVO.nickname}</td>
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