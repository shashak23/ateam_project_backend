<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 목록 테스트</title>
<style>
    .div_wrapper {
        display: flex;
        flex-direction: column;
        padding-bottom: 15px;
        border: 1px solid #888;
        margin-bottom: 25px;
    }
    .anchor {
        display: flex;
    }
    a {
        padding: 5px 8px;
        text-decoration: none;
        color: #4052f7;
        background-color: #d0eaff;
        margin-right: 15px;
        border-radius: 10px;
        font-weight: bold;
    }
</style>
</head>
<body>
    <div>
        <div>
            <a href="/notice/create">생성하기</a>
        </div>
        <c:forEach items="${noticeList.noticeList}" var="item">
        <div class="div_wrapper">
            <h1>제목: ${item.postTitle}</h1>
            <p>내용: ${item.noticeContent}</p>
            <div>게시일: ${item.releaseStartDate}</div>
            <div>마감일: ${item.releaseEndDate}</div>
            <div class="anchor">
                <a href="/notice/modify/${item.noticeId}">수정하기</a>
                <a href="/notice/delete/${item.noticeId}">삭제하기</a>
            </div>
        </div>    
        </c:forEach>
    </div>
</body>
</html>