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
	<label for="qnaboard">QnA 게시판</label>
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
			<c:when test="${not empty qnaPostList}">
				<c:forEach items="${qnaPostList}" var="myqnapost">
					<tr>
						<td style="font-weight: bold;">
							<a href="/qnaboard/view/${myqnapost.generalPostId}">
								<c:out value="${myqnapost.postTitle}" />
							</a>
						</td>
						<td>${myqnapost.memberVO.nickname}</td>
						<td>${myqnapost.postDate}</td>
						<td>${myqnapost.viewCnt}</td>
						<td>${myqnapost.likeCnt}</td>
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

	
	<label for="freepost">자유 게시판</label>
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
			<c:when test="${not empty freePostList}">
				<c:forEach items="${freePostList}" var="myfreepost">
					<tr>
						<td style="font-weight: bold;">
							<a href="/freeboard/view/${myfreepost.generalPostId}">
								<c:out value="${myfreepost.postTitle}" />
							</a>
							
						</td>
						<td>${myfreepost.memberVO.nickname}</td>
						<td>${myfreepost.postDate}</td>
						<td>${myfreepost.viewCnt}</td>
						<td>${myfreepost.likeCnt}</td>
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