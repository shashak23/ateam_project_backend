<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri ="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>근무 정보 입력</title>
    <!-- jQuery와 jQuery UI 스타일시트를 포함 -->
    <script src="/js/lib/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- jQuery UI DatePicker를 한국어로 설정 -->
   <script type="text/javascript">
    $().ready(function() {
    	$("#hireDate, #resignDate").change(function() {
            var currentDate = new Date(); // 현재 날짜 가져오기
            var hireDateValue = $("#hireDate").val();
            var resignDateValue = $("#resignDate").val();
            
            // 빈 값인 경우 비교하지 않음
            if (hireDateValue && resignDateValue) {
                var hireDate = new Date(hireDateValue);
                var resignDate = new Date(resignDateValue);
                
                if (hireDate > currentDate || resignDate > currentDate) {
                    alert("입사일과 퇴사일은 현재 날짜보다 클 수 없습니다.");
                    // 입사일과 퇴사일을 초기화
                    $("#hireDate").val("");
                    $("#resignDate").val("");
                } else if (hireDate > resignDate) {
                    alert("입사일이 퇴사일보다 이후일 수 없습니다.");
                    // 입사일을 초기화
                    $("#hireDate").val("");
                }
                else if (hireDate === resignDate) {
                    alert("입사일이 퇴사일보다 이후일 수 없습니다.");
                    // 입사일을 초기화
                    $("#hireDate").val("");
                }
                else if (hireDate.toDateString() === resignDate.toDateString()) {
                    alert("입사일과 퇴사일이 같을 수 없습니다.");
                    // 입사일과 퇴사일을 초기화
                    $("#hireDate").val("");
                    $("#resignDate").val("");
                }
            }
        });
        $("#previousCompanyName").click(function() {
    	      $(".companyName_errors").hide();
    	  });
    	
    	  $("#jobTitle").click(function() {
    	      $(".jobTitle_errors").hide();
    	  });
    	  $("#hireDate").click(function() {
    	      $(".hireDate_errors").hide();
    	  });
    	  
    });
</script>
<style type="text/css">
.companyName_errors,
.jobTitle_errors,
.hireDate_errors {
	opacity: 0.8;
	padding: 10px;
	color: red;
	font-size: 10pt;
}
</style>
</head>
<body>
    <form:form modelAttribute="careerVO" method="post">
        <div>
            <label for="previousCompanyName">근무 회사명:</label>
            <input type="text" id="previousCompanyName" name="previousCompanyName" >
            <form:errors path="previousCompanyName" element="div" cssClass="companyName_errors" />
        </div>
        <div>
            <label for="jobTitle">직무명:</label>
            <input type="text" id="jobTitle" name="jobTitle">
            <form:errors path="jobTitle" element="div" cssClass="jobTitle_errors" />
        </div>
        <div>
            <label for="hireDate">입사일:</label>
            <input type="date" id="hireDate" name="hireDate" class="date-picker" placeholder="YYYY-MM-DD" >
            <form:errors path="hireDate" element="div" cssClass="hireDate_errors" />
        </div>
        <div>
            <label for="resignDate">퇴사일:</label>
            <input type="date" id="resignDate" name="resignDate" class="date-picker" placeholder="YYYY-MM-DD" >
        </div>
        <input type="submit" value="저장">
        <button id="modalCloseCareer">닫기</button>
    </form:form>
</body>
</html> --%>