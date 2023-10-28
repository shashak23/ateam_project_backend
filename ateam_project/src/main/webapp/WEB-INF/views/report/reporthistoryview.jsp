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
    grid-template-columns: 120px 200px 1fr;
    grid-template-rows: 45px 45px 45px 45px 45px 45px 45px 100px 240px 45px 1fr;
    row-gap: 10px;
}
/* div.grid > div.non-user {
    display: grid;
    grid-column: 3 / 4;
} */
div.grid > div.btn-group {
    display: grid;
    grid-column: 0 / 3;
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
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $().ready(function() {
        $("#reportHandlingStatus").click(function(){
            let value = "reportHandlingStatus"
            let currentURL = window.location.href;
            $.post(currentURL, {value: value}, function(response) {
                alert("변경완료");
                $(document).on("click", function(){
                    window.location.href = "http://localhost:8080/admin/report/list";
                })
                
            })
        })

        $("#backToTheList").click(function(){
            window.location.href = "/admin/report/list";
        })
    })
</script>
</head>
<body>
<h1>신고물 조회</h1>
    <div class="grid">
        <label for="reportId">신고 ID</label>
        <div>${reportVO.reportId}</div>
        <div></div>

        <label for="reportDate">신고 날짜</label>
        <div>${reportVO.reportDate}</div>
        <div></div>

        <label for="reportMember">신고한</br>유저</label>
        <div>${reportVO.reportMember}</div>
        <div>
            <input type="button" value="경고누적">
            <input type="button" value="회원탈퇴">
        </div>

        <label for="receivedReportMember">신고당한</br>유저</label>
        <div>${reportVO.receivedReportMember}</div>
            <div>
                <input type="button" value="경고누적">
                <input type="button" value="회원탈퇴">
            </div>

		<form:form name="reportVO" method="post" action="/freeboard/view/${reportVO.reportContentId}">
        <label for="reportContentId">신고물</br>고유 ID</label>
        </form:form>
        <div>${reportVO.reportContentId}</a></div>
        <div></div>
        
        <label for="reportTypeId">신고 유형</label>
        <div>${reportVO.reportTypeId}</div>
        <div></div>
        
        <label for="reportReason">신고 사유</label>
        <div>${reportVO.reportReason}</div>
        <div></div>
        
        <label for="reportReasonContent">신고 사유</br>상세</label>
        <div>${reportVO.reportReasonContent}</div>
        <div></div>
        
        <label for="attachedImg">신고</br>첨부 파일</label>
        <div>${reportVO.attachedImg}</div>
        <div></div>
        
        <label for="progressYn">처리 여부</label>
        <div>${reportVO.progressYn}</div>
        <div></div>

		<form>
        <div class="btn-group">
            <div class="right-align">
                <input type="button" id=reportHandlingStatus value="처리완료상태 변경">
                <input type="button" id=backToTheList value="목록으로 돌아가기">
            </div>
        </div>
        </form>
    </div>
</body>
</html>
