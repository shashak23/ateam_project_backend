<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>



</head>
<body>

	<form:form modelAttribute="memberVO" method="post" action="/memberInfo/modify/update-password">
	<input type="hidden" name="email" value="${memberVO.email}" />
 		<div>
			<form:errors path="pw" element="div" cssClass="errors" />
            <form:errors path="confirmPw" element="div" cssClass="errors" />
		</div>
	
				<h2>비밀번호 수정</h2>
				<label for="pw">비밀번호</label> 
				<input type="password" name="pw" id="pw">
				 <label for="confirmPw">비밀번호 확인</label>
            <input id="confirmPw" type="password" name="confirmPw"/>
					<input id="btn-regist" 
                       type="submit" value="수정" />
	</form:form>
</body>
</html>