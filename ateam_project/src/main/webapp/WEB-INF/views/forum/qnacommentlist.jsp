<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <title>게시물 및 댓글 리스트</title>
</head>
<body>

<h2>게시물 내용</h2>
<c:out value="${generalPostVO.postContent}" />

<h2>댓글 리스트</h2>
<c:forEach var="comment" items="${commentList}">
    <div>
        <p>댓글 작성자: ${comment.commentWriterId}</p>
        <p>댓글 내용: ${comment.commentContent}</p>
        <p>작성일: ${comment.postDate}</p>
        <!-- 여기에 필요한 댓글 정보 추가 -->
    </div>
</c:forEach>

<!-- 댓글 입력 폼 -->
<form action="/qnapost/comments/create" method="post">
    <input type="hidden" name="generalPostId" value="${generalPostVO.generalPostId}" />
    <textarea name="commentContent" placeholder="댓글을 입력하세요"></textarea>
    <input type="submit" value="댓글 등록" />
</form>

</body>
</html>