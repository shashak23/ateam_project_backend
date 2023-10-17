<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 생성</title>
<style>
    .create_container {
        display: flex;
        flex-direction: column;
    }
    .create_container > div {
        margin: 10px;
    }

    textarea {
        width: 400px;
        height: 500px;
    }
</style>
</head>
<body>
    <h1>게시글 생성</h1>
    <form method="post">
        <div class="create_container">
            <div>
                <label for="postTitle">제목</label>
                <input type="text" name="postTitle" id="postTitle" />
            </div>
            <label for="noticeContent">내용</label>
            <div>
                <textarea name="noticeContent" id="noticeContent" style="resize: none;"></textarea>
            </div>
        </div>
        <input type="submit" value="수정" />
    </form>
</body>
</html>