<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>힘들다...</title>
<style>
    .container {
        display: flex;
        width: 920px;
        flex-wrap: wrap;
    }

    .box {
        border: 1px solid #333;
        width: 400px;
        height: 200px;
        overflow: auto;
        margin: 10px;
    }
</style>
</head>
<body>
    <div>로그인 정보: ${sessionScope._LOGIN_USER_.email}</div>
    <div class="container">
        <c:forEach items="${myAlgorithmList.myAlgorithmList}" var="myAlgo">
            <div class="box">
                <div>제목: ${myAlgo.companyAlgorithmQuestionVO.postTitle}</div>
                <div>제출회사: ${myAlgo.companyAlgorithmQuestionVO.postWriter}</div>
                <p>내용: ${myAlgo.companyAlgorithmQuestionVO.postContent}</p>
                <p>조회수: ${myAlgo.companyAlgorithmQuestionVO.viewCnt}</p>
                <p>좋아요 수: ${myAlgo.companyAlgorithmQuestionVO.likeCnt}</p>
                <p>정답여부: ${myAlgo.correctAnswerYn}</p>
                <p>제출한 답: ${myAlgo.myAnswer}</p>
            </div>
        </c:forEach>
    </div>

</body>
</html>