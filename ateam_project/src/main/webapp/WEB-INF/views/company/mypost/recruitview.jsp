<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>기업 채용 게시글 조회</h1>
	<form name="companyRecruitVO" method="post">
		<div class="grid">
			<label for="postTitle">제목</label>
			<div>${companyRecruitVO.postTitle}</div>
			
			<label for="postContent">이메일</label>
			<div>${companyRecruitVO.postWriter}</div>
			
			<label for="postTitle">조회수</label>
			<div>${companyRecruitVO.viewCnt}</div>
			
			<label for="postTitle">등록일</label>
			<div>${companyRecruitVO.postDate}</div>
			
			<label for="postTitle">내용</label>
			<div>${companyRecruitVO.postContent}</div>
			
				<div class="btn-group">
					<div class="right-align">
	       				<c:if test="${not empty sessionScope._LOGIN_USER_ && sessionScope._LOGIN_USER_.email eq memberVO.email}">
						<div class="update_btn">
							<div class="btn">
								<a href="/recruit/update/${companyRecruitVO.companyRecruitPostId}">수정</a>
								<a href="/recruit/delete/${companyRecruitVO.companyRecruitPostId}">삭제</a>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</form>
</body>
</html>