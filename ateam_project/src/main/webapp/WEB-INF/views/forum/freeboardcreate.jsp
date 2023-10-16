<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기 페이지</title>

<style type= "text/css">
		div.grid {
			display: grid;
			grid-template-columns: 80px 1fr;
			grid-template-rows: 28px 28px 28px 320px 1fr;
			row-gap: 10px;
		}

		div.grid > div.btn-group {
			display: grid;
			grid-column: 1 / 3;
		}

		div.grid div.right-align {
			text-align: right;
		}

		label {
			padding-left: 10px; 
		}
		button, input, textarea { 
			padding: 10px;
		}	
	</style>
<script>

</script>
</head>
<body>
	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1> 자유게시판의 게시글 작성 </h1>
	<form method = "post" >		
		<div class = "grid">
			<label for = "postTitle"> 제목 </label>
			<input id = "postTitle" type = "text" name="postTitle" />
			
			<!-- <label for = "postWriterId"> 이메일 </label>
			<input id = "postWriterId" type = "email" name = "postWriterId"/> -->
<!-- 
			<label for = "file"> 첨부파일 </label>
			<input id = "file" type = "file" name = "file" />
			 -->
			<label for = "postContent"> 내용 </label>
			<textarea id ="postContent" 
			name = "postContent" style = "height: 300px;"
			></textarea>
			
			<div class = "btn-group">
				<div class="right-align">
					<input type="submit" value="저장" />
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>