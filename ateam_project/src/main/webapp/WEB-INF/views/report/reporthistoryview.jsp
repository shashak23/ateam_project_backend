<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고물 내용 조회</title>
<style type="text/css">
a:link, a:hover, a:visited, a:active {
color: #333;
text-decoration: none;
}
div.grid {
display: grid;
grid-template-columns: 120px 1fr;
grid-template-rows: 45px 45px 45px 45px 45px 45px 45px 320px 300px 1fr;
row-gap: 10px;
}
div.grid > div.btn-group {
display: grid;
grid-column: 1 / 3;
}
div.grid div.right-align {
    text-align: right;
}
label{
    padding-left: 10px;
}
button, input, textarea {
    padding: 10px;
}
</style>
</head>
<body>
<h1>신고물 조회</h1>
    <div class="grid">
        <label for="reportId">신고 ID</label>
        <div>${reportVO.reportId}</div>
        <label for="reportDate">신고 날짜</label>
        <div>${reportVO.reportDate}</div>
        <label for="reportMember">신고한 유저</label>
        <div>${reportVO.reportMember}</div>
        <label for="receivedReportMember">신고당한 유저</label>
        <div>${reportVO.receivedReportMember}</div>
        <label for="reportContentId">신고물 고유 ID</label>
        <div><a href="/freeboard/view/${reportVO.reportContentId}">${reportVO.reportContentId}</a></div>
        <label for="reportTypeId">신고 유형</label>
        <div>${reportVO.reportTypeId}</div>
        <label for="reportReason">신고 사유</label>
        <div>${reportVO.reportReason}</div>
        <label for="reportReasonContent">신고 사유 상세</label>
        <div>${reportVO.reportReasonContent}</div>
        <label for="attachedImg">신고 첨부 파일</label>
        <div>${reportVO.attachedImg}</div>
        <label for="progressYn">처리 여부</label>
        <div>${reportVO.progressYn}</div>

        <div class="btn-group">
            <div class="right-align">
                <a href="/board/modify/${boardVO.id}">경고누적</a>
                <a href="/board/modify/${boardVO.id}">회원탈퇴</a>
                <a href="/board/delete/${boardVO.id}">처리완료</a>
            </div>
        </div>
    </div>
</body>
</html>
