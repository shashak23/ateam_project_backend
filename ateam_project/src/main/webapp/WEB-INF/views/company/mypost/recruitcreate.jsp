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
<%-- 	<jsp:include page="../member/membermenu.jsp"></jsp:include>
 왜 안되지? --%>
	<h1> 기업 채용 게시판의 작성 페이지</h1>
	<form name="companyRecruitVO" method = "post">		
		<div id="write-page">
			<label for = "postTitle"> 제목 </label>
			<input id = "postTitle" type = "text" name="postTitle" 
					value="${companyRecruitVO.postTitle}"/>
			
			<lable for = "recruitEndDate">마감날짜</lable>			
			<input type="date" value=${companyRecruitVO.recruitEndDate}/>
			
			<label for = "postContent"> 내용 </label>
			 <textarea name="postContent" id="editor">${companyRecruitVO.postContent}</textarea>
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