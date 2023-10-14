<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 문제 수정하기</title>
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
        grid-template-rows: 40px 40px 40px 1fr 40px 1fr 1fr;
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
    label {
        margin-top: 10px;
    }
</style>
<body>
	<h3>알고리즘 문제 수정</h3>
	<form:form modelAttribute="AlgorithmQuestionVO" method="post"
	           action="/algorithm/question/update">
	    <input type="hidden" name="companyAlgorithmQuestionId" value="${algorithmQuestionVO.companyAlgorithmQuestionId}" />
		<div class="grid">
		    
            <input id="algorithmTitle" type="text" name="algorithmTitle"
                   value="${algorithmQuestionVO.algorithmTitle}" />
            
            <input id="email" type="email" name="algorithmWriter" value="test@test" />
            
            <label for="algorithmContent">문제내용</label>
            <textarea name="algorithmContent" id="editor">${algorithmQuestionVO.algorithmContent}</textarea>
            <script>
			    ClassicEditor.create( document.querySelector( '#editor' ), {
			       language: "ko"
			    } );
			</script>
            
            <label for="algorithmSolution">문제풀이</label>
            <textarea name="algorithmSolution" id="editor2">${algorithmQuestionVO.algorithmSolution}</textarea>
            <script>
			    ClassicEditor.create( document.querySelector( '#editor2' ), {
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