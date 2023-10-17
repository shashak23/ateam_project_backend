<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<form method="post" action="/memberInfo/modify/update-sns-link">
	<input type="hidden" name="generalMemberEmail" value="${generalMemberVO.generalMemberEmail }"/>
<label>Github 주소</label>
<input type="text" id="githubUrl" name="githubUrl" value="${generalMemberVO.githubUrl}" placeholder="Github Url">
<label>이메일 주소</label>
<input type="email" id="additionalEmail" name="additionalEmail" value="${generalMemberVO.additionalEmail}" placeholder="Email Url">
<label>Blog 주소</label>
<input type="text" id="blogUrl" name="blogUrl" value="${generalMemberVO.blogUrl}" placeholder="Blog Url">
<input type="submit" value="수정" />
</form>
</body>
</html>





