<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 해설 게시판</title>
</head>
<style>
	a:link, a:hover, a:active, a:visited {
		color: #333;
		text-decoration: none;
	}
	table.table {
		border-collapse: collapse;
		border: 1px solid #DDD;
		font-size: 14px;
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
	<div class="btn-group">
		<div class="right-align">
			<!-- 로그인 하지 않았을 때 -->
		    <c:if test="${empty sessionScope._LOGIN_USER_}">
		        <a href="/member/auth">로그인하기</a>
		    </c:if>
			<!-- 기업회원에게만 보임 -->
			<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.memberType eq 'COMPANY'}">
				<a href="/algorithm/explanation/create">게시글 등록</a>
			</c:if>
		</div>
	</div>
	<table class="table">
		<thead>
			<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>제목</th>
				<th>카테고리</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
		<c:choose>
			<c:when test="${not empty algorithmExplanationList.algorithmExplanationList}">
				<c:forEach items="${algorithmExplanationList.algorithmExplanationList}" var="algorithmexplanation">
					<tr>
						<td style="font-weight: bold;">
							<a href="/algorithm/explanation/view/${algorithmexplanation.companyAlgorithmExplanationId}">
								<c:out value="${algorithmexplanation.postTitle}" />
							</a>
						</td>
						<td>${algorithmexplanation.commonCodeVO.codeContent}</td>
						<td>${algorithmexplanation.memberVO.nickname}</td>
						<td>${algorithmexplanation.postDate}</td>
						<td>${algorithmexplanation.viewCnt}</td>
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