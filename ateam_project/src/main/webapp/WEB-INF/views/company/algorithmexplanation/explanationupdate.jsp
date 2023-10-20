<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알고리즘 해설 수정하기</title>
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
		// 이전에 선택한 select option 불러오기
        $("select[name=algorithmCategoryId]").val("${algorithmExplanationVO.commonCodeVO.codeId}")
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
    .ck-editor__editable { 
        height: 400px; 
    }
    .ck-content { 
        font-size: 12px; 
    }

    div.grid {
        display: grid;
        grid-template-columns: 1fr;
        grid-template-rows: 40px 40px 40px 40px 1fr 40px;
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
    select {
        margin-bottom: 10px;
        margin-right: 10px;
        width: 280px;
    }
    .label {
        margin-top: 10px;
        font-weight: bold;
    }
</style>
<body>
	<h3>알고리즘 해설 수정</h3>
	<form:form modelAttribute="algorithmExplanationVO" method="post"
	           action="/algorithm/explanation/update">
	    <input type="hidden" name="companyAlgorithmExplanationId" value="${algorithmExplanationVO.companyAlgorithmExplanationId}" />
		<div class="grid">
			<label class="label" for="algorithmCategoryId">알고리즘 카테고리</label>
			<select name="algorithmCategoryId" id="algorithm_category">
				<option value="">알고리즘 카테고리를 선택하세요</option>
			</select>
			
			<input id="postTitle" type="text" name="postTitle"
                   value="${algorithmExplanationVO.postTitle}" />
            
            <label class="label" for="postContent">내용</label>
            <textarea name="postContent" id="editor">${algorithmExplanationVO.postContent}</textarea>
			
			<div class="btn-group">
                <div class="right-align">
                    <input type="submit" value="수정" />
                </div>
            </div>
		</div>
	</form:form>
</body>
</html>