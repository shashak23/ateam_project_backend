<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/lib/jquery-3.7.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@ckeditor/ckeditor5-upload@34.0.0/src/index.min.js"></script>
	
<!-- 소스 다운 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

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
    
    input{  
	  font: 13px arial;
	  margin:10px;
	}
</style>
<script type="text/javascript">
$().ready(function(){
	var input = document.querySelector('input[name=hashtag]')
    new Tagify(input)
	
    let whitelist = ["Python","Java","Oracle","React","Vue.js","C","JavaScript", "CSS", "HTML", "Spring", "HTML", "Rudy", "MYSQL", "jQuery", "Angular", "C++"];

});
</script>
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
			 <textarea name="postContent" id="editor">${generalPostVO.postContent}</textarea>
		        <script>
		          ClassicEditor.create( document.querySelector( '#editor' ), {
		                  language: "ko"
		                } );    
		        </script></p>
			<div class = "btn-group">
				<div class="right-align">
					<input type="submit" value="저장" />
				</div>
			</div>
		</div>
	</form>
	
	<!-- 해시 태그 정보를 저장할 input 태그. (textarea도 지원) -->
	<h3>해시태그</h3>
	<input placeholder="해시태그를 입력하세요!" name="hashtag">
	
	<form action="/hashtag/post" method="post">
	    <!-- input 태그에 type hidden을 부여 -->
	    <input name='postTag' placeholder="해시태그를 입력하세요!" type="hidden">
	</form>

    </ul>
</body>
</html>