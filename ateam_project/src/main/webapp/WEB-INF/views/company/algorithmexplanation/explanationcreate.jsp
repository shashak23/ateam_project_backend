<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 해설 작성하기 | DevGround</title>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="/js/lib/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$.get("/code/알고리즘카테고리", function(response) {
			for (var i = 0; i < response.length; i++) {
				var code = response[i]
				var option = $("<option value='" +code.codeId+"'>"+code.codeContent+"</option>");
				$("#algorithm_category").append(option);
			}
		});
		
	    ClassicEditor.create( document.querySelector( '#editor' ), {
		   language: "ko"
		} );
	    
	    $("").keyup(function() {
	    	$.get("/")
	    })
	})
</script>
</head>
<style>
	body{
		width:1080px;
		height:1200px;
		margin: 0 auto;
	}
    .ck-editor__editable { 
        height: 600px; 
    }
    .ck-content { 
        font-size: 12px; 
    }

    div.grid {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 40px 70px 40px 70px 40px 1fr 40px;
    }

	.grid > .label{
		font-weight: 600;
	}

	#algorithm_category{
		height: 40px;	
		transition: box-shadow 0.3s ease;
	}

	#algorithm_category:hover {
   	 	border: 2px solid #1E90FF; 
	}

    div.grid > div.btn-group {
		display: grid;
        grid-column: 1 / 2;
        margin-top: 12px;
	}

    div.grid div.right-align {
		text-align: right;
	}

	.grid > .title{
		font-weight: bold;
	}

    #postTitle {
        width: 1fr;
        font-size: 12px;
        margin-bottom: 12px;
		height: 40px;
		transition: box-shadow 0.3s ease;
    }

	#postTitle:hover{
		border: 2px solid #1E90FF; 
	}

    input {
        padding: 0px;
        margin-bottom: 12px;		
    }
    select {
        margin-bottom: 10px;
        margin-right: 10px;
        width: 280px;
    }
    .label {
        margin-top: 10px;
        font-weight: bold;
    }

	.grid > .btn-group > .right-align > #submitButton{
		width:80px;
		height:40px;		
		border:none;
		border-radius: 10px;
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
	<h3>DevGround</h3>
	<form:form modelAttribute="algorithmExplanationVO" method="post">
		<div>
			<form:errors path="algorithmCategoryId" element="div" cssClass="errors"/>
			<form:errors path="postTitle" element="div" cssClass="errors"/>
			<form:errors path="postContent" element="div" cssClass="errors"/>
		</div>
		<div class="grid">
			
			<label class="label" for="algorithmCategoryId">알고리즘 카테고리</label>
			<select name="algorithmCategoryId" id="algorithm_category">
				<option value="">알고리즘 카테고리를 선택하세요</option>
			</select>
			<span class="title">제목</span>
			<input id="postTitle" type="text" name="postTitle" placeholder="  제목을 입력해 주세요."
                   value="${algorithmExplanationVO.postTitle}" />
            
            <label class="label" for="postContent">내용</label>
            <textarea name="postContent" id="editor">${algorithmExplanationVO.postContent}</textarea>
			
			<div class="btn-group">
                <div class="right-align">
                    <input id="submitButton" type="submit" value="등록" />
                </div>
            </div>
		</div>
	</form:form>
	
</body>
</html>