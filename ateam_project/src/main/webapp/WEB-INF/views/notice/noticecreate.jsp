<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 생성</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    .create_container {
        display: flex;
        flex-direction: column;
        width: 500px;
        height: 800px;
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
    <form method="post">
        <h1>공지 생성</h1>
        <div class="create_container">
            <div>
                <label for="postTitle">제목</label>
                <input type="text" name="postTitle" id="postTitle" />
            </div>
            <label for="noticeContent">내용</label>
            <div>
                <textarea name="noticeContent" id="noticeContent" style="resize: none;"></textarea>
            </div>
            <label for="start-date">시작일</label>
            <input type="date" name="releaseStartDate" id="start-date" />
            <label for="end-date">종료일</label>
            <input type="date" name="releaseEndDate" id="end-date" />
        </div>
        <input type="submit" value="생성" />
    </form>
    <script>
        let startDate = document.getElementById('start-date')
        let endDate = document.getElementById('end-date')

        startDate.addEventListener('change', function(e) {
            console.log(e)
        })
    </script>
</body>
</html>