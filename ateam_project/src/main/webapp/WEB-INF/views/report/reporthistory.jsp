<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내역조회</title>
</head>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $().ready(function() {
        $("#reportTypeSelect").on("change", function() {
            var selectedValue = $(this).val();
			// let data = {};
			// data.reportTypeId = "id"
			// data.reportReasonContent = "value"
			// data = JSON.stringify(data)
            $.ajax({
                method: "POST",
				url: "/report/list",
				contentType: "application/json",
				// contentType: "application/json; charset=UTF-8",
                // data: JSON.stringify(selectedValue),
				data: selectedValue,
                success: function(response) {
					console.log(response)
					for (var i = 0; i < response.length; i++) {
						console.log(i)

					}
                }
            });
			if (selectedValue == "all") {
				$(".allReportList").css("display", "")
			} else {
				$(".allReportList").css("display", "none")
			}
		// $.post("/report/list", selectedValue, function(response) {
		// 	console.log(response)
		// })
		// list는 절.대. post로 보내지 말것
		// 스프링에 보낼거면 map을 json 형태로 변환해서 보내라
		// 스프링에서 받을 때는 vo를 받는게 최고 (vo->json)
        });
    });
</script>
<body>
<div class="reportType_select_box">
	<form>
    <label for="reportTypeSelect">신고대상을 선택하세요:</label>
	    <select name="reportTypeSelect" id="reportTypeSelect">
	        <option id="all" value="all">전체</option>
	        <option id="freeboard" value="freeboard">자유게시판 게시글</option>
	        <option id="freecomment" value="freecomment">자유게시판 댓글</option>
	        <option id="qnaboard" value="qnaboard">질답게시판 게시글</option>
	        <option id="qnacomment" value="qnacomment">질답게시판 댓글</option>
	        <option id="generalmember" value="generalmember">유저</option>
	    </select>
	</form>
</div>
<div class="report_list">
	<table>
		<thead>
			<tr>
				<th>신고번호</th>
				<th>내용</th>
				<th>신고사유</th>
				<th>신고일자</th>
				<th>처리진행상황</th>
			</tr>
		</thead>
		<tbody id="reportListArea">
			<c:forEach items="${reportListVO.reportList}" var="report">
				<tr class="allReportList">
					<td>${report.reportId}</td>
					<td>${report.reportReasonContent}</td>
					<td>${report.commonCodeVO.codeContent}</td>
					<td>${report.reportDate}</td>
					<td>${report.progressYn}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>