<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
   .errors {
        opacity: 0.8;
        padding: 10px;
        color: red;
        font-size: 10pt;
    }
    .errors:last-child {
        margin-bottom: 15px;
    }
    .available {
        background-color: #0f03;
    }
    .unusable {
        background-color: #f003;
    }
</style>
	<script src="/js/lib/jquery-3.7.1.js"></script>
	<script type="text/javascript">
    $().ready(function(){
        $("#nickname").keyup(function(){
            $.get("/memberInfo/modify/update-nickname/vaildation", {
            	nickname: $("#nickname").val()
            }, function(response) {
                var nickname = response.nickname
                var available = response.available

                if (available) {
                    $("#nickname").addClass("available")
                    $("#nickname").removeClass("unusable")
                    $("#btn-regist").removeAttr("disabled")
                }
                else {
                    $("#nickname").addClass("unusable")
                    $("#nickname").removeClass("available")
                    $("#btn-regist").attr("disabled", "disabled")
                }
            })
        })
    })
</script>

</head>
<body>

	<form:form modelAttribute="memberVO" method="post" action="/memberInfo/modify/update-nickname">
	<input type="hidden" name="email" value="${memberVO.email}" />
			
	
				<h2>닉네임 수정</h2>
				<label for="nickname">닉네임</label> 
				<input type="text" name="nickname" id="nickname" value="${memberVO.nickname}">
					<input id="btn-regist" disabled="disabled"
                       type="submit" value="수정" />
				<form:errors path="nickname" element="div" cssClass="errors" />	
	</form:form>
</body>
</html>