<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<form method="post" action="/memberInfo/modify/update-introduction">
<input type="hidden" name="generalMemberEmail" value="${sessionScope._LOGIN_USER_.email}"/>
<label>자기소개 </label>
<textarea name="selfIntro" id="selfIntro" placeholder="간단한 문구를 입력해 주세요 😊" style="height: 50px">
${generalMemberVO.selfIntro}
</textarea>
<input type="submit" value="수정" />
</form>
</body>
</html>





