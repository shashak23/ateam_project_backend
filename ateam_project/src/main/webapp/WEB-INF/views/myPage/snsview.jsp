<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
Github : ${generalMemberVO.githubUrl}
<div>
<button><a href="/memberInfo/modify/delete-git-link/${generalMemberVO.generalMemberEmail}">삭제</a></button>
</div>
</div>
<div>Email : ${generalMemberVO.additionalEmail}
<div>
<button><a href="/memberInfo/modify/delete-email-link/${generalMemberVO.generalMemberEmail}">삭제</a></button>
</div>
</div>
<div>Blog: ${generalMemberVO.blogUrl}
<div>
<button><a href="/memberInfo/modify/delete-blog-link/${generalMemberVO.generalMemberEmail}">삭제</a></button>
</div>
</div>
<div>
<a href="/memberInfo/modify/update-sns-link/${generalMemberVO.generalMemberEmail}">수정</a>

</div>
</body>
</html>