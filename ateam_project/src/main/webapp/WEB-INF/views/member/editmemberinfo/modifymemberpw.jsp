<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 수정</title>

<style type="text/css">
 .errors {
        opacity: 0.8;
        padding: 10px;
        color: red;
        font-size: 10pt;
        display: inline-block;
    }
    .errors:last-child {
        margin-bottom: 15px;
    }
    .err_password, .err_confirm_password {
    color: red;
    font-size: 10pt;
}
</style>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
$().ready(function() {
	$("#confirmPw").on("input", function() {
	    var pw = $("#pw").val();
	    var confirmPw = $(this).val();
	    var errConfirmPassword = $(".err_confirm_password");
	    
	    
	    if (pw === confirmPw) {
	        errConfirmPassword.text(""); 
	    } else {
	        errConfirmPassword.text("* 비밀번호가 일치하지 않습니다.");
	    }
	
	    // 비밀번호 길이 확인
	    if (pw.length >= 5 && pw.length <= 10) {
	        $(".err_password").text(""); 
	    } else {
	        $(".err_password").text("* 5~10글자까지만 입력 가능합니다.");
	    }
	});
});
</script>
</head>
<body>

	<form:form modelAttribute="memberVO" method="post"
		action="/memberInfo/modify/update-password">
		<input type="hidden" name="email" value="${memberVO.email}" />
		<h2>비밀번호 수정</h2>
		<label for="pw">비밀번호</label>
		<input type="password" name="pw" id="pw">
		 <br><span class="err_password"></span>
		<form:errors path="pw" element="div" cssClass="errors" />
		<div>
		<label for="confirmPw">비밀번호 확인</label>
		<input id="confirmPw" type="password" name="confirmPw" />
		<input id="btn-regist" type="submit" value="수정" />
		 <br><span class="err_confirm_password"></span>
		
		<form:errors path="confirmPw" element="div" cssClass="errors" />
		</div>
	</form:form>
</body>
</html>