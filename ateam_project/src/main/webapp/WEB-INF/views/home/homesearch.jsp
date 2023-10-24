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
	$().ready(function() {
		$.get("/member/COMPANY", function(response) {
			for (var i = 0; i < response.length; i++) {
				var member = response[i]
				var option = $("<option value='"+member.nickname+"'></option>");
				$("#nicList").append(option);
			}
		});
		$.get("/member/GENERAL", function(response) {
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
	});
</script>
</head>
<body>
	<div class="search_area">
		<form id="search-form"
		      method="get"
		      action="/home/search">
		     <input autocomplete="off" type="text" name="searchKeyword" list="nicList" placeholder="검색어를 입력해주세요"/>
		     <datalist id="nicList"></datalist>
		     <button id="search-btn">검색</button>
		</form>
	</div>
	<div class="result">
		<h3>People</h3>
		<c:choose>
			<c:when test="${not empty generalMemberList}">
				<c:forEach items="${generalMemberList}" var="generalmember">
					<img style="width: 50px; height: 50px;" src="${generalmember.profilePic}" />
					<a href="/memberinfo/view/${generalmember.email}">
						<c:out value="${generalmember.nickname}" />
					</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				No Result
			</c:otherwise>
		</c:choose>
		<p></p>
		<h3>Company</h3>
		<c:choose>
			<c:when test="${not empty companyMemberList}">
				<c:forEach items="${companyMemberList}" var="company">
					<img style="width: 50px; height: 50px;" src="${company.profilePic}" />
					${company.nickname}
				</c:forEach>
			</c:when>
			<c:otherwise>
				No Result
			</c:otherwise>
		</c:choose>
		<p></p>
		<h3>QnA 게시판</h3>
		<table class="table">
			<thead>
				<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty generalPostList.generalPostList}">
					<c:forEach items="${generalPostList.generalPostList}" var="qnaboard">
						<c:if test="${qnaboard.boardId eq 'CC-20231017-000030'}">
							<tr>
								<td style="font-weight: bold;">
									<a href="/qnaboard/view/${qnaboard.generalPostId}">
										<c:out value="${qnaboard.postTitle}" />
									</a>
								</td>
								<td>${qnaboard.memberVO.nickname}</td>
								<td>${qnaboard.postDate}</td>
								<td>${qnaboard.viewCnt}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 게시글이 없습니다.</td>
					</tr>
					
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<p></p>
		<h3>자유게시판</h3>
		<table class="table">
			<thead>
				<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty generalPostList.generalPostList}">
					<c:forEach items="${generalPostList.generalPostList}" var="freeboard">
						<c:if test="${freeboard.boardId eq 'CC-20231017-000030'}">
							<tr>
								<td style="font-weight: bold;">
									<a href="/freeboard/view/${freeboard.generalPostId}">
										<c:out value="${freeboard.postTitle}" />
									</a>
								</td>
								<td>${freeboard.memberVO.nickname}</td>
								<td>${freeboard.postDate}</td>
								<td>${freeboard.viewCnt}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<p></p>
		<h3>기업 알고리즘 문제 게시판</h3>
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
				<c:when test="${not empty algorithmQuestionList.algorithmQuestionList}">
					<c:forEach items="${algorithmQuestionList.algorithmQuestionList}" var="algorithmquestion">
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
		<p></p>
		<h3>기업 알고리즘 해설 게시판</h3>
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
						<td colspan="5">조회된 게시글이 없습니다.</td>
					</tr>
					
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<p></p>
		<h3>기업 소식 게시판</h3>
		<table class="table">
			<thead>
				<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty companyNewsList.companyNewsList}">
					<c:forEach items="${companyNewsList.companyNewsList}" var="companynews">
						<tr>
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
						<td colspan="4">조회된 게시글이 없습니다.</td>
					</tr>
					
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>