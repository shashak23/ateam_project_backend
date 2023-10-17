<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정 페이지</title>
<style>
    .modify_container {
        display: flex;
        flex-direction: column;
    }
    .modify_container > div {
        margin: 10px;
    }

    textarea {
        width: 400px;
        height: 500px;
    }
</style>
</head>
<body>
    <h1>게시글 수정</h1>
    <form method="post" action="/notice/modify">
        <input type="hidden" name="noticeId" value="${notice.noticeId}">
        <div class="modify_container">
            <div>
                <label for="postTitle">제목</label>
                <input type="text" name="postTitle" id="postTitle" value="${notice.postTitle}">
            </div>
            <label for="noticeContent">내용</label>
            <div>
                <textarea name="noticeContent" id="noticeContent" style="resize: none;">${notice.noticeContent}</textarea>
            </div>
        </div>
        <input type="submit" value="수정">
    </form>
</body>
</html>