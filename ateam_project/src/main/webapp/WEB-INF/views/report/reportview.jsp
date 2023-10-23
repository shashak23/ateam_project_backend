<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글신고하기</title>
<script src="/js/lib/jquery-3.7.1.js"></script>

<style>
input[type=file] {
	padding: 0px;
}
</style>
<script>

</script>
</head>
<body>
            
<script type="text/javascript">
$().ready(function() {
	console.log($(this).parent())
    // 모달 내부 "취소" 버튼 클릭 시 모달 닫기
    $("#cancle-modal").click(function() {
        $("#report-modal").css("display", "none");
    });
    
});

function setReportTypeId(type, id){
	// jsp:param 값 변경
	var reporTypeParam = document.getElementById("reportTypeParam");
	var reportIdParam = document.getElementById("reportIdParam");
	
	reportTypeParam.value = type;
    reportIdParam.value = id;
	
}
</script>
<!-- 모달 창 -->
<div id="report-modal" class="modal">
    <div class="modal-content">
        <span class="close" id="cancle-modal">취소</span>	
		
		<!-- 모달 내용 추가 -->
		<h2>신고 내용</h2>
		<form name="reportVO" method="post" ModelAttribute="reportVO" action="/report/view">
			<div>
				
				<label for="reportReason" >신고사유${reportVO.reportReason}
				<select name="reportReason">
					<option value="6">영리 및 홍보 목적</option>
					<option value="7">개인정보노출</option>
					<option value="8">음란성/선정성</option>
					<option value="9">같은 내용 반복(도배)</option>
					<option value="10">이용규칙위반</option>
					<option value="11">기타</option>
				</select>
			</label>

			<label for = "reportReasonContent">신고 상세내용
			<textarea name="reportReasonContent" id="reportReasonContent">${reportVO.reportReasonContent}</textarea></label>
		
			<label for="attachedImg">첨부파일${reportVO.attachedImg}</label>
			<input id="attachedImg" type="file" name="attachedImg"/>
			
			<label for="reportTypeId">${reportVO.reportTypeId}</label>
			<input id="reportTypeId" type="hidden" name="reportTypeId" value="1"/>
			
			<label for="reportMemberEmail">${reportVO.reportMemberEmail}</label>
			<input id="reportMemberEmail" type="hidden" name="reportMember" value="${reportVO.reportMember}"/>
		
			<label for="receivedReportMemberEmail">${reportVO.receivedReportMemberEmail}</label>
			<input id="receivedReportMemberEmail" type="hidden" name="receivedReportMember" value="${generalPostVO.postWriter}"/>
		
			<label for="reportContentId">${reportVO.reportContentId}</label>
			<input id="reportContentId" type="hidden" name="reportContentId" value="${generalPostVO.generalPostId}"/>
			</div>
			<div class="btn-group">
				<div class="right-align">
					<input type="submit" value="완료" />

				</div>
			</div>		
		</form>
	</div>
</div>
</body>
</html>