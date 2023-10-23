<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 조회</title>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
$().ready(function() {
	$("#search").selected(function(){
		$("#select-form").attr({
			"method": "get",
			"action": "/mypost"
		}).submit()
	});
});
</script>
</head>
<body>
<!-- 
	<div>
		<form id="select-form"
		      method="get"
		      action="/mypost">
		    <select id="search" name="searchType">
		    	<option value="" ${SearchForumVO.searchType eq '""' ? 'selected' : ''}>자유게시판</option>
				<option value="" ${SearchForumVO.searchType eq 'qnaboard' ? 'selected' : ''}>QnA게시판</option>
		    </select>
		</form>
	</div>
 -->
	<table class="table">
		<thead>
			<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요수</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty generalPostList.generalPostList}">
				<c:forEach items="${generalPostList.generalPostList}" var="mypost">
					<tr>
						<td>${mypost.postTitle}</td>
						<td>${mypost.memberVO.nickname}</td>
						<td>${mypost.viewCnt}</td>
						<td>${mypost.likeCnt}</td>
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

	
	<!-- 
	
	
	<label for="myQnABoard">QnA게시판</label>
	<table class="table">
		<thead>
			<colgroup>
				<col width="190px" />
				<col width="100px" />
				<col width="100px" />
				<col width="70px" />
				<col width="70px" />
			</colgroup>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요수</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty generalPostList.generalPostList}">
				<c:forEach items="${generalPostList.generalPostList}" var="myqnaboard">
					<tr>
						<td style="font-weight: bold;">
							<a href="/qnaboard/view/${myqnaboard.generalPostId}">
								<c:out value="${myqnaboard.postTitle}" />
							</a>
						</td>
						<td>${myqnaboard.memberVO.nickname}</td>
						<td>${myqnaboard.viewCnt}</td>
						<td>${myqnaboard.likeCnt}</td>
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
 -->
</body>
</html>