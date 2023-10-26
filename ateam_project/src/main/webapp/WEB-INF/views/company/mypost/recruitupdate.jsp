<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>

</head>
<body>
	<h1>게시글 수정 ${companyRecruitVO.companyRecruitPostId}번글</h1>
	
	<form method="post" action="/recruit/update/${companyRecruitPostId}" modelAttribute="companyRecruitVO">
		<input type="hidden" name="companyRecruitId" value="${companyRecruitVO.companyRecruitPostId}"/>
		<div class="grid">
		
			<label for="postTitle" >제목</label>
			<input id="postTitle" type="text" name="postTitle" value="${companyRecruitVO.postTitle}" />
		
			<label for="viewCnt" >조회수</label>
			<input id="viewCnt" type="text" name="viewCnt" value="${companyRecruitVO.viewCnt}" />
		
			<label for="recruitStartDate" >채용 시작일</label>
			<input id="recruitStartDate" type="text" name="recruitStartDate" value="${companyRecruitVO.recruitStartDate}" />
		
			<label for="recruitEndDate" >채용 마감일</label>
			<input id="recruitEndDate" type="text" name="postTitle" value="${companyRecruitVO.recruitEndDate}" />
		
			<label for="postDate" >작성일</label>
			<input id="postDate" type="text" name="postDate" value="${companyRecruitVO.postDate}" />
		
			<label for="postContent" >내용</label>
			<textarea name="postContent" id="editor">${companyRecruitVO.postContent}</textarea>
		        <script>
		          ClassicEditor.create( document.querySelector( '#editor' ), {
		                  language: "ko"
		                } );
		        </script>
		    <div class="btn-group">
				<div class="right-align">
					<input type="submit" value="저장" />
				</div>
			</div>
		</div>
	</form>
</body>
</html>