<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기 페이지</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>

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
		input, textarea { 
			padding: 10px;
		}
		.ck-editor__editable { height: 400px; }
	    .ck-content { font-size: 12px; }
	
	    #hashtag {
	      margin-top: 5px;
	    }	
	    .btn-group {
	    	margin-top: 420px;
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
			
			<label for = "postContent"> 내용 </label>
			<textarea name="postContent" id="editor"></textarea>
		        <script>
		          ClassicEditor.create( document.querySelector( '#editor' ), {
		                  language: "ko"
		                } );    
		        </script>
			<div class = "btn-group">
				<div class="right-align">
					<input type="submit" value="저장" />
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>