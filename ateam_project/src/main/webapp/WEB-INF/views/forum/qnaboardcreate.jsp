<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<style type= "text/css">

	div.grid div.right-align {
		text-align: right;
	}

	label {
		padding-left: 10px; 
		
	}
	
	#write-page > #editor{
	margin-top:10px;
	
	}
	textarea { 
		padding: 10px;
		margin-top:100px;
		width:500px;
		height:500px;
	}
	#write-page > input:first-child {
		
	}
	
	#write-page > input:2th-child(2) {
		position: absolute;
		top:500px;
	}
	.ck-editor__editable { height: 400px; }
    .ck-content { font-size: 12px; }
    
    #write-page > .hash{
    margin-top:50px;
    }

   
    .btn-group {
    width:70px;
    height:70px;
    margin-left:600px;
    }	
</style>
</head>
<body>
	<jsp:include page="../member/membermenu.jsp"></jsp:include>

	<h1> 질답게시판의 작성 페이지</h1>
	<form name="generalPostVO" method = "post">		
		<div id="write-page">
			<label for = "postTitle"> 제목 </label>
			<input id = "postTitle" type = "text" name="postTitle" 
					value="${generalPostVO.postTitle}"/>
			<p><label for = "postContent"> 내용 </label>
			 <textarea name="text" id="editor" value="${generalPostVO.postContent}"></textarea>
		        <script>
		          ClassicEditor.create( document.querySelector( '#editor' ), {
		                  language: "ko"
		                } );    
		        </script></p>
		        
		   <div class="hash"> 
		    <label for="hashTag" >해시태그</label>
		    <input id="hashTag" type="text" name="hashTag" />
		   </div>
			<div class = "btn-group">
				<div class="right-align">
					<input type="submit" value="저장" />
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>