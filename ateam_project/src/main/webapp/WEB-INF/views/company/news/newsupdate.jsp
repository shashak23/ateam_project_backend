<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소식 게시글 수정하기</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
</head>
<style>
    .ck-editor__editable { 
        height: 400px; 
    }
    .ck-content { 
        font-size: 12px; 
    }

    div.grid {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 40px 1fr 1fr;
    }

    div.grid > div.btn-group {
		display: grid;
        grid-column: 1 / 2;
        margin-top: 12px;
	}

    div.grid div.right-align {
		text-align: right;
	}

    #postTitle {
        width: 1fr;
        font-size: 12px;
        margin-bottom: 12px;
    }
    input {
        padding: 0px;
        margin-bottom: 12px;
    }
    div.errors {
        background-color: #ff00004a;
        opacity: 0.8;
        padding: 10px;
        color: #333;
    }
    div.errors:last-child {
        margin-bottom: 15px;
    }
    
</style>
<body>
	<h3>기업소식 게시글 수정</h3>
	<form:form modelAttribute="CompanyNewsVO" method="post" 
	           enctype="multipart/form-data" action="/news/update">
	    <input type="hidden" name="companyNewsPostId" value="${companyNewsVO.companyNewsPostId}" />
		
		<div>
		    <form:errors path="postTitle" element="div" cssClass="errors" />
	        <form:errors path="postContent" element="div" cssClass="errors" />
		</div>
		<div class="grid">
		    
            <input id="postTitle" type="text" name="postTitle"
                   value="${companyNewsVO.postTitle}" />
            
            <input id="email" type="email" name="postWriter" value="test@test" />
            
            <label for="file">첨부파일</label>
            <div>
				<input id="file" type="file" name="file" />
				현재 업로드된 파일: ${companyNewsVO.originFileName}
			</div>
            
            <textarea name="postContent" id="editor">${companyNewsVO.postContent}</textarea>
            <script>
                ClassicEditor.create( document.querySelector( '#editor' ), {
                   language: "ko"
                } );
            </script>
            
            
            <div class="btn-group">
                <div class="right-align">
                    <input type="submit" value="수정" />
                </div>
            </div>
        </div>
	</form:form>

</body>
</html>