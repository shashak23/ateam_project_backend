<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 조회</title>
</head>
<body>
	<h3 for="companynews">기업소식 게시판</h3>
	<table class="table">
		<thead>
			<colgroup>
				<col width="50px" />
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty companyNewsList.companyNewsList}">
				<c:forEach items="${companyNewsList.companyNewsList}" var="companynews" varStatus="index">
					<tr>
						<td>${index.index + 1}</td>
						<td style="font-weight: bold;">
							<a href="/news/view/${companynews.companyNewsPostId}">
								<c:out value="${companynews.postTitle}" />
							</a>
							
						</td>
						<td>${companynews.memberVO.nickname}</td>
						<td>${companynews.postDate}</td>
						<td>${companynews.viewCnt}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<p></p>
	<h3 for="algorithmquestion">알고리즘 문제 게시판</h3>
	<table class="table">
		<thead>
			<colgroup>
				<col width="50px" />
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
				<c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion" varStatus="index">
					<tr>
						<td>${index.index + 1}</td>
						<td style="font-weight: bold;">
							<a href="/algorithm/question/view/${algorithmquestion.companyAlgorithmQuestionId}">
								<c:out value="${algorithmquestion.algorithmTitle}" />
							</a>
							
						</td>
						<td>${algorithmquestion.memberVO.nickname}</td>
						<td>${algorithmquestion.postDate}</td>
						<td>${algorithmquestion.viewCnt}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<p></p>
	<h3 for="algorithmexplanation">알고리즘 해설 게시판</h3>
	<table class="table">
		<thead>
			<colgroup>
				<col width="50px" />
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
				<c:forEach items="${algorithmExplanationList.algorithmExplanationList}" var="algorithmexplanation" varStatus="index">
					<tr>
						<td>${index.index + 1}</td>
						<td style="font-weight: bold;">
							<a href="/algorithm/explanation/view/${algorithmexplanation.companyAlgorithmExplanationId}">
								<c:out value="${algorithmexplanation.postTitle}" />
							</a>
							
						</td>
						<td>${algorithmexplanation.memberVO.nickname}</td>
						<td>${algorithmexplanation.postDate}</td>
						<td>${algorithmexplanation.viewCnt}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</body>
</html>