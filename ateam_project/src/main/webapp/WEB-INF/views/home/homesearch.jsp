<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(funciton() {
		$.get("/member/COMPANY", function(response) {
			for (var i = 0; i < response.length; i++) {
				var member = response[i]
				var option = $("<option value='"+member.nickname+"'></option>");
				$("#nicList").append(option);
			}
		});
		$("#search-btn").click(function() {
			$("#search-form").attr({
				"method": "get",
				"action": "/home/search"
			}).submit()
		});
	})
</script>
</head>
<body>
	<div class="search_area">
		<form id="search-form"
		      method="get"
		      action="/home/search">
		     <input autocomplete="off" type="text" name="searchKeyword" list="nicList" />
		     <datalist id="nicList"></datalist>
		     <button id="search-btn">검색</button>
		</form>
	</div>
	<div class="result">
		<label for="algorithmquestion">기업 알고리즘 문제 게시판</label>
		<table class="table">
			<thead>
				<colgroup>
					<col width="190px" />
					<col width="100px" />
					<col width="200px" />
					<col width="500px" />
					<col width="70px" />
					<col width="80px" />
				</colgroup>
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
				<c:when test="${not empty searchAlgorithmQuestionList.searchAlgorithmQuestionList}">
					<c:forEach items="${searchAlgorithmQuestionList.searchAlgorithmQuestionList}" var="algorithmquestion">
						<tr>
							<td>${algorithmquestion.commonCodeVO.codeContent}</td>
							<td>${algorithmquestion.memberVO.nickname}</td>
							<td style="font-weight: bold;">
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
						<td colspan="6">조회된 게시글이 없습니다.</td>
					</tr>
					
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>